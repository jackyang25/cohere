/-
  Cohere.Types.FactSet

  A "set of facts" used throughout the kernel.

  Semantically, this is a mathematical set (order/duplicates do not matter).
  For now we represent it as a `List Fact` and use membership/subset in `Prop`,
  which is already insensitive to order and duplicates.
-/
import Cohere.Types.Fact

namespace Cohere.Types

/-- Runtime fact set / premise set (set semantics, list representation). -/
abbrev FactSet : Type := List Fact

namespace FactSet

/-- Membership predicate. -/
abbrev Mem (f : Fact) (F : FactSet) : Prop := f ∈ F

/-- Subset predicate (`P ⊆ F`). -/
abbrev Subset (P F : FactSet) : Prop := List.Subset P F

/-- Union of fact sets (`P ∪ Q`) under set semantics. -/
def union (P Q : FactSet) : FactSet := P ++ Q

end FactSet
end Cohere.Types
