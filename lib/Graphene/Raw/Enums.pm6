use v6.c;

use GLib::Raw::Definitions;

unit package Graphene::Raw::Enums;

constant GrapheneEulerOrderT     is export := gint32;
constant graphene_euler_order_t  is export := GrapheneEulerOrderT;
our enum GrapheneEulerOrderTEnum is export <
  GRAPHENE_EULER_ORDER_DEFAULT
  GRAPHENE_EULER_ORDER_XYZ
  GRAPHENE_EULER_ORDER_YZX
  GRAPHENE_EULER_ORDER_ZXY
  GRAPHENE_EULER_ORDER_XZY
  GRAPHENE_EULER_ORDER_YXZ
  GRAPHENE_EULER_ORDER_ZYX
  GRAPHENE_EULER_ORDER_SXYZ
  GRAPHENE_EULER_ORDER_SXYX
  GRAPHENE_EULER_ORDER_SXZY
  GRAPHENE_EULER_ORDER_SXZX
  GRAPHENE_EULER_ORDER_SYZX
  GRAPHENE_EULER_ORDER_SYZY
  GRAPHENE_EULER_ORDER_SYXZ
  GRAPHENE_EULER_ORDER_SYXY
  GRAPHENE_EULER_ORDER_SZXY
  GRAPHENE_EULER_ORDER_SZXZ
  GRAPHENE_EULER_ORDER_SZYX
  GRAPHENE_EULER_ORDER_SZYZ
  GRAPHENE_EULER_ORDER_RZYX
  GRAPHENE_EULER_ORDER_RXYX
  GRAPHENE_EULER_ORDER_RYZX
  GRAPHENE_EULER_ORDER_RXZX
  GRAPHENE_EULER_ORDER_RXZY
  GRAPHENE_EULER_ORDER_RYZY
  GRAPHENE_EULER_ORDER_RZXY
  GRAPHENE_EULER_ORDER_RYXY
  GRAPHENE_EULER_ORDER_RYXZ
  GRAPHENE_EULER_ORDER_RZXZ
  GRAPHENE_EULER_ORDER_RXYZ
  GRAPHENE_EULER_ORDER_RZYZ
>;
constant graphene_euler_order_t_Enum := GrapheneEulerOrderTEnum;

constant GrapheneRayIntersectionKindT     is export := guint32;
constant graphene_ray_intersection_kind_t is export :=
  GrapheneRayIntersectionKindT;
our enum GrapheneRayIntersectionKindTEnum is export <
  GRAPHENE_RAY_INTERSECTION_KIND_NONE
  GRAPHENE_RAY_INTERSECTION_KIND_ENTER
  GRAPHENE_RAY_INTERSECTION_KIND_LEAVE
>;
constant graphene_ray_intersection_kind_t_enum is export :=
  GrapheneEulerOrderTEnum;
