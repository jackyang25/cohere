/-
  Cohere.Runtime.FactConstraintsB

  Bool-backed fact constraint checker for executable use.

  A fact set is valid iff for each exclusion group, at most one
  member of that group appears in the set.
-/
import Cohere.Runtime.BoolUtils

namespace Cohere.Runtime

/-- Bool-backed fact constraints for runtime checking. -/
structure FactConstraintsB (Fact : Type u) where
  exclusionGroups : List (List Fact)

/-- Check that at most one fact from a single exclusion group is present. -/
def respectsGroupB [DecidableEq Fact] (group : List Fact) (F : List Fact) : Bool :=
  (group.filter (fun f => memB f F)).length ≤ 1

/-- A fact set is valid under constraints (respects all exclusion groups). -/
def validFactSetB [DecidableEq Fact] (fc : FactConstraintsB Fact) (F : List Fact) : Bool :=
  fc.exclusionGroups.all (fun group => respectsGroupB group F)

end Cohere.Runtime
