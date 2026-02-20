/-
  Cohere.Types.FactConstraints

  Mutual exclusion constraints on facts: groups of facts where at most
  one can be true for any valid patient state.

  This narrows the domain of quantification for invariant proofs from
  "all fact subsets" to "all *valid* fact subsets".
-/
import Cohere.Types.FactSet

namespace Cohere.Types

universe u

/--
Fact constraints interface.

`MutuallyExclusive` takes a list of exclusion groups. A fact set is valid
iff for each group, at most one member of that group is present.
-/
structure FactConstraints (Fact : Type u) where
  exclusionGroups : List (List Fact)

/-- A fact set respects a single exclusion group (at most one member present). -/
def FactConstraints.respectsGroup [DecidableEq Fact] (group : List Fact) (F : FactSet Fact) : Prop :=
  (group.filter (fun f => f ∈ F)).length ≤ 1

/-- A fact set is valid under the constraints (respects all exclusion groups). -/
def FactConstraints.valid [DecidableEq Fact] (fc : FactConstraints Fact) (F : FactSet Fact) : Prop :=
  ∀ group, group ∈ fc.exclusionGroups → FactConstraints.respectsGroup group F

end Cohere.Types
