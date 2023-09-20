use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Quaternion;

use GLib::Roles::Implementor;

# cw: Might want to move this to GLib!
constant is-us = (%*ENV<LOCAL> // '') eq 'en_US'          ||
                 (%*ENV<LANG>  // '').contains('en_US');

class X::Graphene::Quaternion::UnknownTransformable is Exception {
  has $!type;

  method message {
    "Cannot create a Graphene::Quaternion from an object of type {
     $!type.^name }";
  }
}

class X::Graphene::Quaternion::BadAnglePref is Exception {
  has $.wtf-angle;

  method message {
    "Unknown angle measurement of '{ $!wtf-angle }' requested, {
     '' } please use 'degrees' or 'radians'!"
  }

  method new ($wtf-angle) {
    self.bless( :$wtf-angle );
  }
}

# BOXED

enum pc <DEG RAD>;

my $preferred;

multi sub setPreferredAngles ($ where 'd' | 'deg' | 'degree' | 'degrees' ) {
  $preferred = DEG;
}

multi sub setPreferredAngles ($ where 'r' | 'rad' | 'radian' | 'radians' ) {
  $preferred = RAD;
}

multi sub setPreferredAngles ($p) {
  X::Graphene::Quaternion::BadAnglePref.new($p).throw;
}

class Graphene::Quaternion {
  has graphene_quaternion_t $!gq is implementor;

  submethod BUILD ( :$graphene-quaternion ) {
    $!gq = $graphene-quaternion if $graphene-quaternion
  }

  method Graphene::Raw::Definitions::graphene_quaternion_t
    is also<
      GrapheneQuaternion
      graphene_quaternion_t
      graphene-quaternion-t
    >
  { $!gq }

  method init (
    graphene_quaternion_t $q,
    Num()                 $x,
    Num()                 $y,
    Num()                 $z,
    Num()                 $w
  )
    is static
  {
    my gfloat ($xx, $yy, $zz, $ww) = ($x, $y, $z, $w);

    graphene_quaternion_init($q, $xx, $yy, $zz, $ww);
  }

