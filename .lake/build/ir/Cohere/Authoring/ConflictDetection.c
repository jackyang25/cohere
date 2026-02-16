// Lean compiler output
// Module: Cohere.Authoring.ConflictDetection
// Imports: Init Cohere.Derivation.Firing Cohere.Derivation.Specificity Cohere.Types.FactSet Cohere.Types.Rule Cohere.Types.Verdict
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
lean_object* l_List_appendTR___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_OverlapFacts(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Cohere_Authoring_OverlapFacts(lean_object* x_1, lean_object* x_2) {
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
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Derivation_Firing(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Derivation_Specificity(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_FactSet(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Rule(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Verdict(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Cohere_Authoring_ConflictDetection(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Derivation_Firing(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Derivation_Specificity(builtin, lean_io_mk_world());
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
