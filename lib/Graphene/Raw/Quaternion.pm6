use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Quaternion;

### /usr/include/graphene-1.0/graphene-quaternion.h

sub graphene_quaternion_add (
  graphene_quaternion_t $a,
  graphene_quaternion_t $b,
  graphene_quaternion_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_alloc
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_dot (
  graphene_quaternion_t $a,
  graphene_quaternion_t $b
)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_equal (
  graphene_quaternion_t $a,
  graphene_quaternion_t $b
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_free (graphene_quaternion_t $q)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init (
  graphene_quaternion_t $q,
  gfloat                $x,
  gfloat                $y,
  gfloat                $z,
  gfloat                $w
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_angle_vec3 (
  graphene_quaternion_t $q,
  gfloat                $angle,
  graphene_vec3_t       $axis
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_angles (
  graphene_quaternion_t $q,
  gfloat                $deg_x,
  gfloat                $deg_y,
  gfloat                $deg_z
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_euler (
  graphene_quaternion_t $q,
  graphene_euler_t      $e
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_matrix (
  graphene_quaternion_t $q,
  graphene_matrix_t     $m
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_quaternion (
  graphene_quaternion_t $q,
  graphene_quaternion_t $src
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_radians (
  graphene_quaternion_t $q,
  gfloat                $rad_x,
  gfloat                $rad_y,
  gfloat                $rad_z
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_from_vec4 (
  graphene_quaternion_t $q,
  graphene_vec4_t       $src
)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_init_identity (graphene_quaternion_t $q)
  returns graphene_quaternion_t
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_invert (
  graphene_quaternion_t $q,
  graphene_quaternion_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_multiply (
  graphene_quaternion_t $a,
  graphene_quaternion_t $b,
  graphene_quaternion_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_normalize (
  graphene_quaternion_t $q,
  graphene_quaternion_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_scale (
  graphene_quaternion_t $q,
  gfloat                $factor,
  graphene_quaternion_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_slerp (
  graphene_quaternion_t $a,
  graphene_quaternion_t $b,
  gfloat                $factor,
  graphene_quaternion_t $res
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_to_angle_vec3 (
  graphene_quaternion_t $q,
  gfloat                $angle is rw,
  graphene_vec3_t       $axis
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_to_angles (
  graphene_quaternion_t $q,
  gfloat                $deg_x is rw,
  gfloat                $deg_y is rw,
  gfloat                $deg_z is rw
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_to_matrix (
  graphene_quaternion_t $q,
  graphene_matrix_t     $m
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_to_radians (
  graphene_quaternion_t $q,
  gfloat                $rad_x is rw,
  gfloat                $rad_y is rw,
  gfloat                $rad_z is rw
)
  is      native(graphene)
  is      export
{ * }

sub graphene_quaternion_to_vec4 (
  graphene_quaternion_t $q,
  graphene_vec4_t       $res
)
  is      native(graphene)
  is      export
{ * }
