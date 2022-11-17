
use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Vec3;

### /usr/include/graphene-1.0/graphene-vec3.h

sub graphene_vec3_add (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_alloc
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_cross (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_divide (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_dot (
  graphene_vec3_t $a,
  graphene_vec3_t $b
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_equal (
  graphene_vec3_t $v1,
  graphene_vec3_t $v2
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_free (graphene_vec3_t $v)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_x (graphene_vec3_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_xy (
  graphene_vec3_t $v,
  graphene_vec2_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_xy0 (
  graphene_vec3_t $v,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_xyz0 (
  graphene_vec3_t $v,
  graphene_vec4_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_xyz1 (
  graphene_vec3_t $v,
  graphene_vec4_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_xyzw (
  graphene_vec3_t $v,
  gfloat          $w,
  graphene_vec4_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_y (graphene_vec3_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_get_z (graphene_vec3_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_init (
  graphene_vec3_t $v,
  gfloat          $x,
  gfloat          $y,
  gfloat          $z
)
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_init_from_float (
  graphene_vec3_t $v,
  gfloat          $src is rw
)
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_init_from_vec3 (
  graphene_vec3_t $v,
  graphene_vec3_t $src
)
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_interpolate (
  graphene_vec3_t $v1,
  graphene_vec3_t $v2,
  gdouble         $factor,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_length (graphene_vec3_t $v)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_max (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_min (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_multiply (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_near (
  graphene_vec3_t $v1,
  graphene_vec3_t $v2,
  gfloat          $epsilon
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_negate (
  graphene_vec3_t $v,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_normalize (
  graphene_vec3_t $v,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_one
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_scale (
  graphene_vec3_t $v,
  gfloat          $factor,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_subtract (
  graphene_vec3_t $a,
  graphene_vec3_t $b,
  graphene_vec3_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_to_float (
  graphene_vec3_t $v,
  gfloat          $dest is rw
)
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_x_axis
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_y_axis
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_z_axis
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }

sub graphene_vec3_zero
  returns graphene_vec3_t
  is      native(graphene)
  is      export
{ * }
