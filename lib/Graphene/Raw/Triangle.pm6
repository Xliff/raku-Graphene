use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

### /usr/include/graphene-1.0/graphene-triangle.h

sub graphene_triangle_alloc
  returns graphene_triangle_t
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_contains_point (
  graphene_triangle_t $t,
  graphene_point3d_t  $p
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_equal (
  graphene_triangle_t $a,
  graphene_triangle_t $b
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_free (
  graphene_triangle_t $t
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_area (
  graphene_triangle_t $t
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_barycoords (
  graphene_triangle_t $t,
  graphene_point3d_t  $p,
  graphene_vec2_t     $res
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_bounding_box (
  graphene_triangle_t $t,
  graphene_box_t      $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_midpoint (
  graphene_triangle_t $t,
  graphene_point3d_t  $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_normal (
  graphene_triangle_t $t,
  graphene_vec3_t     $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_plane (
  graphene_triangle_t $t,
  graphene_plane_t    $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_points (
  graphene_triangle_t $t,
  graphene_point3d_t  $a,
  graphene_point3d_t  $b,
  graphene_point3d_t  $c
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_uv (
  graphene_triangle_t $t,
  graphene_point3d_t  $p,
  graphene_vec2_t     $uv_a,
  graphene_vec2_t     $uv_b,
  graphene_vec2_t     $uv_c,
  graphene_vec2_t     $res
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_get_vertices (
  graphene_triangle_t $t,
  graphene_vec3_t     $a,
  graphene_vec3_t     $b,
  graphene_vec3_t     $c
)
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_init_from_float (
  graphene_triangle_t $t,
  gfloat              $a is rw,
  gfloat              $b is rw,
  gfloat              $c is rw
)
  returns graphene_triangle_t
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_init_from_point3d (
  graphene_triangle_t $t,
  graphene_point3d_t  $a,
  graphene_point3d_t  $b,
  graphene_point3d_t  $c
)
  returns graphene_triangle_t
  is      native(graphene)
  is      export
{ * }

sub graphene_triangle_init_from_vec3 (
  graphene_triangle_t $t,
  graphene_vec3_t     $a,
  graphene_vec3_t     $b,
  graphene_vec3_t     $c
)
  returns graphene_triangle_t
  is      native(graphene)
  is      export
{ * }
