/-
  Cohere.Types.ActionAlgebra

  Two predicates capturing clinical relationships between actions:
    Incompatible : Action -> Action -> Prop
    Infeasible   : Action -> Pf(Fact) -> Prop

  Default assumption: every action is feasible unless the infeasibility
  table says otherwise. The table only encodes exceptions.
-/
import Cohere.Types.FactSet

namespace Cohere.Types

universe u v

/--
Action algebra interface.

This is intentionally data-driven: concrete implementations should come
from versioned artifacts (tables), not hardcoded kernel logic.

`Infeasible a F` holds when the action `a` cannot be performed under
fact set `F`. Each infeasibility entry has a premise set; the entry
applies when its premises are a subset of `F` (same subset matching
as rule firing). Any single matching entry makes the action infeasible.
-/
structure ActionAlgebra (Fact : Type u) (Action : Type v) where
  /-- Action pairs that cannot co-occur in one plan instance. -/
  Incompatible : Action -> Action -> Prop
  /-- Whether an action is blocked under a fact set. -/
  Infeasible : Action -> FactSet Fact -> Prop

end Cohere.Types
