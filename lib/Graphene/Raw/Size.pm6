use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;

unit package Graphene::Raw::Size;

### /usr/include/graphene-1.0/graphene-size.h

sub graphene_size_alloc ()
  returns graphene_size_t
  is native(graphene)
  is export
{ * }

sub graphene_size_equal (graphene_size_t $a, graphene_size_t $b)
  returns bool
  is native(graphene)
  is export
{ * }

sub graphene_size_free (graphene_size_t $s)
  is native(graphene)
  is export
{ * }

sub graphene_size_init (graphene_size_t $s, gfloat $width, gfloat $height)
  returns graphene_size_t
  is native(graphene)
  is export
{ * }

sub graphene_size_init_from_size (graphene_size_t $s, graphene_size_t $src)
  returns graphene_size_t
  is native(graphene)
  is export
{ * }

sub graphene_size_interpolate (
  graphene_size_t $a,
  graphene_size_t $b,
  gdouble         $factor,
  graphene_size_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_size_scale (
  graphene_size_t $s,
  gfloat          $factor,
  graphene_size_t $res
)
  is native(graphene)
  is export
{ * }

sub graphene_size_get_type
  returns GType
  is native(graphene)
  is export
{ * }

sub graphene_size_zero ()
  returns graphene_size_t
  is native(graphene)
  is export
{ * }
