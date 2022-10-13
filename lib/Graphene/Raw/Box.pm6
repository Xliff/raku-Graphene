use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Box;

### /usr/include/graphene-1.0/graphene-box.h

sub graphene_box_alloc ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_contains_box (graphene_box_t $a, graphene_box_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_box_contains_point (
  graphene_box_t     $box,
  graphene_point3d_t $point
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_box_empty ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_equal (graphene_box_t $a, graphene_box_t $b)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_box_expand (
  graphene_box_t     $box,
  graphene_point3d_t $point,
  graphene_box_t     $res
)
  is native(graphene)
  is export
{ * }

sub graphene_box_expand_scalar (
  graphene_box_t $box,
  gfloat         $scalar,
  graphene_box_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_box_expand_vec3 (
  graphene_box_t  $box,
  graphene_vec3_t $vec,
  graphene_box_t  $res
)
  is native(graphene)
  is export
{ * }

sub graphene_box_free (graphene_box_t $box)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_bounding_sphere (
  graphene_box_t    $box,
  graphene_sphere_t $sphere
)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_center (graphene_box_t $box, graphene_point3d_t $center)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_depth (graphene_box_t $box)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_box_get_height (graphene_box_t $box)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_box_get_max (graphene_box_t $box, graphene_point3d_t $max)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_min (graphene_box_t $box, graphene_point3d_t $min)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_size (graphene_box_t $box, graphene_vec3_t $size)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_vertices (
  graphene_box_t $box,
  gpointer       $vertices
)
  is native(graphene)
  is export
{ * }

sub graphene_box_get_width (graphene_box_t $box)
  returns gfloat
  is      native(graphene)
  is      export
{ * }

sub graphene_box_infinite ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_init (
  graphene_box_t     $box,
  graphene_point3d_t $min,
  graphene_point3d_t $max
)
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_init_from_box (graphene_box_t $box, graphene_box_t $src)
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_init_from_points (
  graphene_box_t  $box,
  gint            $n_points,
  gpointer        $points    #= graphene_point3d_t
)
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_init_from_vec3 (
  graphene_box_t  $box,
  graphene_vec3_t $min,
  graphene_vec3_t $max
)
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_init_from_vectors (
  graphene_box_t  $box,
  gint            $n_vectors,
  gpointer        $vectors    #= graphene_vec3_t
)
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_intersection (
  graphene_box_t $a,
  graphene_box_t $b,
  graphene_box_t $res
)
  returns bool
  is      native(graphene)
  is      export
{ * }

sub graphene_box_minus_one ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_one ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_one_minus_one ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }

sub graphene_box_union (
  graphene_box_t $a,
  graphene_box_t $b,
  graphene_box_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_box_zero ()
  returns graphene_box_t
  is      native(graphene)
  is      export
{ * }
