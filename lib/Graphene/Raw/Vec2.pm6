use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Vec2;

### /usr/include/graphene-1.0/graphene-vec2.h

sub graphene_vec2_add (
  graphene_vec2_t $a,
  graphene_vec2_t $b,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_alloc
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_divide (
  graphene_vec2_t $a,
  graphene_vec2_t $b,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_dot (
  graphene_vec2_t $a,
  graphene_vec2_t $b
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_equal (
  graphene_vec2_t $v1,
  graphene_vec2_t $v2
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_free (graphene_vec2_t $v)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_get_x (graphene_vec2_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_get_y (graphene_vec2_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_init (
  graphene_vec2_t $v,
  gfloat          $x,
  gfloat          $y
)
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_init_from_float (
  graphene_vec2_t $v,
  gfloat          $src is rw
)
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_init_from_vec2 (
  graphene_vec2_t $v,
  graphene_vec2_t $src
)
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_interpolate (
  graphene_vec2_t $v1,
  graphene_vec2_t $v2,
  gdouble         $factor,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_length (graphene_vec2_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_max (
  graphene_vec2_t $a,
  graphene_vec2_t $b,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_min (
  graphene_vec2_t $a,
  graphene_vec2_t $b,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_multiply (
  graphene_vec2_t $a,
  graphene_vec2_t $b,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_near (
  graphene_vec2_t $v1,
  graphene_vec2_t $v2,
  gfloat          $epsilon
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_negate (
  graphene_vec2_t $v,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_normalize (
  graphene_vec2_t $v,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_one
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_scale (
  graphene_vec2_t $v,
  gfloat          $factor,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_subtract (
  graphene_vec2_t $a,
  graphene_vec2_t $b,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_to_float (
  graphene_vec2_t $v,
  gfloat          $dest is rw
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_x_axis
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_y_axis
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec2_zero
  returns graphene_vec2_t
  is      native(graphene)
  is      export
{ * }
