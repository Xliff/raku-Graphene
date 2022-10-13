use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Box;

use GLib::Roles::Implementor;

class Graphene::Box {
  has graphene_box_t $!gb is implementor;

  has $!static is built;

  submethod BUILD ( :$graphene-box, :$!static ) {
    $!gb = $graphene-box;
  }

  multi method new {
    my $graphene-box = self.alloc;

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new ( :$empty is required ) {
    my $graphene-box = self.empty;

    $graphene-box ?? self.bless( :$graphene-box, :static ) !! Nil;
  }
  multi method new ( :$zero is required ) {
    my $graphene-box = self.zero;

    $graphene-box ?? self.bless( :$graphene-box, :static ) !! Nil;
  }
  multi method new ( :$one is required ) {
    my $graphene-box = self.one;

    $graphene-box ?? self.bless( :$graphene-box, :static ) !! Nil;
  }
  multi method new (
    :neg_one(:neg-one(:minus_one(:$minus-one))) is required
  ) {
    my $graphene-box = self.one;

    $graphene-box ?? self.bless( :$graphene-box, :static ) !! Nil;
  }
  multi method new ( :one_minus_one(:$one-minus-one) ) {
    my $graphene-box = self.one_minus_one;

    $graphene-box ?? self.bless( :$graphene-box, :static ) !! Nil;
  }
  multi method new ( :inf(:$infinite) is required ) {
    my $graphene-box = self.infinite;

    $graphene-box ?? self.bless( :$graphene-box, :static ) !! Nil;
  }
  multi method new (graphene_point3d_t() $min, graphene_point3d_t() $max) {
    my $graphene-box = self.init_from_points($min, $max);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new (
    graphene_vec3_t()  $min,
    graphene_vec3_t()  $max,
                      :$vec3 is required
  ) {
    my $graphene-box = self.init_from_vec3($min, $max);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new (graphene_box_t $src = self.alloc, :$box is required) {
    my $graphene-box = self.init_from_box($src);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new ( @points, :p(:$points)  is required) {
    my $graphene-box = self.init_from_points(@points);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new (Int() $n_points, gpointer $points) {
    my $graphene-box = self.init_from_points($n_points, $points);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new ( @vectors, :vec(:vector(:$vectors)) is required) {
    my $graphene-box = self.init_from_vectors(@vectors);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }
  multi method new (
    Int()     $n_vecs,
    gpointer  $vecs,

             :vec(:vector(:$vectors)) is required
  ) {
    my $graphene-box = self.init_from_vectors($n_vecs, $vecs);

    $graphene-box ?? self.bless( :$graphene-box ) !! Nil;
  }

  method alloc () is static {
    graphene_box_alloc();
  }

  method empty () is static {
    so graphene_box_empty();
  }

  method infinite is static {
    graphene_box_infinite();
  }

  method minus_one is static is also<minus-one> {
    graphene_box_minus_one();
  }

  method one is static {
    graphene_box_one();
  }

  method one_minus_one is static is also<one-minus-one> {
    graphene_box_one_minus_one();
  }

  method zero is static {
    graphene_box_zero();
  }

  method init (graphene_point3d_t() $min, graphene_point3d_t() $max)
    is static
  {
    graphene_box_init($min, $max);
  }

  method init_from_box (graphene_box_t() $src = self.alloc) is also<init-from-box> {
    graphene_box_init_from_box($!gb, $src);
  }

  proto method init_from_points (|)
    is also<init-from-points>
    is static
  { * }

  multi method init_from_points (@points) {
    samewith(
      @points.elems,
      GLib::Roles::TypedBuffer[graphene_point3d_t].new(@points).p
    );
  }
  multi method init_from_points (Int() $n_points, gpointer $points) {
    my gint $n = $n_points;

    graphene_box_init_from_points($!gb, $n, $points);
  }

  method init_from_vec3 (graphene_vec3_t() $min, graphene_vec3_t() $max)
    is static

    is also<init-from-vec3>
  {
    graphene_box_init_from_vec3($!gb, $min, $max);
  }

  proto method init_from_vectors (|)
    is also<init-from-vectors>
    is static
  { * }

  multi method init_from_vectors (@vectors) {
    samewith(
      @vectors.elems,
      GLib::Raw::TypedBuffer[graphene_vec3_t].new(@vectors).p
    );
  }
  multi method init_from_vectors (
    Int()    $n_vectors,
    gpointer $vectors     #= graphene_vec3_t
  ) {
    my gint $n = $n_vectors;

    graphene_box_init_from_vectors($!gb, $n, $vectors);
  }

  method contains_box (graphene_box_t() $b) is also<contains-box> {
    so graphene_box_contains_box($!gb, $b);
  }

  method contains_point (graphene_point3d_t() $point) is also<contains-point> {
    so graphene_box_contains_point($!gb, $point);
  }

  method equal (graphene_box_t() $b) {
    so graphene_box_equal($!gb, $b);
  }

  method expand (
    graphene_point3d_t()  $point,
    graphene_box_t()      $res    = self.alloc,
                         :$raw    = False
  ) {
    propReturnObject(
      graphene_box_expand($!gb, $point, $res),
      $raw,
      |self.getTypePair
    );
  }

  method expand_scalar (
    Num()             $scalar,
    graphene_box_t()  $res     = self.alloc,
                     :$raw     = False
  )
    is also<expand-scalar>
  {
    my gfloat $s = $scalar;

    propReturnObject(
      graphene_box_expand_scalar($!gb, $s, $res),
      $raw,
      |self.getTypePair
    );
  }

  method expand_vec3 (
    graphene_vec3_t()  $vec,
    graphene_box_t()   $res,
                      :$raw  = False
  )
    is also<expand-vec3>
  {
    propReturnObject(
      graphene_box_expand_vec3($!gb, $vec, $res),
      $raw,
      |self.getTypePair
    );
  }

  method free {
    return if $!static;

    graphene_box_free($!gb);
  }

  method get_bounding_sphere (graphene_sphere_t() $sphere) is also<get-bounding-sphere> {
    graphene_box_get_bounding_sphere($!gb, $sphere);
  }

  method get_center (graphene_point3d_t() $center) is also<get-center> {
    graphene_box_get_center($!gb, $center);
  }

  method get_depth
    is also<
      get-depth
      depth`
    >
  {
    graphene_box_get_depth($!gb);
  }

  method get_height
    is also<
      get-height
      height
    >
  {
    graphene_box_get_height($!gb);
  }

  method get_max (graphene_point3d_t() $max) is also<get-max> {
    graphene_box_get_max($!gb, $max);
  }

  method get_min (graphene_point3d_t() $min) is also<get-min> {
    graphene_box_get_min($!gb, $min);
  }

  proto method get_size (|)
    is also<get-size>
  { * }

  multi method get_size is also<size> {
    samewith(Graphene::Vec3.alloc);
  }
  multi method get_size (graphene_vec3_t() $size)  {
    graphene_box_get_size($!gb, $size);
  }

  proto method get_vertices (|)
    is also<get-vertices>
  { * }

  multi method get_vertices ( :$raw = False ) is also<vertices> {
    samewith($, :$raw);
  }
  multi method get_vertices ($vertices is rw, :$raw = False)  {
    $vertices = malloc( 8 * nativesizeof(graphene_vec3_t) )
      unless $vertices ~~ gpointer;

    graphene_box_get_vertices($!gb, $vertices);
    return $vertices if $raw;

    GLib::Roles::TypedBuffer[graphene_vec3_t].new($vertices).Array;
  }

  method get_width
    is also<
      get-width
      width
    >
  {
    graphene_box_get_width($!gb);
  }

  method intersection (
    graphene_box_t()  $b,
    graphene_box_t()  $res = self.alloc,
                     :$raw = False
  ) {
    propReturnObject(
      graphene_box_intersection($!gb, $b, $res),
      $raw,
      |self.getTypePair
    );
  }

  method union (
    graphene_box_t()  $b,
    graphene_box_t()  $res = self.alloc,
                     :$raw = False
  ) {
    propReturnObject(
      graphene_box_union($!gb, $b, $res),
      $raw,
      |self.getTypePair
    );
  }

}
