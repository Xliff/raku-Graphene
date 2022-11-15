use v6.c;

use Graphene::Raw::Types;
use Graphene::Raw::Vec2;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Graphene::Vec2 {
  also does GLib::Roles::Implementor;

  has graphene_vec2_t $!gv2 is implementor;

  method init (
    gfloat          $x,
    gfloat          $y
  ) {
    graphene_vec2_init($!gv2, $x, $y);
  }

  method init_from_float (gfloat          $src is rw) {
    graphene_vec2_init_from_float($!gv2, $src);
  }

  method init_from_vec2 (graphene_vec2_t $src) {
    graphene_vec2_init_from_vec2($!gv2, $src);
  }

  multi method add (graphene_vec2_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method add (
    graphene_vec2_t()  $b,
    graphene_vec2_t()  $res,
                      :$raw = False
  ) {
    graphene_vec2_add($!gv2, $b, $res);
    propReturnObject( $res, $raw, |self.getTypePair );
  }

  method alloc {
    graphene_vec2_alloc();
  }

  multi method divide (graphene_vec2_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method divide (
    graphene_vec2_t()  $b,
    graphene_vec2_t()  $res,
                      :$raw = False
  ) {
    graphene_vec2_divide($!gv2, $b, $res);
    propReturnObject( $res, $raw, |self.getTypePair )
  }

  method dot (graphene_vec2_t() $b) {
    graphene_vec2_dot($!gv2, $b);
  }

  method equal (graphene_vec2_t() $v2) {
    so graphene_vec2_equal($!gv2, $v2);
  }

  method free {
    graphene_vec2_free($!gv2);
  }

  method get_x {
    graphene_vec2_get_x($!gv2);
  }

  method get_y {
    graphene_vec2_get_y($!gv2);
  }

  multi method interpolate (
    graphene_vec2_t()  $v2,
    Num()              $factor,
                      :$raw     = False
  ) {
    samewith($v2, $factor, self.alloc, :$raw);
  }
  multi method interpolate (
    graphene_vec2_t()  $v2,
    Num()              $factor,
    graphene_vec2_t()  $res,
                      :$raw     = False
  ) {
    my gdouble $f = $factor;

    graphene_vec2_interpolate($!gv2, $v2, $factor, $res);
    propReturnObject( $res, $raw, |self.getTypePair )
  }

  method length {
    graphene_vec2_length($!gv2);
  }

  multi method max (graphene_vec2_t $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method max (
    graphene_vec2_t() $b,
    graphene_vec2_t() $res
  ) {
    graphene_vec2_max($!gv2, $b, $res);
  }


  multi method min (graphene_vec2_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method min (
    graphene_vec2_t() $b,
    graphene_vec2_t() $res
  ) {
    graphene_vec2_min($!gv2, $b, $res);
  }

  multi method multiply (graphene_vec2_t $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method multiply (
    graphene_vec2_t()  $b,
    graphene_vec2_t()  $res,
                      :$raw  = False
  ) {
    graphene_vec2_multiply($!gv2, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method near (
    graphene_vec2_t() $v2,
    Num()             $epsilon
  ) {
    my gfloat \ε = $epsilon;

    graphene_vec2_near($!gv2, $v2, ε);
  }

  multi method negate ( :$raw = False ){
    samewith(self.alloc, :$raw);
  }
  multi method negate (graphene_vec2_t() $res, :$raw = False) {
    graphene_vec2_negate($!gv2, $res);
    propReturnObject( $res, $raw, |self.getTypePair );
  }

  multi method normalize ( :$raw = False ) {
    samewith(self.alloc, :$raw);
  }
  multi method normalize (graphene_vec2_t() $res, :$raw = False) {
    graphene_vec2_normalize($!gv2, $res);
    propReturnObject( $res, $raw, |self.getTypePair );
  }

  multi method scale (Num() $factor, :$raw = False) {
    samewith($factor, self.alloc, :$raw);
  }
  multi method scale (
    Num()              $factor,
    graphene_vec2_t()  $res,
                      :$raw     = False
  ) {
    graphene_vec2_scale($!gv2, $factor, $res);
    propReturnObject( $res, $raw, |self.getTypePair )
  }

  multi method subtract (graphene_vec2_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method subtract (
    graphene_vec2_t()  $b,
    graphene_vec2_t()  $res,
                      :$raw  = False
  ) {
    graphene_vec2_subtract($!gv2, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  proto method to_float (|)
  { * }

  multi method to_float {
    samewith($);
  }
  multi method to_float ($dest is rw) {
    my gfloat $d = 0e0;

    graphene_vec2_to_float($!gv2, $d);
    $dest = $d;
  }

  # cw: These belong to libgraphene and should NOT be freed.
  method x_axis {
    graphene_vec2_x_axis();
  }

  method y_axis {
    graphene_vec2_y_axis();
  }

  method one {
    graphene_vec2_one();
  }
  method zero {
    graphene_vec2_zero();
  }

}
