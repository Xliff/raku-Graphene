use v6.c;

use GLib::Raw::Traits;

use Graphene::Raw::Types;
use Graphene::Raw::Rect;

use GLib::Roles::Object;

class Graphene::Rect {
  also does GLib::Roles::Object;

  has graphene_rect_t $!gr is implementor;

  submethod BUILD ( :$graphene-rect ) {
    $!gr = $graphene-rect if $graphene-rect
  }

  method Graphene::Raw::Definitions::graphene_rect_t
  { $!gr }

  multi method new (graphene_rect_t $graphene-rect, :$ref = True) {
    return Nil unless $graphene-rect;

    my $o = self.bless( :$graphene-rect );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $graphene-rect = ::?CLASS.alloc;

    $graphene-rect ?? self.bless( :$graphene-rect ) !! Nil;
  }
  multi method new (Num() $x, Num() $y, Num() $width, Num() $height) {
    ::?CLASS.init($x, $y, $width, $height);
  }

  method alloc is static {
    graphene_rect_alloc();
  }

  method init (Num() $x, Num() $y, Num() $width, Num() $height)
    is static
  {
    my gfloat ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    my $graphene-rect = ::?CLASS.alloc;
    graphene_rect_init($graphene-rect, $xx, $yy, $w, $h);

    $graphene-rect ?? self.bless( :$graphene-rect ) !! Nil;
  }

  method init_from_rect (graphene_rect_t() $src)
    is static
  {
    my $graphene-rect = graphene_rect_init_from_rect($src);

    $graphene-rect ?? self.bless( :$graphene-rect ) !! Nil;
  }

  method contains_point (graphene_point_t() $p) {
    so graphene_rect_contains_point($!gr, $p);
  }

  method contains_rect (graphene_rect_t() $b) {
    so graphene_rect_contains_rect($!gr, $b);
  }

  method equal (graphene_rect_t() $b) {
    so graphene_rect_equal($!gr, $b);
  }

