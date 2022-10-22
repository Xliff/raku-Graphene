use v6.c;

use Graphene::Raw::Types;
use Graphene::Raw::Point3d;

use GLib::Roles::Implementor;

class Graphene::Point3d {
  has graphene_point3d_t $!gp3 is implementor;

  has Bool $!static;

  submethod BUILD ( :$graphene-point3d ) {
    $!gp3 = $graphene-point3d;
  }

  method Graphene::Raw::Definitions::graphene_point3d_t
  { $!gp3 }

  method init (gfloat $x, gfloat $y, gfloat $z) {
    graphene_point3d_init($!gp3, $x, $y, $z);
  }

  method init_from_point (graphene_point3d_t $src) {
    graphene_point3d_init_from_point($!gp3, $src);
  }

  method init_from_vec3 (graphene_vec3_t $v) {
    graphene_point3d_init_from_vec3($!gp3, $v);
  }

  method zero {
    graphene_point3d_zero();
  }

  method alloc {
    graphene_point3d_alloc();
  }

  method cross (graphene_point3d_t $b, graphene_point3d_t $res) {
    graphene_point3d_cross($!gp3, $b, $res);
  }

  method distance (graphene_point3d_t $b, graphene_vec3_t $delta) {
    graphene_point3d_distance($!gp3, $b, $delta);
  }

  method dot (graphene_point3d_t $b) {
    graphene_point3d_dot($!gp3, $b);
  }

  method equal (graphene_point3d_t $b) {
    graphene_point3d_equal($!gp3, $b);
  }

  method free {
    graphene_point3d_free($!gp3);
  }

  method interpolate (
    graphene_point3d_t $b,
    gdouble            $factor,
    graphene_point3d_t $res
  ) {
    graphene_point3d_interpolate($!gp3, $b, $factor, $res);
  }

  method length {
    graphene_point3d_length($!gp3);
  }

  method near (graphene_point3d_t $b, gfloat $epsilon) {
    graphene_point3d_near($!gp3, $b, $epsilon);
  }

  method normalize (graphene_point3d_t $res) {
    graphene_point3d_normalize($!gp3, $res);
  }

  method normalize_viewport (
    graphene_rect_t    $viewport,
    gfloat             $z_near,
    gfloat             $z_far,
    graphene_point3d_t $res
  ) {
    graphene_point3d_normalize_viewport($!gp3, $viewport, $z_near, $z_far, $res);
  }

  method scale (gfloat $factor, graphene_point3d_t $res) {
    graphene_point3d_scale($!gp3, $factor, $res);
  }

  method to_vec3 (graphene_vec3_t $v) {
    graphene_point3d_to_vec3($!gp3, $v);
  }

}
