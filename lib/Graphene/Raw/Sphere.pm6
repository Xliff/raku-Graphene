use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Sphere;

### /usr/include/graphene-1.0/graphene-sphere.h

sub graphene_sphere_alloc ()
  returns graphene_sphere_t
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_contains_point (
  graphene_sphere_t  $s,
  graphene_point3d_t $point
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_distance (graphene_sphere_t $s, graphene_point3d_t $point)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_equal (graphene_sphere_t $a, graphene_sphere_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_free (graphene_sphere_t $s)
  is native(graphene)
  is export
{ * }

sub graphene_sphere_get_bounding_box (
  graphene_sphere_t $s,
  graphene_box_t    $box
)
  is native(graphene)
  is export
{ * }

sub graphene_sphere_get_center (
  graphene_sphere_t  $s,
  graphene_point3d_t $center
)
  is native(graphene)
  is export
{ * }

sub graphene_sphere_get_radius (graphene_sphere_t $s)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_init (
  graphene_sphere_t  $s,
  graphene_point3d_t $center,
  gfloat             $radius
)
  returns graphene_sphere_t
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_init_from_points (
  graphene_sphere_t  $s,
  gint               $n_points,
  gpointer           $points,   #= graphene_point3d_t
  graphene_point3d_t $center
)
  returns graphene_sphere_t
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_init_from_vectors (
  graphene_sphere_t  $s,
  gint               $n_vectors,
  gpointer           $vectors,   #= graphene_vec3_t
  graphene_point3d_t $center
)
  returns graphene_sphere_t
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_is_empty (graphene_sphere_t $s)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_sphere_translate (
  graphene_sphere_t  $s,
  graphene_point3d_t $point,
  graphene_sphere_t  $res
)
  is native(graphene)
  is export
{ * }
