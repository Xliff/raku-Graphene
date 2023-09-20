use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Plane;

use GLib::Roles::Implementor;

# BOXED

class Graphene::Plane {
  has graphene_plane_t $!gp is implementor;

  submethod BUILD ( :$graphene-plane ) {
    $!gp = $graphene-plane if $graphene-plane;
  }

  method Graphene::Raw::Types::graphene_plane_t

    is also<Graphene::Raw::Types::graphene-plane-t>
  { $!gp }

  method alloc is static {
    graphene_plane_alloc();
  }

  method distance ( graphene_point3d_t() $point ) {
    graphene_plane_distance($!gp, $point);
  }

  method equal ( graphene_plane_t() $b ) {
    so graphene_plane_equal($!gp, $b);
  }

  method free {
    graphene_plane_free($!gp);
  }

  method get_constant is also<get-constant> {
    graphene_plane_get_constant($!gp);
  }

  proto method get_normal (|)
    is also<get-normal>
  { * }

  multi method get_normal (:$raw = False) {
    my $r = Graphene::Vec3.alloc;
    samewith($r);
    $r = Graphene::Vec3.new($r) unless $raw;
    $r;
  }
  multi method get_normal (graphene_vec3_t() $normal) {
    graphene_plane_get_normal($!gp, $normal);
  }

  proto method init_from_plane (|)
    is also<init-from-plane>
  { * }

  multi method init_from_plane (graphene_plane_t $src, :$raw = False) {
    my $r = ::?CLASS.alloc;
    samewith($r, $src);
    $r = ::?CLASS.new($r) unless $raw;
    $r;
  }
  multi method init_from_plane (graphene_plane_t $src, graphene_plane_t $r)
    is static
  {
    graphene_plane_init_from_plane($r, $src);
  }

  multi method new {
    my $graphene-plane = ::?CLASS.alloc;

    $graphene-plane ?? self.bless( :$graphene-plane ) !! Nil;
  }

  multi method new ($p) {
    return samewith($p, :self)
      if $p.&is-initable('graphene_plane_t');

    return samewith($p, :vec4)
      if $p.&is-initable('graphene_vec4_t');

    X::Graphene::Error.new(
      "Cannot initialize a graphene_plane from a { $p.^name }"
    ).throw;
  }

  multi method new (
    graphene_plane_t()  $graphene-plane,
                       :s(:$self)        is required
  ) {
    $graphene-plane ?? self.bless( :$graphene-plane ) !! Nil;
  }

  method init_from_vec4 (graphene_vec4_t()  $src) is also<init-from-vec4> {
    graphene_plane_init_from_vec4($!gp, $src);
  }

  multi method new ($s, :v4(:$vec4) is required) {
    my $graphene-plane = self.init_from_vec4($s);

    $graphene-plane ?? self.bless( :$graphene-plane ) !! Nil;
  }

  multi method new ($normal, $constant, :$vec3 is required) {
    my $graphene-plane = self.init($normal, $constant);

    $graphene-plane ?? self.bless( :$graphene-plane ) !! Nil;
  }

  method init (
    graphene_vec3_t()  $normal,
    Num()              $constant
  ) {
    my gfloat $c = $constant;

    graphene_plane_init($!gp, $normal, $constant);
  }

  multi method new ($normal, $p, :p(:$point) is required) {
    my $graphene-plane = self.init_from_point($normal, $p);

    $graphene-plane ?? self.bless( :$graphene-plane ) !! Nil;
  }

  method init_from_point (
    graphene_vec3_t()    $normal,
    graphene_point3d_t() $point
  )
    is also<init-from-point>
  {
    graphene_plane_init_from_point($!gp, $normal, $point);
  }

  multi method new ($a, $b) {
    return samewith($a, $b, :point)
      if $b.&is-initable('graphene_point_3d_t');

    return samewith($a, $b, :vec3)
      if $b.&is-initable('Num');

    X::Graphene::Error.new(
      "Do not know how to create a Plane from a 2-argument {
        '' } constructor where the arguments are ({
        ($a, $b).map( *.^name ).join(', ') })"
    ).throw;
  }

  method init_from_points (
    graphene_point3d_t() $a,
    graphene_point3d_t() $b,
    graphene_point3d_t() $c
  )
    is also<init-from-points>
  {
    graphene_plane_init_from_points($!gp, $a, $b, $c);
  }

  multi method new ($a, $b, $c) {
    my $graphene-plane = self.init_from_points($a, $b, $c);

    $graphene-plane ?? self.bless( :$graphene-plane ) !! Nil;
  }

  multi method negate ( :$raw = False ) {
    my $r = ::?CLASS.alloc;
    samewith($r);
    $r = ::?CLASS.new($r) unless $raw;
    $r;
  }
  multi method negate (graphene_plane_t $res) {
    graphene_plane_negate($!gp, $res);
  }

  multi method normalize ( :$raw = False ) {
    my $r = ::?CLASS.alloc;
    samewith($r);
    $r = ::?CLASS.new($r) unless $raw;
    $r;
  }
  multi method normalize (graphene_plane_t $res) {
    graphene_plane_normalize($!gp, $res);
  }

  multi method transform (
    graphene_matrix_t()  $matrix,
    graphene_matrix_t()  $normal_matrix,
                        :$raw            = False
  ) {
    my $r = ::?CLASS.alloc;
    samewith($matrix, $normal_matrix, $r);
    $r = ::?CLASS.new($r) unless $raw;
    $r;
  }
  multi method transform (
    graphene_matrix_t() $matrix,
    graphene_matrix_t() $normal_matrix,
    graphene_plane_t    $res
  ) {
    graphene_plane_transform($!gp, $matrix, $normal_matrix, $res);
  }

}
