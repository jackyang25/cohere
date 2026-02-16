/-
  Cohere.Types.Verdict

  Fixed vocabulary of judgments about actions:
  Obligated, Allowed, Disallowed, Rejected.

  Conflicting pairs: (Obligated, Rejected), (Allowed, Rejected).
-/

namespace Cohere.Types

/--
Fixed vocabulary of judgments about actions.
-/
inductive Verdict (α : Type) : Type where
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

end Verdict
end Cohere.Types
