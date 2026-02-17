/-
  Cohere.Types.FactSet

  A "set of facts" used throughout the kernel.

  Semantically, this is a mathematical set (order/duplicates do not matter).
  For now we represent it as a `List Fact` and use membership/subset in `Prop`,
  which is already insensitive to order and duplicates.
-/
namespace Cohere.Types

universe u

/-- Runtime fact set / premise set for a given `Fact` type (set semantics, list representation). -/
abbrev FactSet (Fact : Type u) : Type u := List Fact

namespace FactSet

/-- Membership predicate. -/
abbrev Mem {Fact : Type u} (f : Fact) (F : FactSet Fact) : Prop := f ∈ F

/-- Subset predicate (`P ⊆ F`). -/
abbrev Subset {Fact : Type u} (P F : FactSet Fact) : Prop := List.Subset P F

/-- Union of fact sets (`P ∪ Q`) under set semantics. -/
def union {Fact : Type u} (P Q : FactSet Fact) : FactSet Fact := P ++ Q

end FactSet
end Cohere.Types
