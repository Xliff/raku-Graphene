use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;;

unit package Graphene::Raw::Point3d;

### /usr/include/graphene-1.0/graphene-point3d.h

sub graphene_point3d_alloc ()
  returns graphene_point3d_t
  is native(graphene)
  is export
{ * }

sub graphene_point3d_cross (
  graphene_point3d_t $a,
  graphene_point3d_t $b,
  graphene_point3d_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_distance (
  graphene_point3d_t $a,
  graphene_point3d_t $b,
  graphene_vec3_t    $delta
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_point3d_dot (graphene_point3d_t $a, graphene_point3d_t $b)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_point3d_equal (graphene_point3d_t $a, graphene_point3d_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_point3d_free (graphene_point3d_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_init (
  graphene_point3d_t $p,
  gfloat             $x,
  gfloat             $y,
  gfloat             $z
)
  returns graphene_point3d_t
  is native(graphene)
  is export
{ * }

sub graphene_point3d_init_from_point (
  graphene_point3d_t $p,
  graphene_point3d_t $src
)
  returns graphene_point3d_t
  is      native(graphene)
  is      export
{ * }

sub graphene_point3d_init_from_vec3 (graphene_point3d_t $p, graphene_vec3_t $v)
  returns graphene_point3d_t
  is      native(graphene)
  is      export
{ * }

sub graphene_point3d_interpolate (
  graphene_point3d_t $a,
  graphene_point3d_t $b,
  gdouble            $factor,
  graphene_point3d_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_length (graphene_point3d_t $p)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_point3d_near (
  graphene_point3d_t $a,
  graphene_point3d_t $b,
  gfloat $epsilon
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_point3d_normalize (graphene_point3d_t $p, graphene_point3d_t $res)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_normalize_viewport (
  graphene_point3d_t $p,
  graphene_rect_t    $viewport,
  gfloat             $z_near,
  gfloat             $z_far,
  graphene_point3d_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_scale (
  graphene_point3d_t $p,
  gfloat             $factor,
  graphene_point3d_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_to_vec3 (graphene_point3d_t $p, graphene_vec3_t $v)
  is native(graphene)
  is export
{ * }

sub graphene_point3d_zero ()
  returns graphene_point3d_t
  is      native(graphene)
  is      export
{ * }
