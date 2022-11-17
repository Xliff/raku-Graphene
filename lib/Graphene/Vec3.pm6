use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Vec3;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Graphene::Vec3 {
  has graphene_vec3_t $!gv3 is implementor;
  has                 $!lib is built;

  submethod BUILD ( :$graphene-vec3, :$!lib ) {
    $!gv3 = $graphene-vec3 if $graphene-vec3;
  }

  method Graphene::Raw::Definitions::graphene_vec3_t

    is also<Graphene::Raw::Definitions::graphene-vec3-t>
  { $!gv3 }

  multi method new (
    graphene_vec3_t  $graphene-vec3,
                    :$ref            = True,
                    :$lib            = False
  ) {
    return Nil unless $graphene-vec3;

    my $o = self.bless( :$graphene-vec3 );
    return $o if $lib;
    $o.ref if $ref;
    $o;
  }
  multi method new (Num() $x, Num() $y, Num() $z) {
    my $graphene-vec3 = self.alloc;
    return Nil unless $graphene-vec3;
    ::?CLASS.init($graphene-vec3, $x, $y, $z);
    self.bless( :$graphene-vec3 );
  }
  multi method new ($src) {
    my $graphene-vec3 = self.alloc;
    return Nil unless $graphene-vec3;
    ::?CLASS.init_from_float($graphene-vec3, $src);
    self.bless( :$graphene-vec3 );
  }

  multi method add (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw)
  }
  multi method add (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_add($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method alloc is static {
    graphene_vec3_alloc();
  }

  multi method cross (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method cross (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_cross($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method divide (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method divide (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_divide($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method dot (graphene_vec3_t() $b) {
    graphene_vec3_dot($!gv3, $b);
  }

  method equal (graphene_vec3_t() $v2) {
    so graphene_vec3_equal($!gv3, $v2);
  }

  method free {
    graphene_vec3_free($!gv3);
  }

  method get_x is also<get-x> {
    graphene_vec3_get_x($!gv3);
  }

  proto method get_xy (|)
    is also<get-xy>
  { * }

  multi method get_xy ( :$raw =  False ) is also<xy> {
    samewith( Graphene::Vec2.alloc, :$raw = False )
  }
  multi method get_xy (graphene_vec2_t() $res, :$raw = False) {
    graphene_vec3_get_xy($!gv3, $res);
    propReturnObject($res, $raw, |Graphene::Vec2.getTypePair)
  }

  proto method get_xy0 (|)
    is also<get-xy0>
  { * }

  multi method get_xy0 ( :$raw = False ) is also<xy0> {
    samewith( Graphene::Vec3.alloc, :$raw );
  }
  multi method get_xy0 (graphene_vec3_t() $res, :$raw =  False) {
    graphene_vec3_get_xy0($!gv3, $res);
    propReturnObject($res, $raw, |self.getTypePair)
  }

  proto method get_xyz0 (|)
    is also<get-xyz0>
  { * }

  multi method get_xyz0 is also<xyz0> {
    samewith( ::('Graphene::Vec4').alloc );
  }
  multi method get_xyz0 (graphene_vec4_t() $res, :$raw = False) {
    graphene_vec3_get_xyz0($!gv3, $res);
    propReturnObject( $res, $raw, ::('Graphene::Vec4').getTypePair );
  }

  proto method get_xyz1 (|)
    is also<get-xyz1>
  { * }

  multi method get_xyz1 ( :$raw = False ) is also<xyz1> {
    samewith( ::('Graphene::Vec4').alloc );
  }
  multi method get_xyz1 (graphene_vec4_t() $res, :$raw = False) {
    graphene_vec3_get_xyz1($!gv3, $res);
    propReturnObject( $res, $raw, ::('Graphene::Vec4').getTypePair );
  }

  proto method get_xyzw (|)
    is also<get-xyzw>
  { * }

  multi method get_xyzw (Num() $w, :$raw = False) is also<xyzw> {
    samewith($w, ::('Graphene::Vec4').alloc, :$raw);
  }
  multi method get_xyzw (
    Num()              $w,
    graphene_vec4_t()  $res,
                      :$raw  = False
  ) {
    my gfloat $ww = $w;
    graphene_vec3_get_xyzw($!gv3, $ww, $res);
    propReturnObject( $res, $raw, |::('Graphene::Vec4').getTypePair );
  }

  method get_y
    is also<
      get-y
      y
    >
  {
    graphene_vec3_get_y($!gv3);
  }

  method get_z
    is also<
      get-z
      z
    >
  {
    graphene_vec3_get_z($!gv3);
  }

  multi method init (
    Num()           $x,
    Num()           $y,
    Num()           $z
  ) {
    if $!lib {
      warn 'Cannot use init functions on a library-owned vector!';
      return;
    }
    ::?CLASS.init($!gv3, $x, $y, $z);
  }
  multi method init (
    graphene_vec3_t() $vec,
    Num()             $x,
    Num()             $y,
    Num()             $z
  )
    is static
  {
    my gfloat ($xx, $yy, $zz) = ($x, $y, $z);
    graphene_vec3_init($!gv3, $xx, $yy, $zz);
  }

  proto method init_from_float (|)
    is also<init-from-float>
  { * }

  multi method init_from_float ($src) {
    if $!lib {
      warn 'Cannot use init functions on a library-owned vector!';
      return;
    }
    ::?CLASS.init_from_float($!gv3, $src);
  }
  multi method init_from_float (
    graphene_vec3_t $vec,
                    $src is copy
  )
    is static
  {
    $src = do given $src {
      when .can('Array')  { $_ .= Array unless $_ ~~ Array;   proceed }

      when Array {
        X::GLib::InvalidSize.new(
          message => '$src does not have the correct number of items'
        ).throw unless .elems == 3;

        $_ = ArrayToCArray(gfloat, $src);
        proceed
      }

      when CArray[gfloat] { $_ }

      default {
        X::GLib::UnknownType.new(
          message => '$src is not Array-compatible'
        ).throw;
      }
    }

    graphene_vec3_init_from_float($!gv3, $src);
  }

  proto method init_from_vec3 (|)
    is also<init-from-vec3>
  { * }

  multi method init_from_vec3 (graphene_vec3_t() $src) {
    if $!lib {
      warn 'Cannot use init functions on a library-owned vector!';
      return;
    }
    ::?CLASS.init_from_vec3($!gv3, $src);
  }
  multi method init_from_vec3 (
    graphene_vec3_t() $vec,
    graphene_vec3_t() $src
  )
    is static
  {
    graphene_vec3_init_from_vec3($vec, $src);
  }

  multi method interpolate (
    graphene_vec3_t()  $v2,
    Num()              $factor,
                      :$raw     = False
  ) {
    samewith($v2, $factor, self.alloc, :$raw);
  }
  multi method interpolate (
    graphene_vec3_t()  $v2,
    Num()              $factor,
    graphene_vec3_t()  $res,
                      :$raw     = False
  ) {
    my gdouble $f = $factor;

    graphene_vec3_interpolate($!gv3, $v2, $factor, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method length {
    graphene_vec3_length($!gv3);
  }

  multi method max (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method max (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_max($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method min (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method min (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_min($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method multiply (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method multiply (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_multiply($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method near (
    graphene_vec3_t() $v2,
    Num()             $epsilon
  ) {
    my gfloat \ε = $epsilon;

    so graphene_vec3_near($!gv3, $v2, ε);
  }

  multi method negate ( :$raw = False ) {
    samewith(self.alloc, :$raw)
  }
  multi method negate (graphene_vec3_t() $res, :$raw = False) {
    graphene_vec3_negate($!gv3, $res);
    propReturnObject($res, $raw, |self.getTypePair)
  }

  multi method normalize ( :$raw = False ) {
    samewith(self.alloc, :$raw);
  }
  multi method normalize (graphene_vec3_t() $res, :$raw = False) {
    graphene_vec3_normalize($!gv3, $res);
  }

  multi method scale (Num() $factor, :$raw = False) {
    samewith($factor, self.alloc, :$raw);
  }
  multi method scale (
    Num()              $factor,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    my gfloat $f = $factor;

    graphene_vec3_scale($!gv3, $f, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method subtract (graphene_vec3_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method subtract (
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $res,
                      :$raw = False
  ) {
    graphene_vec3_subtract($!gv3, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  proto method to_float (|)
    is also<to-float>
  { * }

  multi method to_float {
    samewith( CArray[gfloat].allocate(3) )
  }
  multi method to_float (CArray[gfloat] $dest) {
    graphene_vec3_to_float($!gv3, $dest);
  }

  # cw: The remaining methods return static data.

  method x_axis is also<x-axis> {
    my $graphene-vec3 = graphene_vec3_x_axis();

    $graphene-vec3 ?? self.bless( :$graphene-vec3, :lib ) !! Nil;
  }

  method y_axis is also<y-axis> {
    my $graphene-vec3 = graphene_vec3_y_axis();

    $graphene-vec3 ?? self.bless( :$graphene-vec3, :lib ) !! Nil;
  }

  method z_axis is also<z-axis> {
    my $graphene-vec3 = graphene_vec3_z_axis();

    $graphene-vec3 ?? self.bless( :$graphene-vec3, :lib ) !! Nil;
  }

  method zero {
    my $graphene-vec3 = graphene_vec3_zero();

    $graphene-vec3 ?? self.bless( :$graphene-vec3, :lib ) !! Nil;

  }

  method one {
    my $graphene-vec3 = graphene_vec3_one();

    $graphene-vec3 ?? self.bless( :$graphene-vec3, :lib ) !! Nil;
  }

}
