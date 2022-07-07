use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Point;

### /usr/include/graphene-1.0/graphene-point.h

sub graphene_point_alloc ()
  returns graphene_point_t
  is native(graphene)
  is export
{ * }

sub graphene_point_distance (
  graphene_point_t $a,
  graphene_point_t $b,
  gfloat           $d_x is rw,
  gfloat           $d_y is rw
)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_point_equal (graphene_point_t $a, graphene_point_t $b)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_point_free (graphene_point_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_point_init (graphene_point_t $p, gfloat $x, gfloat $y)
  returns graphene_point_t
  is native(graphene)
  is export
{ * }

sub graphene_point_init_from_point (graphene_point_t $p, graphene_point_t $src)
  returns graphene_point_t
  is native(graphene)
  is export
{ * }

sub graphene_point_init_from_vec2 (graphene_point_t $p, graphene_vec2_t $src)
  returns graphene_point_t
  is native(graphene)
  is export
{ * }

sub graphene_point_interpolate (
  graphene_point_t $a,
  graphene_point_t $b,
  gdouble          $factor,
  graphene_point_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_point_near (
  graphene_point_t $a,
  graphene_point_t $b,
  gfloat           $epsilon
)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_point_to_vec2 (graphene_point_t $p, graphene_vec2_t $v)
  is native(graphene)
  is export
{ * }

sub graphene_point_zero ()
  returns graphene_point_t
  is native(graphene)
  is export
{ * }

sub graphene_point_get_type
  returns GType
  is native(graphene)
  is export
{ * }
