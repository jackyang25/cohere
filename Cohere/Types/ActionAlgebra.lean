/-
  Cohere.Types.ActionAlgebra

  Two predicates capturing clinical relationships between actions:
    Incompatible : Action -> Action -> Prop
    Feasible     : Action -> Pf(Fact) -> Prop
-/
import Cohere.Types.FactSet

namespace Cohere.Types

universe u v

/--
Action algebra interface.

This is intentionally data-driven: concrete implementations should come
from versioned artifacts (tables), not hardcoded kernel logic.
-/
structure ActionAlgebra (Fact : Type u) (Action : Type v) where
  /-- Action pairs that cannot co-occur in one plan instance. -/
  Incompatible : Action -> Action -> Prop
  /-- Whether an action is implementable under a fact set. -/
  Feasible : Action -> FactSet Fact -> Prop

end Cohere.Types
