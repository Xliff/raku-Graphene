use v6.c;

use GLib::Raw::Traits;
use Graphene::Raw::Types;
use Graphene::Raw::Size;

use GLib::Roles::Object;

our subset GrapheneSizeAncestry is export of Mu
  where graphene_size_t | GObject;

class Graphene::Size {
  also does GLib::Roles::Object;

  has graphene_size_t $!gs is implementor;

  submethod BUILD ( :$graphene-size ) {
    self.setGrapheneSize($graphene-size) if $graphene-size;
  }

  method setGrapheneSize (GrapheneSizeAncestry $_) {
    my $to-parent;

    $!gs = do {
      when graphene_size_t {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(graphene_size_t, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Graphene::Raw::Definitions::graphene_size_t
  { $!gs }

  multi method new (graphene_size_t() $src, :$ref = True) {
    self.init_from_size($src, :$ref);
  }
  multi method new (Num() $width, Num() $height) {
    self.init($width, $height);
  }

  method init (Num() $width, Num() $height) {
    my gfloat ($w, $h) = ($width, $height);

    my $graphene-size = graphene_size_init($!gs, $width, $height);

    $graphene-size ?? self.bless( :$graphene-size ) !! Nil;
  }

  method init_from_size (graphene_size_t() $src, :$ref = True) {
    my $graphene-size = graphene_size_init_from_size($!gs, $src);

    return Nil unless $graphene-size;
    my $o = self.bless( :$graphene-size);
    $o.ref if $ref;
    $o;
  }

  method alloc {
    graphene_size_alloc;
  }

  method equal (graphene_size_t() $b) {
    so graphene_size_equal($!gs, $b);
  }

  method free {
    graphene_size_free($!gs);
  }

  multi method interpolate (
    graphene_size_t()  $b,
    Num()              $factor,
                      :$raw     = False
  ) {
    samewith($b, $factor, self.alloc, :$raw);
  }
  multi method interpolate (
    graphene_size_t()  $b,
    Num()              $factor,
    graphene_size_t()  $res,
                      :$raw = False
  ) {
    graphene_size_interpolate($!gs, $b, $factor, $res);

    propReturnObject($res, $raw, |self.getTypePair);
  }

  multi method scale (Num() $factor) {
    samewith($factor, self.alloc);
  }
  multi method scale (Num() $factor, graphene_size_t() $res, :$raw = False) {
    my gfloat $f = $factor;

    graphene_size_scale($!gs, $factor, $res);
    propReturnObject($res, $raw, |self.getTypePair);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &graphene_size_get_type, $n, $t );
  }

  method zero is static {
    graphene_size_zero;
  }

}
