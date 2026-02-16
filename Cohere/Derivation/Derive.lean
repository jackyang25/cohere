/-
  Cohere.Derivation.Derive

  The core derivation function:
    Derive(R, F) = { v(a) | (P → v(a)) ∈ Fired(R,F) \ Shadowed(R,F) }

  Properties: determinism, specificity soundness.
-/

import Cohere.Derivation.Firing
import Cohere.Derivation.Specificity
import Cohere.Types.Action
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Derivation

open Cohere.Types

/-- Fired rules as a logical set (`Rule -> Prop`). -/
def Fired (R : List Rule) (F : FactSet) : Rule -> Prop :=
  fun r => r ∈ R ∧ Fires r F

/-- Shadowed rules as a logical set (`Rule -> Prop`). -/
def ShadowedSet (R : List Rule) (F : FactSet) : Rule -> Prop :=
  fun r => Shadowed R F r

/--
Derived verdicts as a logical set (`Verdict Action -> Prop`).

A verdict is derived iff it is the output of some fired rule that is not shadowed.
-/
def Derive (R : List Rule) (F : FactSet) : Verdict Action -> Prop :=
  fun v =>
    ∃ r, r ∈ R ∧
      Fires r F ∧
      ¬ Shadowed R F r ∧
      r.out = v

end Cohere.Derivation
