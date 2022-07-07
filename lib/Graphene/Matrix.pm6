use v6.c;

use Graphene::Raw::Types;
use Graphene::Raw::Matrix;

class Graphene::Matrix {
  has grapene_matrix_t $!gm is implementor;

  method alloc {
    graphene_matrix_alloc();
  }

  method decompose (graphene_vec3_t $translate, graphene_vec3_t $scale, graphene_quaternion_t $rotate, graphene_vec3_t $shear, graphene_vec4_t $perspective) {
    graphene_matrix_decompose($!gm, $translate, $scale, $rotate, $shear, $perspective);
  }

  method determinant {
    graphene_matrix_determinant($!gm);
  }

  method equal (graphene_matrix_t $b) {
    graphene_matrix_equal($!gm, $b);
  }

  method equal_fast (graphene_matrix_t $b) {
    graphene_matrix_equal_fast($!gm, $b);
  }

  method free {
    graphene_matrix_free($!gm);
  }

  method get_row (gint $index_, graphene_vec4_t $res) {
    graphene_matrix_get_row($!gm, $index_, $res);
  }

  method get_value (gint $row, gint $col) {
    graphene_matrix_get_value($!gm, $row, $col);
  }

  method get_x_scale {
    graphene_matrix_get_x_scale($!gm);
  }

  method get_x_translation {
    graphene_matrix_get_x_translation($!gm);
  }

  method get_y_scale {
    graphene_matrix_get_y_scale($!gm);
  }

  method get_y_translation {
    graphene_matrix_get_y_translation($!gm);
  }

  method get_z_scale {
    graphene_matrix_get_z_scale($!gm);
  }

  method get_z_translation {
    graphene_matrix_get_z_translation($!gm);
  }

  method init_from_2d (gdouble $xx, gdouble $yx, gdouble $xy, gdouble $yy, gdouble $x_0, gdouble $y_0) {
    graphene_matrix_init_from_2d($!gm, $xx, $yx, $xy, $yy, $x_0, $y_0);
  }

  method init_from_float (gfloat $v is rw) {
    graphene_matrix_init_from_float($!gm, $v is rw);
  }

  method init_from_matrix (graphene_matrix_t $src) {
    graphene_matrix_init_from_matrix($!gm, $src);
  }

  method init_from_vec4 (graphene_vec4_t $v0, graphene_vec4_t $v1, graphene_vec4_t $v2, graphene_vec4_t $v3) {
    graphene_matrix_init_from_vec4($!gm, $v0, $v1, $v2, $v3);
  }

  method init_frustum (gfloat $left, gfloat $right, gfloat $bottom, gfloat $top, gfloat $z_near, gfloat $z_far) {
    graphene_matrix_init_frustum($!gm, $left, $right, $bottom, $top, $z_near, $z_far);
  }

  method init_identity {
    graphene_matrix_init_identity($!gm);
  }

  method init_look_at (graphene_vec3_t $eye, graphene_vec3_t $center, graphene_vec3_t $up) {
    graphene_matrix_init_look_at($!gm, $eye, $center, $up);
  }

  method init_ortho (gfloat $left, gfloat $right, gfloat $top, gfloat $bottom, gfloat $z_near, gfloat $z_far) {
    graphene_matrix_init_ortho($!gm, $left, $right, $top, $bottom, $z_near, $z_far);
  }

  method init_perspective (gfloat $fovy, gfloat $aspect, gfloat $z_near, gfloat $z_far) {
    graphene_matrix_init_perspective($!gm, $fovy, $aspect, $z_near, $z_far);
  }

  method init_rotate (gfloat $angle, graphene_vec3_t $axis) {
    graphene_matrix_init_rotate($!gm, $angle, $axis);
  }

  method init_scale (gfloat $x, gfloat $y, gfloat $z) {
    graphene_matrix_init_scale($!gm, $x, $y, $z);
  }

  method init_skew (gfloat $x_skew, gfloat $y_skew) {
    graphene_matrix_init_skew($!gm, $x_skew, $y_skew);
  }

  method init_translate (graphene_point3d_t $p) {
    graphene_matrix_init_translate($!gm, $p);
  }

  method interpolate (graphene_matrix_t $b, gdouble $factor, graphene_matrix_t $res) {
    graphene_matrix_interpolate($!gm, $b, $factor, $res);
  }

  method inverse (graphene_matrix_t $res) {
    graphene_matrix_inverse($!gm, $res);
  }

  method is_2d {
    graphene_matrix_is_2d($!gm);
  }

  method is_backface_visible {
    graphene_matrix_is_backface_visible($!gm);
  }

  method is_identity {
    graphene_matrix_is_identity($!gm);
  }

  method is_singular {
    graphene_matrix_is_singular($!gm);
  }

  method multiply (graphene_matrix_t $b, graphene_matrix_t $res) {
    graphene_matrix_multiply($!gm, $b, $res);
  }

