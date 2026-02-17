/-
  Cohere.Authoring.ConflictDetection

  Pairwise conflict checks for authoring-time rule admission.
  These are pure logical definitions; a downstream tool can decide them
  once `Fact`/`Action` are made decidable via concrete data.
-/
import Cohere.Derivation.Firing
import Cohere.Derivation.Specificity
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Authoring

open Cohere.Types
open Cohere.Derivation

universe u v
variable {Fact : Type u} {Action : Type v}

/-- Two rules conflict if they target the same action with conflicting verdicts. -/
def ConflictingRules (r₁ r₂ : Rule Fact Action) : Prop :=
  SameAction r₁ r₂ ∧ Verdict.conflicting r₁.out r₂.out

/--
Premises are independent if neither premise list is a (logical) subset of the other.
This corresponds to "neither is a subset of the other" in the spec.
-/
def IndependentPremises (r₁ r₂ : Rule Fact Action) : Prop :=
  ¬ PremisesHold r₁.premises r₂.premises ∧
  ¬ PremisesHold r₂.premises r₁.premises

/--
The canonical "overlap witness" fact set used to surface conflicts:
the concatenation of both premise lists.

This mirrors $P₁ ∪ P₂$ in the spec, using lists as our current finite representation.
-/
def OverlapFacts (r₁ r₂ : Rule Fact Action) : FactSet Fact :=
  Cohere.Types.FactSet.union r₁.premises r₂.premises

/--
Two rules can co-fire under some fact set.

We witness co-firing using `OverlapFacts r₁ r₂` (which contains both premise lists).
-/
def CanCofire (r₁ r₂ : Rule Fact Action) : Prop :=
  Fires r₁ (OverlapFacts r₁ r₂) ∧ Fires r₂ (OverlapFacts r₁ r₂)

/--
A "guided resolution" conflict: conflicting rules with independent premises.
This is the Path 3 trigger in the authoring contract.
-/
def GuidedConflict (r₁ r₂ : Rule Fact Action) : Prop :=
  ConflictingRules r₁ r₂ ∧ IndependentPremises r₁ r₂

end Cohere.Authoring