  multi method expand (graphene_point_t() $p, :$raw = False) {
    samewith($p, self.alloc, :$raw);
  }
  multi method expand (
    graphene_point_t()  $p,
    graphene_rect_t()   $res,
                       :$raw = False
  ) {
    graphene_rect_expand($!gr, $p, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method free {
    graphene_rect_free($!gr);
  }

  method get_area {
    graphene_rect_get_area($!gr);
  }

  proto method get_bottom_left (|)
  { * }

  multi method get_bottom_left ( :$raw = False ) {
    samewith(Graphene::Point.alloc, :$raw);
  }
  multi method get_bottom_left (graphene_point_t() $p, :$raw = False) {
    graphene_rect_get_bottom_left($!gr, $p);
    propReturnObject($p, $raw, |Graphene::Point.getTypePair);
  }

  proto method get_bottom_right (|)
  { * }

  multi method get_bottom_right ( :$raw = False ) {
    samewith(Graphene::Point.alloc, :$raw);
  }
  multi method get_bottom_right (graphene_point_t() $p, :$raw = False) {
    graphene_rect_get_bottom_right($!gr, $p);
    propReturnObject($p, $raw, |Graphene::Point.getTypePair);
  }

  proto method get_center (|)
  { * }

  multi method get_center ( :$raw = False ) {
    samewith(Graphene::Point.alloc, :$raw);
  }
  multi method get_center (graphene_point_t() $p, :$raw = False) {
    graphene_rect_get_center($!gr, $p);
    propReturnObject($p, $raw, |Graphene::Point.getTypePair);
  }

  method get_height {
    graphene_rect_get_height($!gr);
  }

  proto method get_top_left (|)
  { * }

  multi method get_top_left ( :$raw = False ) {
    samewith(Graphene::Point.alloc, :$raw);
  }
  multi method get_top_left (graphene_point_t() $p, :$raw = False) {
    graphene_rect_get_top_left($!gr, $p);
    propReturnObject($p, $raw, |Graphene::Point.getTypePair);
  }

  proto method get_top_right (|)
  { * }

  multi method get_top_right ( :$raw = False ) {
    samewith(Graphene::Point.alloc, :$raw);
  }
  multi method get_top_right (graphene_point_t() $p, :$raw = False) {
    graphene_rect_get_top_right($!gr, $p);
    propReturnObject($p, $raw, |Graphene::Point.getTypePair);
  }

  method get_vertices (graphene_vec2_t $vertices) {
    graphene_rect_get_vertices($!gr, $vertices);
  }

  method get_width {
    graphene_rect_get_width($!gr);
  }

  method get_x {
    graphene_rect_get_x($!gr);
  }

  method get_y {
    graphene_rect_get_y($!gr);
  }

  method inset (Num() $d_x, Num() $d_y, :$raw = False) {
    my gfloat ($x, $y) = ($d_x, $d_y);

    propReturnObject(
      graphene_rect_inset($!gr, $x, $y),
      $raw,
      |self.getTypePair
    )
  }

  proto method inset_r (|)
  { * }

  multi method inset_r (
    Num()  $d_x,
    Num()  $d_y,
          :$raw = False
  ) {
    samewith($d_x, $d_y, :$raw);
  }
  multi method inset_r (
    Num()              $d_y,
    Num()              $d_x,
    graphene_rect_t()  $res,
                      :$raw = False
  ) {
    graphene_rect_inset_r($!gr, $d_x, $d_y, $res);
  }

  multi method interpolate (
    graphene_rect_t()  $b,
    Num()              $factor,
                      :$raw     = False
  ) {
    samewith($b, $factor, self.alloc, :$raw)
  }
  multi method interpolate (
    graphene_rect_t()  $b,
    Num()              $factor,
    graphene_rect_t()  $res,
                      :$raw     = False
  ) {
    my gdouble $f = $factor;

    graphene_rect_interpolate($!gr, $b, $f, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method intersection (graphene_rect_t() $b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method intersection (
    graphene_rect_t()  $b,
    graphene_rect_t()  $res,
                      :$raw  = False
  ) {
    graphene_rect_intersection($!gr, $b, $res);
  }

  method normalize {
    graphene_rect_normalize($!gr);
  }

  proto method normalize_r (|)
  { * }

  multi method normalize_r ( :$raw = False ) {
    samewith(self.alloc, :$raw);
  }
  multi method normalize_r (graphene_rect_t() $res, :$raw = False) {
    graphene_rect_normalize_r($!gr, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method offset (Num() $d_x, Num() $d_y) {
    my gfloat ($x, $y) = ($d_x, $d_y);

    graphene_rect_offset($!gr, $x, $y);
  }

  proto method offset_r (|)
  { * }

  multi method offset_r (
    Num()  $d_x,
    Num()  $d_y,
          :$raw  = False
  ) {
    samewith($$d_x, $d_y, self.alloc, :$raw);
  }
  multi method offset_r (
    Num()              $d_x,
    Num()              $d_y,
    graphene_rect_t()  $res,
                      :$raw = False
  ) {
    my gfloat ($x, $y) = ($d_x, $d_y);

    graphene_rect_offset_r($!gr, $d_x, $d_y, $res);
  }

  multi method round ( :$raw = False ) {
    samewith(self.alloc, :$raw);
  }
  multi method round (graphene_rect_t() $res, :$raw = False)
    is DEPRECATED<round_extents>
  {
    graphene_rect_round($!gr, $res);
  }

  proto method round_extents (|)
  { * }

  multi method round_extents ( :$raw = False ) {
    samewith(self.alloc, :$raw);
  }
  multi method round_extents (graphene_rect_t() $res, :$raw = False) {
    graphene_rect_round_extents($!gr, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method round_to_pixel {
    graphene_rect_round_to_pixel($!gr);
  }

  multi method scale (Num() $s_h, Num() $s_v, :$raw = False) {
    samewith($s_h, $s_v, :$raw);
  }
  multi method scale (
    Num()              $s_h,
    Num()              $s_v,
    graphene_rect_t()  $res,
                      :$raw = False
  ) {
    my gfloat ($h, $v)  = ($s_h, $s_v);

    graphene_rect_scale($!gr, $h, $v, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method union ($b, :$raw = False) {
    samewith($b, self.alloc, :$raw);
  }
  multi method union (
    graphene_rect_t()  $b,
    graphene_rect_t()  $res,
                      :$raw  = False
  ) {
    graphene_rect_union($!gr, $b, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &graphene_rect_get_type, $n, $t );
  }

  method zero is static {
    graphene_rect_zero();
  }
}