  multi method new ($x, $y, $z, $w ) is static {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init($q, $x, $y, $z, $w);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_from_angle_vec3 (
    graphene_quaternion_t $q,
    Num()                 $angle,
    graphene_vec3_t()     $axis
  )
    is static
    is also<init-from-angle-vec3>
  {
    my gfloat $a = $angle;

    graphene_quaternion_init_from_angle_vec3($q, $a, $axis);
  }

  multi method new ($angle, $axis) {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_from_angle_vec3($q, $angle, $axis);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_from_angles (
    graphene_quaternion_t $q,
    Num()                 $deg_x,
    Num()                 $deg_y,
    Num()                 $deg_z
  )
    is also<init-from-angles>
  {
    my gfloat ($x, $y, $z) = ($deg_x, $deg_y, $deg_z);

    graphene_quaternion_init_from_angles($q, $x, $y, $z);
  }

  multi method new ($x, $y, $z, :d(:deg(:$degrees)) is required) {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_from_angles($q, $x, $y, $z);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_from_euler (
    graphene_quaternion_t $q,
    graphene_euler_t()     $e
  )
    is also<init-from-euler>
  {
    graphene_quaternion_init_from_euler($q, $e);
  }

  multi method new (graphene_euler_t() $e, :e(:$euler) is required) {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_from_euler($q, $e);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_from_matrix (
    graphene_quaternion_t $q,
    graphene_matrix_t()   $m
  )
    is also<init-from-matrix>
  {
    graphene_quaternion_init_from_matrix($q, $m);
  }

  multi method new ( graphene_matrix_t() $m, :m(:$matrix) is required ) {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_from_matrix($q, $m);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_from_quaternion (
    graphene_quaternion_t   $q,
    graphene_quaternion_t() $src
  ) {
    graphene_quaternion_init_from_quaternion($q, $src);
  }

  method init_from_radians (
    graphene_quaternion_t $q,
    Num()                 $rad_x,
    Num()                 $rad_y,
    Num()                 $rad_z
  )
    is also<init-from-radians>
  {
    my gfloat ($x, $y, $z) = ($rad_x, $rad_y, $rad_z);

    graphene_quaternion_init_from_radians($q, $x, $y, $z);
  }

  multi method new (
    Num()  $rad_x,
    Num()  $rad_y,
    Num()  $rad_z,
          :r(:rad(:$radians))
  )
    is static
  {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_from_radians($q, $rad_x, $rad_y, $rad_z);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_from_vec4 (
    graphene_quaternion_t $q,
    graphene_vec4_t()     $src
  )
    is also<init-from-vec4>
  {
    graphene_quaternion_init_from_vec4($q, $src);
  }

  multi method new ( graphene_vec4_t() $src, :v4(:$vec4) is required)
    is static
  {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_from_vec4($q, $src);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  method init_identity ( graphene_quaternion_t $q )
    is static

    is also<init-identity>
  {
    graphene_quaternion_init_identity($q);
  }

  multi method new ($x, $y, $z) {
    return samewith($x, $y, $z, :deg) if is-us     || $preferred ~~ DEG;
    return samewith($x, $y, $z, :rad) if is-us.not || $preferred ~~ RAD;
  }

  # cw: Also might be better in a more global location.
  sub is-initable($q, $t) {
    $q ~~ ::($t) or $q.^can($t)
  }

  multi method new ($q) {
    return samewith($q, :matrix) if $q.&is-initable('graphene_matrix_t');
    return samewith($q, :vec4)   if $q.&is-initable('graphene_vec4_t');
    return samewith($q, :euler)  if $q.&is-initable('graphene_euler_t');

    X::Graphene::Quaternion::UnknownTransformable.new(
      type => $q.WHAT
    ).throw;
  }

  multi method new ( :i(:ident(:$identity)) )
    is static
  {
    my $q = ::?CLASS.alloc;

    ::?CLASS.init_identity($q);

    $q ?? self.bless( graphene-quaternion => $q ) !! Nil;
  }

  proto method add (|)
  { * }

  multi method add ($b, :$raw = False) {
    my $r = ::?CLASS.alloc;

    samewith($b, $r);
    $raw ?? $r !! self.bless( graphene-quaternion => $r );
  }
  multi method add (
    graphene_quaternion_t() $b,
    graphene_quaternion_t() $res
  ) {
    graphene_quaternion_add($!gq, $b, $res);
  }

  method alloc is static {
    graphene_quaternion_alloc();
  }

  method dot (graphene_quaternion_t() $b) {
    graphene_quaternion_dot($!gq, $b);
    self;
  }

  method equal (graphene_quaternion_t() $b) {
    so graphene_quaternion_equal($!gq, $b);
  }

  method free {
    graphene_quaternion_free($!gq);
  }

  multi method invert ( :$raw = False ) {
    my $r = ::?CLASS.alloc;

    samewith($r);
    $r = ::?CLASS.new($r) unless $raw;
    $r;
  }
  multi method invert (graphene_quaternion_t $r) {
    graphene_quaternion_invert($!gq, $r);
  }

  multi method multiply (graphene_quaternion_t() $b, :$raw = False) {
    my $r = ::?CLASS.alloc;

    samewith($b, $r);
    $raw ?? $r !! self.bless( graphene-quaternion => $r );
  }
  multi method multiply (
    graphene_quaternion_t $b,
    graphene_quaternion_t $res
  ) {
    graphene_quaternion_multiply($!gq, $b, $res);
  }

  multi method normalize ( :$raw = False ) {
    my $r = ::?CLASS.alloc;
    samewith($r);
    $r = ::?CLASS.new($r) unless $raw;
    $r;
  }
  multi method normalize (graphene_quaternion_t $r) {
    graphene_quaternion_normalize($!gq, $r);
  }

  multi method scale ($factor, :$raw = False) {
    my $r = ::?CLASS.alloc;

    samewith($factor, $r);
    $raw ?? $r !! self.bless( graphene-quaternion => $r );
  }
  multi method scale (
    Num()                 $factor,
    graphene_quaternion_t $res
  ) {
    my gfloat $f = $factor;

    graphene_quaternion_scale($!gq, $f, $res);
  }

  multi method slerp ($b, $factor, :$raw = False) {
    my $r = ::?CLASS.alloc;

    samewith($b, $r);
    $raw ?? $r !! self.bless( graphene-quaternion => $r );
  }
  multi method slerp (
    graphene_quaternion_t() $b,
    Num()                   $factor,
    graphene_quaternion_t   $res
  ) {
    my gfloat $f = $factor;

    graphene_quaternion_slerp($!gq, $b, $f, $res);
  }

  proto method to_angle_vec3 (|)
    is also<to-angle-vec3>
  { * }

  multi method to_angle_vec3 ( :$raw = False ) {
    my ($v3, $a) = (Graphene::Vec3.alloc);

    samewith($a, $v3);
    $v3 = Graphene::Vec3.new($v3) unless $raw;
    ($a, $v3);
  }
  multi method to_angle_vec3 (
                      $angle is rw,
    graphene_vec3_t() $axis
  ) {
    my gfloat $a = 0e0;

    graphene_quaternion_to_angle_vec3($!gq, $a, $axis);
    $angle = $a;
  }

  proto method to_angles (|)
    is also<to-angles>
  { * }

  multi method to_angles {
    samewith($, $, $);
  }
  multi method to_angles (
    $deg_x is rw,
    $deg_y is rw,
    $deg_z is rw
  ) {
    my gfloat ($x, $y, $z) = 0e0 xx 3;

    graphene_quaternion_to_angles($!gq, $x, $y, $z);
    ($deg_x, $deg_y, $deg_z) = ($x, $y, $z);
  }

  proto method to_matrix (|)
    is also<to-matrix>
  { * }

  multi method to_matrix ( :$raw = False ) {
    my $m = Graphene::Matrix.alloc;
    samewith($m);
    $m = Graphene::Matrix.new($m) unless $raw;
    $m;
  }
  multi method to_matrix (graphene_matrix_t $m) {
    graphene_quaternion_to_matrix($!gq, $m);
  }

  proto method to_radians (|)
    is also<to-radians>
  { * }

  multi method to_radians {
    samewith($, $, $);
  }
  multi method to_radians (
    $rad_x is rw,
    $rad_y is rw,
    $rad_z is rw
  ) {
    my gfloat ($x, $y, $z) = 0e0 xx 3;

    graphene_quaternion_to_radians($!gq, $x, $y, $z);
    ($rad_x, $rad_y, $rad_z) = ($x, $y, $z);
  }

  proto method to_vec4 (|)
    is also<to-vec4>
  { * }

  multi method to_vec4 ( :$raw = False ) {
    my $v4 = Graphene::Vec4.alloc;

    samewith($v4);
    $v4 = Graphene::Vec4.new($v4) unless $raw;
    $v4;
  }

  multi method to_vec4 (graphene_vec4_t() $res) {
    graphene_quaternion_to_vec4($!gq, $res);
  }

}
