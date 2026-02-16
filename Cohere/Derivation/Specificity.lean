/-
  Cohere.Derivation.Specificity

  Specificity ordering and shadowing.
  A fired rule r₁ is shadowed by r₂ iff:
    - both fire and target the same action,
    - P(r₁) ⊂ P(r₂) (strict subset),
    - r₁ and r₂ have conflicting verdicts on that action.
-/

import Cohere.Derivation.Firing
import Cohere.Types.Action
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Derivation

open Cohere.Types

/-- Two rules target the same action. -/
abbrev SameAction (r₁ r₂ : Rule) : Prop :=
  Verdict.action r₁.out = Verdict.action r₂.out

/--
`MoreSpecific r₁ r₂` means `r₂` has strictly more premises than `r₁`,
i.e. `premises(r₁) ⊂ premises(r₂)` under logical subset.
-/
def MoreSpecific (r₁ r₂ : Rule) : Prop :=
  PremisesHold r₁.premises r₂.premises ∧ ¬ PremisesHold r₂.premises r₁.premises

/--
A fired rule `r₁` is shadowed (w.r.t. ruleset `R` and facts `F`)
if there exists a fired, more specific `r₂` targeting the same action
with a conflicting verdict.
-/
def Shadowed (R : List Rule) (F : FactSet) (r₁ : Rule) : Prop :=
  r₁ ∈ R ∧
  Fires r₁ F ∧
  ∃ r₂, r₂ ∈ R ∧
    Fires r₂ F ∧
    SameAction r₁ r₂ ∧
    MoreSpecific r₁ r₂ ∧
    Verdict.conflicting r₁.out r₂.out

end Cohere.Derivation
