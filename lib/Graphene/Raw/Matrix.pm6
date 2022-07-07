use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Matrix;

### /usr/include/graphene-1.0/graphene-matrix.h

sub graphene_matrix_alloc ()
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_decompose (
  graphene_matrix_t     $m,
  graphene_vec3_t       $translate,
  graphene_vec3_t       $scale,
  graphene_quaternion_t $rotate,
  graphene_vec3_t       $shear,
  graphene_vec4_t       $perspective
)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_determinant (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_equal (graphene_matrix_t $a, graphene_matrix_t $b)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_equal_fast (graphene_matrix_t $a, graphene_matrix_t $b)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_free (graphene_matrix_t $m)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_row (
  graphene_matrix_t $m,
  gint              $index,
  graphene_vec4_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_value (graphene_matrix_t $m, gint $row, gint $col)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_x_scale (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_x_translation (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_y_scale (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_y_translation (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_z_scale (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_get_z_translation (graphene_matrix_t $m)
  returns gfloat
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_from_2d (
  graphene_matrix_t $m,
  gdouble           $xx,
  gdouble           $yx,
  gdouble           $xy,
  gdouble           $yy,
  gdouble           $x_0,
  gdouble           $y_0
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_from_float (graphene_matrix_t $m, gfloat $v is rw)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_from_matrix (
  graphene_matrix_t $m,
  graphene_matrix_t $src
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_from_vec4 (
  graphene_matrix_t $m,
  graphene_vec4_t   $v0,
  graphene_vec4_t   $v1,
  graphene_vec4_t   $v2,
  graphene_vec4_t   $v3
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_frustum (
  graphene_matrix_t $m,
  gfloat            $left,
  gfloat            $right,
  gfloat            $bottom,
  gfloat            $top,
  gfloat            $z_near,
  gfloat            $z_far
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_identity (graphene_matrix_t $m)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_look_at (
  graphene_matrix_t $m,
  graphene_vec3_t   $eye,
  graphene_vec3_t   $center,
  graphene_vec3_t   $up
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_ortho (
  graphene_matrix_t $m,
  gfloat            $left,
  gfloat            $right,
  gfloat            $top,
  gfloat            $bottom,
  gfloat            $z_near,
  gfloat            $z_far
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_perspective (
  graphene_matrix_t $m,
  gfloat            $fovy,
  gfloat            $aspect,
  gfloat            $z_near,
  gfloat            $z_far
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_rotate (
  graphene_matrix_t $m,
  gfloat            $angle,
  graphene_vec3_t   $axis
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_scale (
  graphene_matrix_t $m,
  gfloat            $x,
  gfloat            $y,
  gfloat            $z
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_skew (
  graphene_matrix_t $m,
  gfloat            $x_skew,
  gfloat            $y_skew
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_init_translate (
  graphene_matrix_t  $m,
  graphene_point3d_t $p
)
  returns graphene_matrix_t
  is native(graphene)
  is export
{ * }

sub graphene_matrix_interpolate (
  graphene_matrix_t $a,
  graphene_matrix_t $b,
  gdouble           $factor,
  graphene_matrix_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_inverse (graphene_matrix_t $m, graphene_matrix_t $res)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_is_2d (graphene_matrix_t $m)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_is_backface_visible (graphene_matrix_t $m)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_is_identity (graphene_matrix_t $m)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_is_singular (graphene_matrix_t $m)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_multiply (
  graphene_matrix_t $a,
  graphene_matrix_t $b,
  graphene_matrix_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_near (
  graphene_matrix_t $a,
  graphene_matrix_t $b,
  gfloat            $epsilon
)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_normalize (
  graphene_matrix_t $m,
  graphene_matrix_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_perspective (
  graphene_matrix_t $m,
  gfloat            $depth,
  graphene_matrix_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_print (graphene_matrix_t $m)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_project_point (
  graphene_matrix_t $m,
  graphene_point_t  $p,
  graphene_point_t  $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_project_rect (
  graphene_matrix_t $m,
  graphene_rect_t   $r,
  graphene_quad_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_project_rect_bounds (
  graphene_matrix_t $m,
  graphene_rect_t   $r,
  graphene_rect_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_rotate (
  graphene_matrix_t $m,
  gfloat
    $angle,
  graphene_vec3_t
  $axis
)
  is
  native(graphene
)
  is export
{ * }

sub graphene_matrix_rotate_euler (graphene_matrix_t $m, graphene_euler_t $e)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_rotate_quaternion (
  graphene_matrix_t     $m,
  graphene_quaternion_t $q
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_rotate_x (graphene_matrix_t $m, gfloat $angle)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_rotate_y (graphene_matrix_t $m, gfloat $angle)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_rotate_z (graphene_matrix_t $m, gfloat $angle)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_scale (
  graphene_matrix_t $m,
  gfloat            $factor_x,
  gfloat            $factor_y,
  gfloat            $factor_z
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_skew_xy (graphene_matrix_t $m, gfloat $factor)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_skew_xz (graphene_matrix_t $m, gfloat $factor)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_skew_yz (graphene_matrix_t $m, gfloat $factor)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_to_2d (
  graphene_matrix_t $m,
  gdouble           $xx  is rw,
  gdouble           $yx  is rw,
  gdouble           $xy  is rw,
  gdouble           $yy  is rw,
  gdouble           $x_0 is rw,
  gdouble           $y_0 is rw
)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_matrix_to_float (graphene_matrix_t $m, gfloat $v is rw)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_bounds (
  graphene_matrix_t $m,
  graphene_rect_t   $r,
  graphene_rect_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_box (
  graphene_matrix_t $m,
  graphene_box_t    $b,
  graphene_box_t    $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_point (
  graphene_matrix_t $m,
  graphene_point_t  $p,
  graphene_point_t  $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_point3d (
  graphene_matrix_t  $m,
  graphene_point3d_t $p,
  graphene_point3d_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_ray (
  graphene_matrix_t $m,
  graphene_ray_t    $r,
  graphene_ray_t    $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_rect (
  graphene_matrix_t $m,
  graphene_rect_t   $r,
  graphene_quad_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_sphere (
  graphene_matrix_t $m,
  graphene_sphere_t $s,
  graphene_sphere_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_vec3 (
  graphene_matrix_t $m,
  graphene_vec3_t   $v,
  graphene_vec3_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transform_vec4 (
  graphene_matrix_t $m,
  graphene_vec4_t   $v,
  graphene_vec4_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_translate (graphene_matrix_t $m, graphene_point3d_t $pos)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_transpose (graphene_matrix_t $m, graphene_matrix_t $res)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_unproject_point3d (
  graphene_matrix_t  $projection,
  graphene_matrix_t  $modelview,
  graphene_point3d_t $point,
  graphene_point3d_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_untransform_bounds (
  graphene_matrix_t $m,
  graphene_rect_t   $r,
  graphene_rect_t   $bounds,
  graphene_rect_t   $res
)
  is native(graphene)
  is export
{ * }

sub graphene_matrix_untransform_point (
  graphene_matrix_t $m,
  graphene_point_t  $p,
  graphene_rect_t   $bounds,
  graphene_point_t  $res
)
  returns bool
  is native(graphene)
  is export
{ * }
