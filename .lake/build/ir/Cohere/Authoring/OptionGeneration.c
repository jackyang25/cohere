// Lean compiler output
// Module: Cohere.Authoring.OptionGeneration
// Imports: Init Cohere.Authoring.ConflictDetection Cohere.Types.Action Cohere.Types.FactSet Cohere.Types.Rule Cohere.Types.Verdict
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
LEAN_EXPORT lean_object* l_Cohere_Authoring_OptionA(lean_object*, lean_object*);
lean_object* l_List_appendTR___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_OverlapPremises(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_OptionB(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_BaseOptions(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_OptionC(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_OverlapPremises(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
lean_dec(x_1);
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_4);
lean_dec(x_2);
x_5 = l_List_appendTR___rarg(x_3, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_Cohere_Authoring_OptionA(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
lean_inc(x_1);
x_3 = l_Cohere_Authoring_OverlapPremises(x_1, x_2);
x_4 = !lean_is_exclusive(x_1);
if (x_4 == 0)
{
lean_object* x_5; 
x_5 = lean_ctor_get(x_1, 0);
lean_dec(x_5);
lean_ctor_set(x_1, 0, x_3);
return x_1;
}
else
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_ctor_get(x_1, 1);
lean_inc(x_6);
lean_dec(x_1);
x_7 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_7, 0, x_3);
lean_ctor_set(x_7, 1, x_6);
return x_7;
}
}
}
LEAN_EXPORT lean_object* l_Cohere_Authoring_OptionB(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
lean_inc(x_2);
x_3 = l_Cohere_Authoring_OverlapPremises(x_1, x_2);
x_4 = !lean_is_exclusive(x_2);
if (x_4 == 0)
{
lean_object* x_5; 
x_5 = lean_ctor_get(x_2, 0);
lean_dec(x_5);
lean_ctor_set(x_2, 0, x_3);
return x_2;
}
else
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_ctor_get(x_2, 1);
lean_inc(x_6);
lean_dec(x_2);
x_7 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_7, 0, x_3);
lean_ctor_set(x_7, 1, x_6);
return x_7;
}
}
}
LEAN_EXPORT lean_object* l_Cohere_Authoring_OptionC(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = l_Cohere_Authoring_OverlapPremises(x_2, x_3);
x_5 = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(x_5, 0, x_1);
x_6 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_6, 0, x_4);
lean_ctor_set(x_6, 1, x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_Cohere_Authoring_BaseOptions(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; 
lean_inc(x_3);
lean_inc(x_2);
x_4 = l_Cohere_Authoring_OptionA(x_2, x_3);
lean_inc(x_3);
lean_inc(x_2);
x_5 = l_Cohere_Authoring_OptionB(x_2, x_3);
x_6 = l_Cohere_Authoring_OptionC(x_1, x_2, x_3);
x_7 = lean_box(0);
x_8 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_8, 0, x_6);
lean_ctor_set(x_8, 1, x_7);
x_9 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_9, 0, x_5);
lean_ctor_set(x_9, 1, x_8);
x_10 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_10, 0, x_4);
lean_ctor_set(x_10, 1, x_9);
return x_10;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Authoring_ConflictDetection(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Action(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_FactSet(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Rule(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Verdict(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Cohere_Authoring_OptionGeneration(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Authoring_ConflictDetection(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Action(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_FactSet(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Rule(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Verdict(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
