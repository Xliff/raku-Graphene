use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Ray;

use Graphene::Point3d;

use GLib::Roles::Implementor;

class Graphene::Ray {
  has graphene_ray_t $!gr is implementor;

  submethod BUILD ( :$graphene-ray ) {
    $!gr = $graphene-ray if $graphene-ray;
  }

  method Graphene::Raw::Definitions::graphene_ray_t
    is also<graphene-ray-t>
  { $!gr }

  multi method new (
    graphene_point3d_t() $origin,
    graphene_vec3_t()    $direction
  ) {
    my $graphene-ray = self.alloc;
    return unless $graphene-ray;
    self.init($graphene-ray, $direction);
    self.bless( :$graphene-ray );
  }

  multi method new (graphene_ray_t() $src) {
    my $graphene-ray = self.alloc;
    return unless $graphene-ray;
    self.init_from_ray($graphene-ray, $src);
    self.bless( :$graphene-ray );
  }

  multi method new (
    graphene_vec3_t()  $origin,
    graphene_vec3_t()  $direction,
                      :vec3(:$vec) is required
  ) {
    my $graphene-ray = self.alloc;
    return unless $graphene-ray;
    self.init_from_vec3($graphene-ray, $origin, $direction);
    self.bless( :$graphene-ray );
  }

  method alloc is static {
    graphene_ray_alloc();
  }

  method equal (graphene_ray_t() $b) {
    so graphene_ray_equal($!gr, $b);
  }

  method free {
    graphene_ray_free($!gr);
  }

  proto method get_closest_point_to_point (|)
    is also<get-closest-point-to-point>
  { * }

  multi method get_closest_point_to_point (graphene_point3d_t() $p) {
    samewith($p, Graphene::Point3d.alloc);
  }
  multi method get_closest_point_to_point (
    graphene_point3d_t() $p,
    graphene_point3d_t() $res
  ) {
    graphene_ray_get_closest_point_to_point($!gr, $p, $res);
  }

  proto method get_direction (|)
    is also<get-direction>
  { * }

  multi method get_direction ( :$raw = False ) {
    samewith( Graphene::Vec3.alloc, :$raw );
  }
  multi method get_direction (graphene_vec3_t() $direction, :$raw = False) {
    graphene_ray_get_direction($!gr, $direction);
    propReturnObject($direction, $raw, |Graphene::Vec3.getTypePair);

  }

  method get_distance_to_plane (graphene_plane_t() $p)
    is also<get-distance-to-plane>
  {
    graphene_ray_get_distance_to_plane($!gr, $p);
  }

  method get_distance_to_point (graphene_point3d_t() $p)
    is also<get-distance-to-point>
  {
    graphene_ray_get_distance_to_point($!gr, $p);
  }

  proto method get_origin (|)
    is also<get-origin>
  { * }

  multi method get_origin {
    samewith( Graphene::Point3d.alloc );
  }
  multi method get_origin (graphene_point3d_t() $origin, :$raw) {
    graphene_ray_get_origin($!gr, $origin);
    propReturnObject($origin, $raw, |Graphene::Point3d.getTypePair);
  }

  proto method get_position_at (|)
    is also<get-position-at>
  { * }

  multi method get_position_at ($t, :$raw = False) {
    samewith($t, Graphene::Point3d.alloc, :$raw);
  }
  multi method get_position_at (
    Num()                  $t,
    graphene_point3d_t()   $position,
                          :$raw       = False
  ) {
    my gfloat $tt = $t;

    graphene_ray_get_position_at($!gr, $tt, $position),
    propReturnObject($position, $raw, |Graphene::Point3d.getTypePair);
  }

  method init (
    Graphene::Ray:U:

    graphene_ray_t()     $r,
    graphene_point3d_t() $origin,
    graphene_vec3_t()    $direction
  ) {
    graphene_ray_init($r, $origin, $direction);
  }

  method init_from_ray (
    Graphene::Ray:U:

    graphene_ray_t() $r,
    graphene_ray_t() $src
  )
    is also<init-from-ray>
  {
    graphene_ray_init_from_ray($r, $src);
  }

  method init_from_vec3 (
    Graphene::Ray:U:

    graphene_ray_t()  $r,
    graphene_vec3_t() $origin,
    graphene_vec3_t() $direction
  )
    is also<init-from-vec3>
  {
    graphene_ray_init_from_vec3($r, $origin, $direction);
  }

  proto method intersect_box (|)
    is also<intersect-box>
  { * }

  multi method intersect_box (graphene_box_t() $b, :$all = True) {
    samewith($b, $, :$all);
  }
  multi method intersect_box (
    graphene_box_t  $b,
                    $t_out is rw,
                   :$all          = False
  ) {
    my gfloat $t = 0e0;

    my $r = graphene_ray_intersection_kind_t_enum(
      graphene_ray_intersect_box($!gr, $b, $t)
    );
    $t_out = $t;
    $all.not ?? $r !! ($r, $t_out);
  }

  proto method intersect_sphere (|)
    is also<intersect-sphere>
  { * }

  multi method intersect_sphere (graphene_sphere_t() $s, :$all = True) {
    samewith($s, $, :$all);
  }
  multi method intersect_sphere (
    graphene_sphere_t  $s,
                       $t_out is rw,
                      :$all          = False
  ) {
    my gfloat $t = 0e0;

    my $r = graphene_ray_intersection_kind_t_enum(
      graphene_ray_intersect_sphere($!gr, $s, $t)
    );
    $t_out = $t;
    $all.not ?? $r !!($r, $t_out);
  }

  proto method intersect_triangle (|)
    is also<intersect-triangle>
  { * }

  multi method intersect_triangle (graphene_triangle_t() $t, :$all = True) {
    samewith($t, $, :$all);
  }
  multi method intersect_triangle (
    graphene_triangle_t()  $t,
                           $t_out is rw,
                          :$all          = False
  ) {
    my gfloat $tt = 0e0;

    my $r = graphene_ray_intersection_kind_t_enum(
      graphene_ray_intersect_triangle($!gr, $t, $tt)
    );
    $t_out = $tt;
    $all.not ?? $r !!($r, $t_out);
  }

  method intersects_box (graphene_box_t() $b) is also<intersects-box> {
    so graphene_ray_intersects_box($!gr, $b);
  }

  method intersects_sphere (graphene_sphere_t() $s)
  is also<intersects-sphere>
  {
    so graphene_ray_intersects_sphere($!gr, $s);
  }

  method intersects_triangle (graphene_triangle_t() $t)
    is also<intersects-triangle>
  {
    so graphene_ray_intersects_triangle($!gr, $t);
  }

}
