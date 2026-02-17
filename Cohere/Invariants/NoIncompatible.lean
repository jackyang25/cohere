/-
  Cohere.Invariants.NoIncompatible

  For all fact sets `F`, letting `D = Derive(R, F)`:
    ¬∃ a b, Obligated(a) ∈ D ∧ Obligated(b) ∈ D ∧ Incompatible(a, b)
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
No incompatible obligations: you cannot derive obligations for two actions
that are marked incompatible by the action algebra.
-/
def NoIncompatibleObligations (alg : ActionAlgebra Fact Action) (R : List (Rule Fact Action)) : Prop :=
  ∀ (F : FactSet Fact),
    let D := Derive R F
    ¬ ∃ (a b : Action),
        D (.Obligated a) ∧
        D (.Obligated b) ∧
        alg.Incompatible a b

end Cohere.Invariants
