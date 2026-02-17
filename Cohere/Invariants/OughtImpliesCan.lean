/-
  Cohere.Invariants.OughtImpliesCan

  For all fact sets `F` and actions `a`, letting `D = Derive(R, F)`:
    Obligated(a) ∈ D -> Feasible(a, F)
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
Ought implies can: any derived obligation must be feasible according
to the action algebra.
-/
def OughtImpliesCan (alg : ActionAlgebra Fact Action) (R : List (Rule Fact Action)) : Prop :=
  ∀ (F : FactSet Fact) (a : Action),
    let D := Derive R F
    D (.Obligated a) -> alg.Feasible a F

end Cohere.Invariants
