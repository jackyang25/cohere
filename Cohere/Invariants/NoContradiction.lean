/-
  Cohere.Invariants.NoContradiction

  For all fact sets `F` and actions `a`, letting `D = Derive(R, F)`:
    ¬(Obligated(a) ∈ D ∧ Rejected(a) ∈ D)
    ¬(Allowed(a) ∈ D ∧ Rejected(a) ∈ D)
-/
import Cohere.Derivation.Derive
import Cohere.Types.Action
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Invariants

open Cohere.Types
open Cohere.Derivation

/--
No contradictory verdicts survive derivation.

This matches the spec's conflicting verdict pairs:
- `(Obligated(a), Rejected(a))`
- `(Allowed(a), Rejected(a))`
-/
def NoContradiction (R : List Rule) : Prop :=
  ∀ (F : FactSet) (a : Action),
    let D := Derive R F
    ¬ (D (.Obligated a) ∧ D (.Rejected a)) ∧
    ¬ (D (.Allowed a) ∧ D (.Rejected a))

end Cohere.Invariants
