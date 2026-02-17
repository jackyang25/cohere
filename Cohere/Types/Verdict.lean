/-
  Cohere.Types.Verdict

  Fixed vocabulary of judgments about actions:
  Obligated, Allowed, Disallowed, Rejected.

  Conflicting pairs: (Obligated, Rejected), (Allowed, Rejected).
-/

namespace Cohere.Types

/-
Universe-polymorphic `Verdict` so it can wrap actions in any universe.
-/
universe u

/--
Fixed vocabulary of judgments about actions.
-/
inductive Verdict (α : Type u) : Type u where
  | Obligated : α -> Verdict α
  | Allowed : α -> Verdict α
  | Disallowed : α -> Verdict α
  | Rejected : α -> Verdict α
deriving DecidableEq, Repr

namespace Verdict

/-- Extract the action referenced by a verdict. -/
def action : Verdict α -> α
  | .Obligated a => a
  | .Allowed a => a
  | .Disallowed a => a
  | .Rejected a => a

/--
Conflicting verdict pairs on the same action:
  - (Obligated(a), Rejected(a))
  - (Allowed(a), Rejected(a))
This relation is symmetric.
-/
def conflicting : Verdict α -> Verdict α -> Prop
  | .Obligated a1, .Rejected a2 => a1 = a2
  | .Rejected a1, .Obligated a2 => a1 = a2
  | .Allowed a1, .Rejected a2 => a1 = a2
  | .Rejected a1, .Allowed a2 => a1 = a2
  | _, _ => False

/--
Conflicting verdict pairs, but compared "up to" an action normalization function.

This is the key hook for action refinement (e.g. treating `Deliver.Cesarean` as a kind of `Deliver`)
without hardcoding clinical knowledge into the kernel: the kernel just consumes `norm`.
-/
def conflictingOn (norm : α → α) : Verdict α → Verdict α → Prop
  | .Obligated a1, .Rejected a2 => norm a1 = norm a2
  | .Rejected a1, .Obligated a2 => norm a1 = norm a2
  | .Allowed a1, .Rejected a2 => norm a1 = norm a2
  | .Rejected a1, .Allowed a2 => norm a1 = norm a2
  | _, _ => False

end Verdict
end Cohere.Types
