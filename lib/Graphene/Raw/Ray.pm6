use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Graphene::Raw::Enums;

unit package Graphene::Raw::Ray;

### /usr/include/graphene-1.0/graphene-ray.h

sub graphene_ray_alloc
  returns graphene_ray_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_equal (graphene_ray_t $a, graphene_ray_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_free (graphene_ray_t $r)
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_get_closest_point_to_point (
  graphene_ray_t     $r,
  graphene_point3d_t $p,
  graphene_point3d_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_get_direction (graphene_ray_t $r, graphene_vec3_t $direction)
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_get_distance_to_plane (graphene_ray_t $r, graphene_plane_t $p)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_get_distance_to_point (
  graphene_ray_t     $r,
  graphene_point3d_t $p
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_get_origin (
  graphene_ray_t     $r,
  graphene_point3d_t $origin
)
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_get_position_at (
  graphene_ray_t     $r,
  gfloat             $t,
  graphene_point3d_t $position
)
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_init (
  graphene_ray_t     $r,
  graphene_point3d_t $origin,
  graphene_vec3_t    $direction
)
  returns graphene_ray_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_init_from_ray (graphene_ray_t $r, graphene_ray_t $src)
  returns graphene_ray_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_init_from_vec3 (
  graphene_ray_t  $r,
  graphene_vec3_t $origin,
  graphene_vec3_t $direction
)
  returns graphene_ray_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_intersect_box (
  graphene_ray_t $r,
  graphene_box_t $b,
  gfloat         $t_out is rw
)
  returns graphene_ray_intersection_kind_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_intersect_sphere (
  graphene_ray_t    $r,
  graphene_sphere_t $s,
  gfloat            $t_out is rw
)
  returns graphene_ray_intersection_kind_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_intersect_triangle (
  graphene_ray_t      $r,
  graphene_triangle_t $t,
  gfloat              $t_out is rw
)
  returns graphene_ray_intersection_kind_t
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_intersects_box (graphene_ray_t $r, graphene_box_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_intersects_sphere (graphene_ray_t $r, graphene_sphere_t $s)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_ray_intersects_triangle (
  graphene_ray_t      $r,
  graphene_triangle_t $t
)
  returns bool
  is      native(graphene)
  is      export
{ * }
