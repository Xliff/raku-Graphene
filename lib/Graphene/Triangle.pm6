use v6.c;

use NativeCall;

use Graphene::Raw::Types;
use Graphene::Raw::Triangle;

use GLib::Roles::Implementor;

class Graphene::Triangle {
  has graphene_triangle_t $!gt is implementor;

  submethod BUILD ( :$graphene-triangle ) {
    $!gt = $graphene-triangle if $graphene-triangle;
  }

  method Graphene::Raw::Definitions::graphene-triangle-t
  { $!gt }

  multi method new ($a, $b, $c) {
    my $graphene-triangle = ::?CLASS.init_from_float(self.alloc, $a, $b, $c);

    $graphene-triangle ?? self.bless( :$graphene-triangle ) !! Nil;
  }
  multi method new (
    graphene_point3d_t()  $a,
    graphene_point3d_t()  $b,
    graphene_point3d_t()  $c,
                         :point(:$points) is required
  ) {
    my $graphene-triangle = ::?CLASS.init_from_points(self.alloc, $a, $b, $c);

    $graphene-triangle ?? self.bless( :$graphene-triangle ) !! Nil;
  }
  multi method new (
    graphene_vec3_t()     $a,
    graphene_vec3_t()     $b,
    graphene_vec3_t()     $c,
                         :vec3(:$vec) is required
  ) {
    my $graphene-triangle = ::?CLASS.init_from_vec3(self.alloc, $a, $b, $c);

    $graphene-triangle ?? self.bless( :$graphene-triangle ) !! Nil;
  }

  method alloc {
    graphene_triangle_alloc();
  }

  method contains_point (graphene_point3d_t() $p) {
    so graphene_triangle_contains_point($!gt, $p);
  }

  method equal (graphene_triangle_t() $b) {
    so graphene_triangle_equal($!gt, $b);
  }

  method free {
    graphene_triangle_free($!gt);
  }

  method get_area {
    graphene_triangle_get_area($!gt);
  }

  proto method get_barycoords (|)
  { * }

  multi method get_barycoords (graphene_point3d_t() $p, :$raw = False) {
    samewith($p, Graphene::Vec2.alloc, :$raw);
  }
  multi method get_barycoords (
    graphene_point3d_t()  $p,
    graphene_vec2_t()     $res,
                         :$raw  = False
  ) {
    graphene_triangle_get_barycoords($!gt, $p, $res);
    propReturnObject($res, $raw, |Graphene::Vec2.getTypePair);
  }

  proto method get_bounding_box (|)
  { * }

  multi method get_bounding_box ( :$raw = False ) {
    samewith( Graphene::Box.alloc, :$raw );
  }
  multi method get_bounding_box (graphene_box_t() $res, :$raw = False) {
    graphene_triangle_get_bounding_box($!gt, $res);
    propReturnObject($res, $raw, |Graphene::Box.getTypePair);
  }

  proto method get_midpoint (|)
  { * }

  multi method get_midpoint ( :$raw = False ) {
    samewith( Graphene::Point3d.alloc )
  }
  multi method get_midpoint (graphene_point3d_t() $res, :$raw = False) {
    graphene_triangle_get_midpoint($!gt, $res);
    propReturnObject($res, $raw, |Graphene::Point3d.getTypePair)
  }

  proto method get_normal (|)
  { * }

  multi method get_normal ( :$raw = False ) {
    samewith( Graphene::Vec3.alloc );
  }
  multi method get_normal (graphene_vec3_t() $res, :$raw = False) {
    graphene_triangle_get_normal($!gt, $res);

    propReturnObject($res, $raw, |Graphene::Vec3.getTypePair);
  }

  proto method get_plane (|)
  { * }

  multi method get_plane ( :$raw = False ) {
    samewith( Graphene::Plane.alloc, :$raw );
  }
  multi method get_plane (graphene_plane_t() $res, :$raw = False) {
    graphene_triangle_get_plane($!gt, $res);

    propReturnObject($res, $raw, |Graphene::Plane.getTypePair)
  }

  proto method get_points (|)
  { * }

