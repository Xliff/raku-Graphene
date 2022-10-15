use v6;

use GLib::Raw::Exports;
use Graphene::Raw::Exports;

unit package Graphene::Raw::Types;

need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Subs;
need GLib::Raw::Struct_Subs;
need GLib::Raw::Traits;
need GLib::Roles::Pointers;
need GLib::Roles::Implementor;
need Graphene::Raw::Definitions;
need Graphene::Raw::Enums;

BEGIN {
  glib-re-export($_) for |@glib-exports,
                         |@graphene-exports;
}
