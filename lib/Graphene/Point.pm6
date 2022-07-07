use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Point;

use GLib::Roles::Implementor;

class Graphene::Point {
  also does GLib::Roles::Implementor;

  has graphene_point_t $!gp is implementor;

  submethod BUILD ( :$graphene-point ) {
    $!gp = $graphene-point;
  }

  method Graphene::Raw::Definitions::graphene_point_t
    is also<graphene_point_t>
  { $!gp }

  method alloc is static {
    my $graphene-point = graphene_point_alloc;

    $graphene-point ?? self.bless( :$graphene-point ) !! Nil;
  }

  multi method new {
    ::?CLASS.alloc
  }

  method zero is static {
    my $graphene-point = graphene_point_zero;

    $graphene-point ?? self.bless( :$graphene-point ) !! Nil;
  }

  multi method new ( :$zero is required ) {
    ::?CLASS.zero
  }

  method init (Num() $x, Num() $y) {
    my gfloat ($xx, $yy) = ($x, $y);

    my $graphene-point = graphene_point_init($!gp, $x, $y);

    $graphene-point ?? self.bless( :$graphene-point ) !! Nil;
  }

  multi method new (Num() $x, Num() $y) {
    ::?CLASS.init($x, $y);
  }

  method init_from_point (graphene_point_t() $p, graphene_point_t() $src)
    is also<
      init-from-point
      new_from_point
      new-from-point
    >
  {
    my $graphene-point = graphene_point_init_from_point($p, $src);

    $graphene-point ?? self.bless( :$graphene-point ) !! Nil;
  }

  multi method new (
    graphene_point_t()  $p,
    graphene_point_t()  $src,
                       :$point is required
  ) {
    ::?CLASS.init_from_point($p, $src);
  }

  method init_from_vec2 (graphene_point_t() $p, graphene_vec2_t() $src)
    is also<
      init-from-vec2
      new_from_vec2
      new-from-vec2
    >
  {
    my $graphene-point = graphene_point_init_from_vec2($p, $src);

    $graphene-point ?? self.bless( :$graphene-point ) !! Nil;
  }

  multi method new (
    graphene_point_t()  $p,
    graphene_point_t()  $src,
                       :$vec2 is required
  ) {
    ::?CLASS.init_from_vec2($p, $src);
  }

  method distance_xy (graphene_point_t() $b) is also<distance-xy> {
    self.distance($b, :all).skip(1);
  }

  multi method distance (graphene_point_t() $b, :$all = False) {
    samewith($b, $, $, :$all)
  }
  multi method distance (
    graphene_point_t()  $b,
                        $d_x  is rw,
                        $d_y  is rw,
                       :$all         = False
  ) {
    my gfloat ($ddx, $ddy) = 0e0 xx 2;

    my $d = graphene_point_distance($!gp, $b, $ddx, $ddy);
    ($d_x, $d_y) = ($ddx, $ddy);
    $all.not ?? $d !! ($d, $d_x, $d_y);
  }

  method equal (graphene_point_t() $b) {
    so graphene_point_equal($!gp, $b);
  }

  method free {
    graphene_point_free($!gp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &graphene_point_get_type, $n, $t );
  }

  # ...
  method interpolate (
    graphene_point_t()  $b,
    Num()               $factor,
    graphene_point_t()  $res,
                       :$raw     = False
  ) {
    my gdouble $f = $factor;

    graphene_point_interpolate($!gp, $b, $f, $res);
    propReturnObject($res, $raw, |self.getTypePair)
  }

  method near (graphene_point_t() $b, Num() $epsilon) {
    my gfloat $e = $epsilon;

    graphene_point_near($!gp, $b, $e);
  }

  # ...
  method to_vec2 (graphene_vec2_t $v) {
    graphene_point_to_vec2($!gp, $v);
  }

}
