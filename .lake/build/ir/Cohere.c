// Lean compiler output
// Module: Cohere
// Imports: Init Cohere.Types.Fact Cohere.Types.FactSet Cohere.Types.Action Cohere.Types.Verdict Cohere.Types.Rule Cohere.Types.ActionAlgebra Cohere.Derivation.Firing Cohere.Derivation.Specificity Cohere.Derivation.Derive Cohere.Invariants.NoContradiction Cohere.Invariants.NoIncompatible Cohere.Invariants.OughtImpliesCan Cohere.Invariants.InvariantChecker Cohere.Authoring.EntryPaths Cohere.Authoring.ConflictDetection Cohere.Authoring.OptionGeneration Cohere.Data.RulesetLoader Cohere.Data.ActionAlgebraLoader Cohere.Data.Schema Cohere.Certificate.Check
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
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Fact(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_FactSet(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Action(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Verdict(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_Rule(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Types_ActionAlgebra(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Derivation_Firing(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Derivation_Specificity(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Derivation_Derive(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Invariants_NoContradiction(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Invariants_NoIncompatible(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Invariants_OughtImpliesCan(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Invariants_InvariantChecker(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Authoring_EntryPaths(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Authoring_ConflictDetection(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Authoring_OptionGeneration(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Data_RulesetLoader(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Data_ActionAlgebraLoader(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Data_Schema(uint8_t builtin, lean_object*);
lean_object* initialize_Cohere_Certificate_Check(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Cohere(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Fact(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_FactSet(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Action(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Verdict(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_Rule(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Types_ActionAlgebra(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Derivation_Firing(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Derivation_Specificity(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Derivation_Derive(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Invariants_NoContradiction(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Invariants_NoIncompatible(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Invariants_OughtImpliesCan(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Invariants_InvariantChecker(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Authoring_EntryPaths(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Authoring_ConflictDetection(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Authoring_OptionGeneration(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Data_RulesetLoader(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Data_ActionAlgebraLoader(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Data_Schema(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Cohere_Certificate_Check(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
