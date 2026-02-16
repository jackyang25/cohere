/-
  Cohere.Invariants.NoIncompatible

  For all fact sets `F`, letting `D = Derive(R, F)`:
    ¬∃ a b, Obligated(a) ∈ D ∧ Obligated(b) ∈ D ∧ Incompatible(a, b)
-/
import Cohere.Derivation.Derive
import Cohere.Types.Action
import Cohere.Types.ActionAlgebra
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Invariants

open Cohere.Types
open Cohere.Derivation

/--
No incompatible obligations: you cannot derive obligations for two actions
that are marked incompatible by the action algebra.
-/
def NoIncompatibleObligations (alg : ActionAlgebra) (R : List Rule) : Prop :=
  ∀ (F : FactSet),
    let D := Derive R F
    ¬ ∃ (a b : Action),
        D (.Obligated a) ∧
        D (.Obligated b) ∧
        alg.Incompatible a b

end Cohere.Invariants