  multi method get_points ( :$raw = False ) {
    samewith( |(Graphene::Point3d.alloc xx 3), :$raw )
  }
  multi method get_points (
    graphene_point3d_t()  $a,
    graphene_point3d_t()  $b,
    graphene_point3d_t()  $c,
                         :$raw = False
  ) {
    graphene_triangle_get_points($!gt, $a, $b, $c);

    (
      propReturnObject($a, $raw, |Graphene::Point3d.getTypePair),
      propReturnObject($b, $raw, |Graphene::Point3d.getTypePair),
      propReturnObject($c, $raw, |Graphene::Point3d.getTypePair)
    )
  }

  proto method get_uv (|)
  { * }

  multi method get_uv (
    graphene_point3d_t()  $p,
    graphene_vec2_t()     $uv_a,
    graphene_vec2_t()     $uv_b,
    graphene_vec2_t()     $uv_c,
                         :$raw   = False
  ) {
    samewith($p, $uv_a, $uv_b, $uv_c, Graphene::Vec2.alloc, :$raw);
  }
  multi method get_uv (
    graphene_point3d_t()  $p,
    graphene_vec2_t()     $uv_a,
    graphene_vec2_t()     $uv_b,
    graphene_vec2_t()     $uv_c,
    graphene_vec2_t()     $res,
                         :$raw   = False
  ) {
    graphene_triangle_get_uv($!gt, $p, $uv_a, $uv_b, $uv_c, $res);

    propReturnObject($res, $raw, |Graphene::Vec2.getTypePair);
  }

  proto method get_vertices (|)
  { * }

  multi method get_vertices ( :$raw = False ) {
    samewith( |(Graphene::Vec3.alloc xx 3), :$raw );
  }
  multi method get_vertices (
    graphene_vec3_t()  $a,
    graphene_vec3_t()  $b,
    graphene_vec3_t()  $c,
                      :$raw = False
  ) {
    graphene_triangle_get_vertices($!gt, $a, $b, $c);

    (
      propReturnObject($a, $raw, |Graphene::Vec3.getTypePair),
      propReturnObject($b, $raw, |Graphene::Vec3.getTypePair),
      propReturnObject($c, $raw, |Graphene::Vec3.getTypePair)
    )
  }

  proto method init_from_float (|)
  { * }

  multi method init_from_float (Graphene::Triangle:U: $a, $b, $c) {
    ::?CLASS.init_from_float($!gt, $a, $b, $c);
  }
  multi method init_from_float (
    Graphene::Triangle:U:

    graphene_triangle_t() $t,
                          $a  is copy,
                          $b  is copy,
                          $c  is copy
  ) {
    for $a, $b, $c -> $_ is raw {
      if $_ ~~ CArray[gfloat] {
        die "init_from_float must be CArray[float] compatible {
             '' }with only 3 elements"
        unless $_ ~~ Positional && .elems == 3;

        $_ = ArrayToCArray(gfloat, $_);
      }

    }
    graphene_triangle_init_from_float($t, $a, $b, $c);
  }

  proto method init_from_point3d (|)
  { * }

  multi method init_from_point3d (
    Graphene::Triangle:D:

    graphene_point3d_t()  $a,
    graphene_point3d_t()  $b,
    graphene_point3d_t()  $c
  ) {
    ::?CLASS.init_from_point3d($!gt, $a, $b, $c);
  }
  multi method init_from_point3d (
    Graphene::Triangle:U:

    graphene_triangle_t() $t,
    graphene_point3d_t()  $a,
    graphene_point3d_t()  $b,
    graphene_point3d_t()  $c
  ) {
    graphene_triangle_init_from_point3d($t, $a, $b, $c);
  }

  proto method init_from_vec3 (|)
  { * }

  multi method init_from_vec3 (
    Graphene::Triangle:D:

    graphene_vec3_t()     $a,
    graphene_vec3_t()     $b,
    graphene_vec3_t()     $c
  ) {
    ::?CLASS.init_from_vec($!gt, $a, $b, $c);
  }
  multi method init_from_vec3 (
    Graphene::Triangle:U:

    graphene_triangle_t() $t,
    graphene_vec3_t()     $a,
    graphene_vec3_t()     $b,
    graphene_vec3_t()     $c
  ) {
    graphene_triangle_init_from_vec3($t, $a, $b, $c);
  }

}
