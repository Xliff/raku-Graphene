use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Rect;

### /usr/include/graphene-1.0/graphene-rect.h

sub graphene_rect_alloc ()
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_contains_point (graphene_rect_t $r, graphene_point_t $p)
  returns gboolean
  is native(graphene)
  is export
{ * }

sub graphene_rect_contains_rect (graphene_rect_t $a, graphene_rect_t $b)
  returns gboolean
  is native(graphene)
  is export
{ * }

sub graphene_rect_equal (graphene_rect_t $a, graphene_rect_t $b)
  returns gboolean
  is native(graphene)
  is export
{ * }

sub graphene_rect_expand (
  graphene_rect_t  $r,
  graphene_point_t $p,
  graphene_rect_t  $res
)
  is native(graphene)
  is export
{ * }

sub graphene_rect_free (graphene_rect_t $r)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_area (graphene_rect_t $r)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_bottom_left (graphene_rect_t $r, graphene_point_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_bottom_right (graphene_rect_t $r, graphene_point_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_center (graphene_rect_t $r, graphene_point_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_height (graphene_rect_t $r)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_top_left (graphene_rect_t $r, graphene_point_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_top_right (graphene_rect_t $r, graphene_point_t $p)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_vertices (graphene_rect_t $r, graphene_vec2_t $vertices)
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_width (graphene_rect_t $r)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_x (graphene_rect_t $r)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_y (graphene_rect_t $r)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_rect_init (
  graphene_rect_t $r,
  gfloat          $x,
  gfloat          $y,
  gfloat          $width,
  gfloat          $height
)
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_init_from_rect (graphene_rect_t $r, graphene_rect_t $src)
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_inset (graphene_rect_t $r, gfloat $d_x, gfloat $d_y)
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_inset_r (
  graphene_rect_t $r,
  gfloat          $d_x,
  gfloat          $d_y,
  graphene_rect_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_rect_interpolate (
  graphene_rect_t $a,
  graphene_rect_t $b,
  gdouble         $factor,
  graphene_rect_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_rect_intersection (
  graphene_rect_t $a,
  graphene_rect_t $b,
  graphene_rect_t $res
)
  returns uint32
  is native(graphene)
  is export
{ * }

sub graphene_rect_normalize (graphene_rect_t $r)
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_normalize_r (graphene_rect_t $r, graphene_rect_t $res)
  is native(graphene)
  is export
{ * }

sub graphene_rect_offset (graphene_rect_t $r, gfloat $d_x, gfloat $d_y)
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_offset_r (
  graphene_rect_t $r,
  gfloat          $d_x,
  gfloat          $d_y,
  graphene_rect_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_rect_round (graphene_rect_t $r, graphene_rect_t $res)
  is native(graphene)
  is export
{ * }

sub graphene_rect_round_extents (graphene_rect_t $r, graphene_rect_t $res)
  is native(graphene)
  is export
{ * }

sub graphene_rect_round_to_pixel (graphene_rect_t $r)
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_scale (
  graphene_rect_t $r,
  gfloat          $s_h,
  gfloat          $s_v,
  graphene_rect_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_rect_union (
  graphene_rect_t $a,
  graphene_rect_t $b,
  graphene_rect_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_rect_zero ()
  returns graphene_rect_t
  is native(graphene)
  is export
{ * }

sub graphene_rect_get_type
  returns GType
  is native(graphene)
  is export
{ * }
