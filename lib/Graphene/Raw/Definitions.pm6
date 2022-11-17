use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

unit package Graphene::Raw::Definitions;

constant graphene          is export = 'graphene-1.0',v0;

constant GRAPHENE_VEC2_LEN is export = 2;
constant GRAPHENE_VEC3_LEN is export = 3;
constant GRAPHENE_VEC4_LEN is export = 4;

class graphene_box_t        is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_euler_t      is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_frustum_t    is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_matrix_t     is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_plane_t      is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_point3d_t    is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_quad_t       is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_quaternion_t is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_ray_t        is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_sphere_t     is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_triangle_t   is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_vec2_t       is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_vec3_t       is repr<CPointer> does GLib::Roles::Pointers is export { }
class graphene_vec4_t       is repr<CPointer> does GLib::Roles::Pointers is export { }

class graphene_point_t is repr<CStruct> is export {
  has gfloat $.x is rw;
  has gfloat $.y is rw;
}

class graphene_size_t is repr<CStruct> is export {
  has gfloat $.width  is rw;
  has gfloat $.height is rw;
}

class graphene_rect_t is repr<CStruct> is export {
  HAS graphene_point_t $!origin;
  HAS graphene_size_t  $!size  ;

  method origin is rw {
    Proxy.new:
      FETCH => -> $                        { $!origin      },
      STORE => -> $, graphene_point_t() \v { $!origin := v }
  }

  method size is rw {
    Proxy.new:
      FETCH => -> $                       { $!size      },
      STORE => -> $, graphene_size_t() \v { $!size := v }
  }

  method gist {
    "Graphene::Rect.new( origin => { $!origin.gist }, size => {
     $!size.gist } )";
  }

}
