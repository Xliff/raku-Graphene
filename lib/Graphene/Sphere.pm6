use v6.c;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Sphere;

#use Graphene::Point3d;

use GLib::Roles::Implementor;

class Graphene::Sphere {
  has $!gs is implementor is built;

  submethod BUILD ( :$graphene-sphere ) {
    $!gs = $graphene-sphere if $graphene-sphere;
  }

  multi method new (graphene_sphere_t() $graphene-sphere) {
    $graphene-sphere ?? self.bless( :$graphene-sphere ) !! Nil;
  }
  multi method new {
    my $graphene-sphere = ::?CLASS.alloc;

    $graphene-sphere ?? self.bless( :$graphene-sphere ) !! Nil;
  }
  multi method new (graphene_point3d_t() $center, Num() $radius) {
    my $graphene-sphere = self.init($center, $radius);

    $graphene-sphere ?? self.bless( :$graphene-sphere ) !! Nil;
  }
  multi method new (
                         @pts,
    graphene_point3d_t   $center,
                        :$points  is required
  ) {
    samewith(
       @pts.elems,
       GLib::Roles::TypedBuffer[graphene_point3d_t].new(@pts).p,
       $center,
      :points
    );
  }
  multi method new (
    Int()                 $n_pts,
    gpointer              $pts,
    graphene_point3d_t()  $center,
                         :$points    is required
  ) {
    my $graphene-sphere = self.init_from_points($n_pts, $pts, $center);

    $graphene-sphere ?? self.bless( :$graphene-sphere ) !! Nil;
  }

  method init (graphene_point3d_t() $center, Num() $radius) {
    my gfloat $r = $radius;

    graphene_sphere_init($!gs, $center, $radius);
  }

  multi method init_from_points (
                         @points,
    graphene_point3d_t() $center
  ) {
    samewith(
      @points.elems,
      GLib::Roles::TypedBuffer[graphene_point3d_t].new(@points).p,
      $center
    );
  }
  multi method init_from_points (
    Int()                $n_points,
    gpointer             $points,
    graphene_point3d_t() $center
  ) {
    my gint $n = $n_points;

    graphene_sphere_init_from_points($!gs, $n, $points, $center);
  }

  multi method new (
                          @vects,
    graphene_point3d_t()  $center,
                         :vec(:vector(:$vectors)) is required
  ) {
    my $graphene-sphere = self.init_from_vectors(@vects, $center);

    $graphene-sphere ?? self.bless( :$graphene-sphere ) !! Nil;
  }
  multi method new (
    Int()                 $n_vects,
    gpointer              $vects,
    graphene_point3d_t()  $center,
                         :vec(:vector(:$vectors)) is required
  ) {
    my $graphene-sphere = self.init_from_vectors(
      $n_vects,
      $vects,
      $center
    );

    $graphene-sphere ?? self.bless( :$graphene-sphere ) !! Nil;
  }

  multi method init_from_vectors (
                         @vectors,
    graphene_point3d_t() $center
  ) {
    samewith(
      @vectors.elems,
      GLib::Roles::TypedBuffer[graphene_vec3_t].new(@vectors).p,
      $center
    );
  }
  multi method init_from_vectors (
    Int()                $n_vectors,
    gpointer             $vectors,
    graphene_point3d_t() $center
  ) {
    my gint $n = $n_vectors;

    graphene_sphere_init_from_vectors($!gs, $n, $vectors, $center);
  }

  method alloc is static {
    graphene_sphere_alloc();
  }

  method contains_point (graphene_point3d_t() $point) {
    so graphene_sphere_contains_point($!gs, $point);
  }

  method distance (graphene_point3d_t() $point) {
    graphene_sphere_distance($!gs, $point);
  }

  method equal (graphene_sphere_t() $b) {
    so graphene_sphere_equal($!gs, $b);
  }

  method free {
    graphene_sphere_free($!gs);
  }

  method get_bounding_box (graphene_box_t() $box, :$raw = False) {
    propReturnObject(
      graphene_sphere_get_bounding_box($!gs, $box),
      $raw,
      ::('Graphene::Box').getTypePair
    );
  }

  method get_center (
    graphene_point3d_t()  $center = Graphene::Point3d.alloc,
                         :$raw    = False
  ) {
    propReturnObject(
      graphene_sphere_get_center($!gs, $center),
      $raw,
      |Graphene::Point3d.getTypePair
    );
  }

  method get_radius {
    graphene_sphere_get_radius($!gs);
  }

  method is_empty {
    so graphene_sphere_is_empty($!gs);
  }

  method translate (
    graphene_point3d_t()  $point,
    graphene_sphere_t()   $res    = self.alloc,
                         :$raw    = False
  ) {
    propReturnObject(
      graphene_sphere_translate($!gs, $point, $res),
      $raw,
      |self.getTypePair
    )
  }

  method raku {
    "Graphene::Sphere.new({ $!gs.gist.say })"
  }

}