  method near (graphene_matrix_t $b, gfloat $epsilon) {
    graphene_matrix_near($!gm, $b, $epsilon);
  }

  method normalize (graphene_matrix_t $res) {
    graphene_matrix_normalize($!gm, $res);
  }

  method perspective (gfloat $depth, graphene_matrix_t $res) {
    graphene_matrix_perspective($!gm, $depth, $res);
  }

  method print {
    graphene_matrix_print($!gm);
  }

  method project_point (graphene_point_t $p, graphene_point_t $res) {
    graphene_matrix_project_point($!gm, $p, $res);
  }

  method project_rect (graphene_rect_t $r, graphene_quad_t $res) {
    graphene_matrix_project_rect($!gm, $r, $res);
  }

  method project_rect_bounds (graphene_rect_t $r, graphene_rect_t $res) {
    graphene_matrix_project_rect_bounds($!gm, $r, $res);
  }

  method rotate (gfloat $angle, graphene_vec3_t $axis) {
    graphene_matrix_rotate($!gm, $angle, $axis);
  }

  method rotate_euler (graphene_euler_t $e) {
    graphene_matrix_rotate_euler($!gm, $e);
  }

  method rotate_quaternion (graphene_quaternion_t $q) {
    graphene_matrix_rotate_quaternion($!gm, $q);
  }

  method rotate_x (gfloat $angle) {
    graphene_matrix_rotate_x($!gm, $angle);
  }

  method rotate_y (gfloat $angle) {
    graphene_matrix_rotate_y($!gm, $angle);
  }

  method rotate_z (gfloat $angle) {
    graphene_matrix_rotate_z($!gm, $angle);
  }

  method scale (gfloat $factor_x, gfloat $factor_y, gfloat $factor_z) {
    graphene_matrix_scale($!gm, $factor_x, $factor_y, $factor_z);
  }

  method skew_xy (gfloat $factor) {
    graphene_matrix_skew_xy($!gm, $factor);
  }

  method skew_xz (gfloat $factor) {
    graphene_matrix_skew_xz($!gm, $factor);
  }

  method skew_yz (gfloat $factor) {
    graphene_matrix_skew_yz($!gm, $factor);
  }

  method to_2d (gdouble $xx is rw, gdouble $yx is rw, gdouble $xy is rw, gdouble $yy is rw, gdouble $x_0 is rw, gdouble $y_0 is rw) {
    graphene_matrix_to_2d($!gm, $xx is rw, $yx is rw, $xy is rw, $yy is rw, $x_0 is rw, $y_0 is rw);
  }

  method to_float (gfloat $v is rw) {
    graphene_matrix_to_float($!gm, $v is rw);
  }

  method transform_bounds (graphene_rect_t $r, graphene_rect_t $res) {
    graphene_matrix_transform_bounds($!gm, $r, $res);
  }

  method transform_box (graphene_box_t $b, graphene_box_t $res) {
    graphene_matrix_transform_box($!gm, $b, $res);
  }

  method transform_point (graphene_point_t $p, graphene_point_t $res) {
    graphene_matrix_transform_point($!gm, $p, $res);
  }

  method transform_point3d (graphene_point3d_t $p, graphene_point3d_t $res) {
    graphene_matrix_transform_point3d($!gm, $p, $res);
  }

  method transform_ray (graphene_ray_t $r, graphene_ray_t $res) {
    graphene_matrix_transform_ray($!gm, $r, $res);
  }

  method transform_rect (graphene_rect_t $r, graphene_quad_t $res) {
    graphene_matrix_transform_rect($!gm, $r, $res);
  }

  method transform_sphere (graphene_sphere_t $s, graphene_sphere_t $res) {
    graphene_matrix_transform_sphere($!gm, $s, $res);
  }

  method transform_vec3 (graphene_vec3_t $v, graphene_vec3_t $res) {
    graphene_matrix_transform_vec3($!gm, $v, $res);
  }

  method transform_vec4 (graphene_vec4_t $v, graphene_vec4_t $res) {
    graphene_matrix_transform_vec4($!gm, $v, $res);
  }

  method translate (graphene_point3d_t $pos) {
    graphene_matrix_translate($!gm, $pos);
  }

  method transpose (graphene_matrix_t $res) {
    graphene_matrix_transpose($!gm, $res);
  }

  method unproject_point3d (graphene_matrix_t $modelview, graphene_point3d_t $point, graphene_point3d_t $res) {
    graphene_matrix_unproject_point3d($!gm, $modelview, $point, $res);
  }

  method untransform_bounds (graphene_rect_t $r, graphene_rect_t $bounds, graphene_rect_t $res) {
    graphene_matrix_untransform_bounds($!gm, $r, $bounds, $res);
  }

  method untransform_point (graphene_point_t $p, graphene_rect_t $bounds, graphene_point_t $res) {
    graphene_matrix_untransform_point($!gm, $p, $bounds, $res);
  }

}
