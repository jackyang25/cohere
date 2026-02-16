/-
  Cohere.Authoring.EntryPaths

  Authoring contract entry paths for a proposed new rule:
    1. Clean entry — no conflicts, rule enters directly.
    2. Specificity resolution — conflict exists but is resolved by specificity.
    3. Guided resolution — conflicting independent premises; conflict is surfaced.

  This module defines the *logical* predicates corresponding to these paths.
-/
import Cohere.Authoring.ConflictDetection
import Cohere.Derivation.Specificity
import Cohere.Types.Rule

namespace Cohere.Authoring

open Cohere.Types
open Cohere.Derivation

/-- Path 1: the new rule has no conflicting counterpart in the existing ruleset. -/
def CleanEntry (R : List Rule) (rNew : Rule) : Prop :=
  ∀ rOld, rOld ∈ R -> ¬ ConflictingRules rNew rOld

/--
Path 2 (minimal form): there exists a conflicting rule, but premises are not independent,
so specificity ordering can resolve the overlap (one premise set is a subset of the other).
-/
def SpecificityResolvable (R : List Rule) (rNew : Rule) : Prop :=
  ∃ rOld, rOld ∈ R ∧
    ConflictingRules rNew rOld ∧
    ¬ IndependentPremises rNew rOld

/-- Path 3: there exists a guided conflict with some existing rule. -/
def GuidedResolutionNeeded (R : List Rule) (rNew : Rule) : Prop :=
  ∃ rOld, rOld ∈ R ∧ GuidedConflict rNew rOld

end Cohere.Authoring
