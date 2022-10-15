use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Graphene::Raw::Enums;

unit package Graphene::Raw::Euler;

### /usr/include/graphene-1.0/graphene-euler.h

sub graphene_euler_alloc ()
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_equal (graphene_euler_t $a, graphene_euler_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_free (graphene_euler_t $e)
  is native(graphene)
  is export
{ * }

sub graphene_euler_get_alpha (graphene_euler_t $e)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_get_beta (graphene_euler_t $e)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_get_gamma (graphene_euler_t $e)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_get_order (graphene_euler_t $e)
  returns graphene_euler_order_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_get_x (graphene_euler_t $e)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_get_y (graphene_euler_t $e)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_get_z (graphene_euler_t $e)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init (graphene_euler_t $e, gfloat $x, gfloat $y, gfloat $z)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init_from_euler (graphene_euler_t $e, graphene_euler_t $src)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init_from_matrix (
  graphene_euler_t       $e,
  graphene_matrix_t      $m,
  graphene_euler_order_t $order
)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init_from_quaternion (
  graphene_euler_t       $e,
  graphene_quaternion_t  $q,
  graphene_euler_order_t $order
)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init_from_radians (
  graphene_euler_t       $e,
  gfloat                 $x,
  gfloat                 $y,
  gfloat                 $z,
  graphene_euler_order_t $order
)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init_from_vec3 (
  graphene_euler_t       $e,
  graphene_vec3_t        $v,
  graphene_euler_order_t $order
)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_init_with_order (
  graphene_euler_t       $e,
  gfloat                 $x,
  gfloat                 $y,
  gfloat                 $z,
  graphene_euler_order_t $order
)
  returns graphene_euler_t
  is      native(graphene)
  is      export
{ * }

sub graphene_euler_reorder (
  graphene_euler_t       $e,
  graphene_euler_order_t $order,
  graphene_euler_t       $res
)
  is native(graphene)
  is export
{ * }

sub graphene_euler_to_matrix (graphene_euler_t $e, graphene_matrix_t $res)
  is native(graphene)
  is export
{ * }

sub graphene_euler_to_quaternion (
  graphene_euler_t      $e,
  graphene_quaternion_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_euler_to_vec3 (graphene_euler_t $e, graphene_vec3_t $res)
  is native(graphene)
  is export
{ * }
