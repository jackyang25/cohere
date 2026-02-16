// Lean compiler output
// Module: Cohere.Types.Verdict
// Imports: Init
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__6;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__14;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__7;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__13;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__8;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4;
lean_object* lean_nat_to_int(lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Types_instReprVerdict(lean_object*);
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__2;
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643_(lean_object*);
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Types_instReprVerdict___rarg(lean_object*);
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__1;
LEAN_EXPORT lean_object* l_Cohere_Types_instDecidableEqVerdict___rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_decEqVerdict____x40_Cohere_Types_Verdict___hyg_61_(lean_object*);
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__9;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__10;
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_decEqVerdict____x40_Cohere_Types_Verdict___hyg_61____rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Types_Verdict_action___rarg(lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Types_Verdict_action(lean_object*);
lean_object* l_Repr_addAppParen(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Types_instDecidableEqVerdict(lean_object*);
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__11;
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__3;
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
static lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__12;
LEAN_EXPORT lean_object* l_Cohere_Types_Verdict_action___rarg___boxed(lean_object*);
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_decEqVerdict____x40_Cohere_Types_Verdict___hyg_61____rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
switch (lean_obj_tag(x_2)) {
case 0:
{
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_4);
lean_dec(x_2);
x_5 = lean_ctor_get(x_3, 0);
lean_inc(x_5);
lean_dec(x_3);
x_6 = lean_apply_2(x_1, x_4, x_5);
return x_6;
}
else
{
uint8_t x_7; lean_object* x_8; 
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
x_7 = 0;
x_8 = lean_box(x_7);
return x_8;
}
}
case 1:
{
if (lean_obj_tag(x_3) == 1)
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_9 = lean_ctor_get(x_2, 0);
lean_inc(x_9);
lean_dec(x_2);
x_10 = lean_ctor_get(x_3, 0);
lean_inc(x_10);
lean_dec(x_3);
x_11 = lean_apply_2(x_1, x_9, x_10);
return x_11;
}
else
{
uint8_t x_12; lean_object* x_13; 
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
x_12 = 0;
x_13 = lean_box(x_12);
return x_13;
}
}
case 2:
{
if (lean_obj_tag(x_3) == 2)
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_14 = lean_ctor_get(x_2, 0);
lean_inc(x_14);
lean_dec(x_2);
x_15 = lean_ctor_get(x_3, 0);
lean_inc(x_15);
lean_dec(x_3);
x_16 = lean_apply_2(x_1, x_14, x_15);
return x_16;
}
else
{
uint8_t x_17; lean_object* x_18; 
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
x_17 = 0;
x_18 = lean_box(x_17);
return x_18;
}
}
default: 
{
if (lean_obj_tag(x_3) == 3)
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_19 = lean_ctor_get(x_2, 0);
lean_inc(x_19);
lean_dec(x_2);
x_20 = lean_ctor_get(x_3, 0);
lean_inc(x_20);
lean_dec(x_3);
x_21 = lean_apply_2(x_1, x_19, x_20);
return x_21;
}
else
{
uint8_t x_22; lean_object* x_23; 
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
x_22 = 0;
x_23 = lean_box(x_22);
return x_23;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_decEqVerdict____x40_Cohere_Types_Verdict___hyg_61_(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l___private_Cohere_Types_Verdict_0__Cohere_Types_decEqVerdict____x40_Cohere_Types_Verdict___hyg_61____rarg), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_instDecidableEqVerdict___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l___private_Cohere_Types_Verdict_0__Cohere_Types_decEqVerdict____x40_Cohere_Types_Verdict___hyg_61____rarg(x_1, x_2, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_instDecidableEqVerdict(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_Cohere_Types_instDecidableEqVerdict___rarg), 3, 0);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Cohere.Types.Verdict.Obligated", 30, 30);
return x_1;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__2;
x_2 = lean_box(1);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__6() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Cohere.Types.Verdict.Allowed", 28, 28);
return x_1;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__6;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__7;
x_2 = lean_box(1);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__9() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Cohere.Types.Verdict.Disallowed", 31, 31);
return x_1;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__9;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__10;
x_2 = lean_box(1);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__12() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Cohere.Types.Verdict.Rejected", 29, 29);
return x_1;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__13() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__12;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__13;
x_2 = lean_box(1);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
switch (lean_obj_tag(x_2)) {
case 0:
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_4);
lean_dec(x_2);
x_5 = lean_unsigned_to_nat(1024u);
x_6 = lean_nat_dec_le(x_5, x_3);
x_7 = lean_apply_2(x_1, x_4, x_5);
x_8 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__3;
x_9 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_9, 0, x_8);
lean_ctor_set(x_9, 1, x_7);
if (x_6 == 0)
{
lean_object* x_10; lean_object* x_11; uint8_t x_12; lean_object* x_13; lean_object* x_14; 
x_10 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4;
x_11 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_11, 0, x_10);
lean_ctor_set(x_11, 1, x_9);
x_12 = 0;
x_13 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_13, 0, x_11);
lean_ctor_set_uint8(x_13, sizeof(void*)*1, x_12);
x_14 = l_Repr_addAppParen(x_13, x_3);
return x_14;
}
else
{
lean_object* x_15; lean_object* x_16; uint8_t x_17; lean_object* x_18; lean_object* x_19; 
x_15 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5;
x_16 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_16, 0, x_15);
lean_ctor_set(x_16, 1, x_9);
x_17 = 0;
x_18 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_18, 0, x_16);
lean_ctor_set_uint8(x_18, sizeof(void*)*1, x_17);
x_19 = l_Repr_addAppParen(x_18, x_3);
return x_19;
}
}
case 1:
{
lean_object* x_20; lean_object* x_21; uint8_t x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; 
x_20 = lean_ctor_get(x_2, 0);
lean_inc(x_20);
lean_dec(x_2);
x_21 = lean_unsigned_to_nat(1024u);
x_22 = lean_nat_dec_le(x_21, x_3);
x_23 = lean_apply_2(x_1, x_20, x_21);
x_24 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__8;
x_25 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_25, 0, x_24);
lean_ctor_set(x_25, 1, x_23);
if (x_22 == 0)
{
lean_object* x_26; lean_object* x_27; uint8_t x_28; lean_object* x_29; lean_object* x_30; 
x_26 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4;
x_27 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_27, 0, x_26);
lean_ctor_set(x_27, 1, x_25);
x_28 = 0;
x_29 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_29, 0, x_27);
lean_ctor_set_uint8(x_29, sizeof(void*)*1, x_28);
x_30 = l_Repr_addAppParen(x_29, x_3);
return x_30;
}
else
{
lean_object* x_31; lean_object* x_32; uint8_t x_33; lean_object* x_34; lean_object* x_35; 
x_31 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5;
x_32 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_32, 0, x_31);
lean_ctor_set(x_32, 1, x_25);
x_33 = 0;
x_34 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_34, 0, x_32);
lean_ctor_set_uint8(x_34, sizeof(void*)*1, x_33);
x_35 = l_Repr_addAppParen(x_34, x_3);
return x_35;
}
}
case 2:
{
lean_object* x_36; lean_object* x_37; uint8_t x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; 
x_36 = lean_ctor_get(x_2, 0);
lean_inc(x_36);
lean_dec(x_2);
x_37 = lean_unsigned_to_nat(1024u);
x_38 = lean_nat_dec_le(x_37, x_3);
x_39 = lean_apply_2(x_1, x_36, x_37);
x_40 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__11;
x_41 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_41, 0, x_40);
lean_ctor_set(x_41, 1, x_39);
if (x_38 == 0)
{
lean_object* x_42; lean_object* x_43; uint8_t x_44; lean_object* x_45; lean_object* x_46; 
x_42 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4;
x_43 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_43, 0, x_42);
lean_ctor_set(x_43, 1, x_41);
x_44 = 0;
x_45 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_45, 0, x_43);
lean_ctor_set_uint8(x_45, sizeof(void*)*1, x_44);
x_46 = l_Repr_addAppParen(x_45, x_3);
return x_46;
}
else
{
lean_object* x_47; lean_object* x_48; uint8_t x_49; lean_object* x_50; lean_object* x_51; 
x_47 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5;
x_48 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_48, 0, x_47);
lean_ctor_set(x_48, 1, x_41);
x_49 = 0;
x_50 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_50, 0, x_48);
lean_ctor_set_uint8(x_50, sizeof(void*)*1, x_49);
x_51 = l_Repr_addAppParen(x_50, x_3);
return x_51;
}
}
default: 
{
lean_object* x_52; lean_object* x_53; uint8_t x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; 
x_52 = lean_ctor_get(x_2, 0);
lean_inc(x_52);
lean_dec(x_2);
x_53 = lean_unsigned_to_nat(1024u);
x_54 = lean_nat_dec_le(x_53, x_3);
x_55 = lean_apply_2(x_1, x_52, x_53);
x_56 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__14;
x_57 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_57, 0, x_56);
lean_ctor_set(x_57, 1, x_55);
if (x_54 == 0)
{
lean_object* x_58; lean_object* x_59; uint8_t x_60; lean_object* x_61; lean_object* x_62; 
x_58 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4;
x_59 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_59, 0, x_58);
lean_ctor_set(x_59, 1, x_57);
x_60 = 0;
x_61 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_61, 0, x_59);
lean_ctor_set_uint8(x_61, sizeof(void*)*1, x_60);
x_62 = l_Repr_addAppParen(x_61, x_3);
return x_62;
}
else
{
lean_object* x_63; lean_object* x_64; uint8_t x_65; lean_object* x_66; lean_object* x_67; 
x_63 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5;
x_64 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_64, 0, x_63);
lean_ctor_set(x_64, 1, x_57);
x_65 = 0;
x_66 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_66, 0, x_64);
lean_ctor_set_uint8(x_66, sizeof(void*)*1, x_65);
x_67 = l_Repr_addAppParen(x_66, x_3);
return x_67;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643_(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg(x_1, x_2, x_3);
lean_dec(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_instReprVerdict___rarg(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___boxed), 3, 1);
lean_closure_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_instReprVerdict(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_Cohere_Types_instReprVerdict___rarg), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_Verdict_action___rarg(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc(x_2);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_Verdict_action(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_Cohere_Types_Verdict_action___rarg___boxed), 1, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Cohere_Types_Verdict_action___rarg___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Cohere_Types_Verdict_action___rarg(x_1);
lean_dec(x_1);
return x_2;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Cohere_Types_Verdict(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__1 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__1();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__1);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__2 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__2();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__2);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__3 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__3();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__3);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__4);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__5);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__6 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__6();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__6);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__7 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__7();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__7);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__8 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__8();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__8);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__9 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__9();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__9);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__10 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__10();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__10);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__11 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__11();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__11);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__12 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__12();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__12);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__13 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__13();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__13);
l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__14 = _init_l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__14();
lean_mark_persistent(l___private_Cohere_Types_Verdict_0__Cohere_Types_reprVerdict____x40_Cohere_Types_Verdict___hyg_643____rarg___closed__14);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
