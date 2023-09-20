use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Plane;

### /usr/include/graphene-1.0/graphene-plane.h

sub graphene_plane_alloc
  returns graphene_plane_t
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_distance (
  graphene_plane_t   $p,
  graphene_point3d_t $point
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_equal (
  graphene_plane_t $a,
  graphene_plane_t $b
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_free (
  graphene_plane_t $p
)
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_get_constant (
  graphene_plane_t $p
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_get_normal (
  graphene_plane_t $p,
  graphene_vec3_t  $normal
)
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_init (
  graphene_plane_t $p,
  graphene_vec3_t  $normal,
  gfloat           $constant
)
  returns graphene_plane_t
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_init_from_plane (
  graphene_plane_t $p,
  graphene_plane_t $src
)
  returns graphene_plane_t
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_init_from_point (
  graphene_plane_t   $p,
  graphene_vec3_t    $normal,
  graphene_point3d_t $point
)
  returns graphene_plane_t
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_init_from_points (
  graphene_plane_t   $p,
  graphene_point3d_t $a,
  graphene_point3d_t $b,
  graphene_point3d_t $c
)
  returns graphene_plane_t
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_init_from_vec4 (
  graphene_plane_t $p,
  graphene_vec4_t  $src
)
  returns graphene_plane_t
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_negate (
  graphene_plane_t $p,
  graphene_plane_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_normalize (
  graphene_plane_t $p,
  graphene_plane_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_plane_transform (
  graphene_plane_t  $p,
  graphene_matrix_t $matrix,
  graphene_matrix_t $normal_matrix,
  graphene_plane_t  $res
)
  is      native(graphene)
  is      export
{ * }
