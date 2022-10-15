use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Euler;

use GLib::Roles::Implementor;

class Graphene::Euler {
  has graphene_euler_t $!ge is implementor;

  submethod BUILD ( :$graphene-euler ) {
    $!ge = $graphene-euler if $graphene-euler;
  }

  method Graphene::Raw::Definitions::graphene_euler_t
    is also<graphene-euler-t>
  { $!ge }

  multi method new {
    my $graphene-euler = self.alloc;

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (Num() $x, Num() $y, Num() $z) {
    my $graphene-euler = self.init($x, $y, $z);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (
    Num() $x,
    Num() $y,
    Num() $z,
          :r(:rad(:$radians)) is required
  ) {
    my $graphene-euler = self.init_from_radians($x, $y, $z);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (
    Num() $x,
    Num() $y,
    Num() $z,
          :o(:$order) is required
  ) {
    my $graphene-euler = self.init_with_order($x, $y, $z);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (graphene_euler_t() $src) {
    my $graphene-euler = self.init_from_euler($src);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (
    graphene_matrix_t()       $m,
    graphene_euler_order_t()  $order,
                             :$matrix is required
  ) {
    my $graphene-euler = self.init_from_matrix($m, $order);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (
    graphene_quaternion_t()   $q,
    graphene_euler_order_t()  $order,
                             :q(:qat(:$qaternion)) is required
  ) {
    my $graphene-euler = self.init_from_quaternion($q, $order);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }
  multi method new (
    graphene_vec3_t()         $v,
    graphene_euler_order_t()  $order,
                             :v(:$vec3) is required
  ) {
    my $graphene-euler = self.init_from_vec3($v, $order);

    $graphene-euler ?? self.bless( :$graphene-euler ) !! Nil;
  }

  method alloc {
    graphene_euler_alloc();
  }

  # cw: We are back to type smileys because the following multis must
  #     resolve at the dispatch level, and "is static" does not do that.
  multi method init (
    graphene_euler_t:D:

    Num() $x,
    Num() $y,
    Num() $z
  ) {
    samewith($!ge, $x, $y, $z);
  }
  multi method init (
    graphene_euler_t:U:

    Num() $x,
    Num() $y,
    Num() $z
  ) {
    samewith(self.alloc, $x, $y, $z);
  }
  multi method init (
    graphene_euler_t:U:

    graphene_euler_t() $euler,
    Num()              $x,
    Num()              $y,
    Num()              $z
  ) {
    my gfloat ($xx, $yy, $zz) = ($x, $y, $z);

    graphene_euler_init($euler, $xx, $yy, $xx);
  }

  proto method init_from_euler (|)
    is also<init-from-euler>
  { * }

  multi method init_from_euler (
    graphene_euler_t:D:

    graphene_euler_t() $src
  ) {
    samewith($!ge, $src);
  }
  multi method init_from_euler (
    graphene_euler_t:U:

    graphene_euler_t() $src
  ) {
    samewith(self.alloc, $src);
  }
  multi method init_from_euler (
    graphene_euler_t:U:

    graphene_euler_t() $euler,
    graphene_euler_t() $src
  ) {
    graphene_euler_init_from_euler($euler, $src);
  }

  proto method init_from_matrix (|)
    is also<init-from-matrix>
  { * }

  multi method init_from_matrix (
    graphene_euler_t:D:

    graphene_matrix_t() $m,
    Int()               $order
  ) {
    samewith($!ge, $m, $order);
  }
  multi method init_from_matrix (
    graphene_euler_t:U:

    graphene_matrix_t() $m,
    Int()               $order
  ) {
    samewith(self.alloc, $m, $order);
  }
  multi method init_from_matrix (
    graphene_euler_t:U:

    graphene_euler_t()  $euler,
    graphene_matrix_t() $m,
    Int()               $order
  ) {
    my graphene_euler_order_t $o = $order;

    graphene_euler_init_from_matrix($m, $o);
  }

  proto method init_from_quaternion (|)
    is also<init-from-quaternion>
  { * }

  multi method init_from_quaternion (
    graphene_euler_t:D:

    graphene_quaternion_t() $q,
    Int()                   $order
  ) {
    samewith($!ge, $q, $order);
  }
  multi method init_from_quaternion (
    graphene_euler_t:U:

    graphene_quaternion_t() $q,
    Int()                   $order
  ) {
    samewith(self.alloc, $q, $order);
  }
  multi method init_from_quaternion (
    graphene_euler_t:U:

    graphene_euler_t()      $euler,
    graphene_quaternion_t() $q,
    Int()                   $order
  ) {
    my graphene_euler_order_t $o = $order;

    graphene_euler_init_from_quaternion($euler, $q, $o);
  }

  proto method init_from_radians (|)
    is also<init-from-radians>
  { * }

  multi method init_from_radians (
    graphene_euler_t:D:

    Num()              $x,
    Num()              $y,
    Num()              $z,
    Int()              $order
  ) {
    samewith($!ge, $x, $y, $z, $order);
  }
  multi method init_from_radians (
    graphene_euler_t:U:

    Num()              $x,
    Num()              $y,
    Num()              $z,
    Int()              $order
  ) {
    samewith(self.alloc, $x, $y, $z, $order);
  }
  multi method init_from_radians (
    graphene_euler_t:U:

    graphene_euler_t() $euler,
    Num()              $x,
    Num()              $y,
    Num()              $z,
    Int()              $order
  )
    is static
  {
    my gfloat ($xx, $yy, $zz) = ($x, $y, $z);

    my graphene_euler_order_t $o = $order;

    graphene_euler_init_from_radians($euler, $xx, $yy, $zz, $o);
  }

  proto method init_from_vec3 (|)
    is also<init-from-vec3>
  { * }

  multi method init_from_vec3 (
    graphene_euler_t:D:

    graphene_vec3_t()  $v,
    Int()              $order
  ) {
    samewith($!ge, $v, $order);
  }
  multi method init_from_vec3 (
    graphene_euler_t:U:

    graphene_vec3_t()  $v,
    Int()              $order
  ) {
    samewith(self.alloc, $v, $order);
  }
  multi method init_from_vec3 (
    graphene_euler_t:U:

    graphene_euler_t() $euler,
    graphene_vec3_t()  $v,
    Int()              $order
  ) {
    my graphene_euler_order_t $o = $order;

    graphene_euler_init_from_vec3($euler, $v, $o);
  }

  proto method init_with_order (|)
    is also<init-with-order>
  { * }

  multi method init_with_order (
    graphene_euler_t:D:

    Num()              $x,
    Num()              $y,
    Num()              $z,
    Int()              $order
  ) {
    samewith($!ge, $x, $y, $z, $order);
  }
  multi method init_with_order (
    graphene_euler_t:U:

    Num()              $x,
    Num()              $y,
    Num()              $z,
    Int()              $order
  ) {
    samewith(self.alloc, $x, $y, $z, $order);
  }
  multi method init_with_order (
    graphene_euler_t:U:

    graphene_euler_t() $euler,
    Num()              $x,
    Num()              $y,
    Num()              $z,
    Int()              $order
  ) {
    my gfloat ($xx, $yy, $zz) = ($x, $y, $z);

    my graphene_euler_order_t $o = $order;

    graphene_euler_init_with_order($euler, $xx, $yy, $zz, $o);
  }

  method equal (graphene_euler_t() $b) {
    so graphene_euler_equal($!ge, $b);
  }

  method free {
    graphene_euler_free($!ge);
  }

  method get_alpha
    is also<
      get-alpha
      alpha
    >
  {
    graphene_euler_get_alpha($!ge);
  }

  method get_beta
    is also<
      get-beta
      beta
    >
  {
    graphene_euler_get_beta($!ge);
  }

  method get_gamma
    is also<
      get-gamma
      gamma
    >
  {
    graphene_euler_get_gamma($!ge);
  }

  method get_order
    is also<
      get-order
      order
    >
  {
    graphene_euler_get_order($!ge);
  }

  method get_x
    is also<
      get-x
      x
    >
  {
    graphene_euler_get_x($!ge);
  }

  method get_y
    is also<
      get-y
      y
    >
  {
    graphene_euler_get_y($!ge);
  }

  method get_z
    is also<
      get-z
      z
    >
  {
    graphene_euler_get_z($!ge);
  }

  method reorder (Int() $order, graphene_euler_t() $res) {
    my graphene_euler_order_t $o = $order;

    graphene_euler_reorder($!ge, $o, $res);
  }

  proto method to_matrix (|)
    is also<to-matrix>
  { * }

  multi method to_matrix ( :$raw = False ) {
    samewith( Graphene::Matrix.alloc, :$raw );
  }
  multi method to_matrix (graphene_matrix_t() $res, :$raw = False) {
    graphene_euler_to_matrix($!ge, $res);
    propReturnObject($res, $raw, |Graphene::Matrix.getTypePair);
  }

  proto method to_quaternion (|)
    is also<to-quaternion>
  { * }

  multi method to_quaternion ( :$raw = False ) {
    samewith( Graphene::Quaternion.alloc, :$raw );
  }
  multi method to_quaternion (graphene_quaternion_t() $res, :$raw = False) {
    graphene_euler_to_quaternion($!ge, $res);
    propReturnObject($res, $raw, |Graphene::Quaternion.getTypePair);
  }

  proto method to_vec3 (|)
    is also<to-vec3>
  { * }

  multi method to_vec3 ( :$raw = False ) {
    samewith( Graphene::Vec3.alloc, :$raw );
  }
  multi method to_vec3 (graphene_vec3_t() $res, :$raw = False ) {
    graphene_euler_to_vec3($!ge, $res);
    propReturnObject($res, $raw, |Graphene::Vec3.getTypePair);
  }

}
