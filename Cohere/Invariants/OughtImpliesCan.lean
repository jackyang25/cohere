/-
  Cohere.Invariants.OughtImpliesCan

  For all fact sets `F` and actions `a`, letting `D = Derive(R, F)`:
    Obligated(a) ∈ D -> ¬ Infeasible(a, F)

  No obligation may trigger an infeasibility entry.
-/
import Cohere.Derivation.Derive
import Cohere.Types.ActionAlgebra
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Invariants

open Cohere.Types
open Cohere.Derivation

universe u v
variable {Fact : Type u} {Action : Type v}

/--
Ought implies can: any derived obligation must not be infeasible
according to the action algebra's infeasibility table.
-/
def OughtImpliesCan (alg : ActionAlgebra Fact Action) (R : List (Rule Fact Action)) : Prop :=
  ∀ (F : FactSet Fact) (a : Action),
    let D := Derive R F
    D (.Obligated a) -> ¬ alg.Infeasible a F

end Cohere.Invariants
