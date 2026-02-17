/-
  Cohere.Runtime.Verifier

  Executable (Bool) checker/verifier for prototyping.

  This is an untrusted executable mirror of the `Prop`-level kernel semantics.
  The long-term goal is to connect this to the `Prop` definitions via proofs
  (soundness: checker=true -> invariants hold).
-/
import Cohere.Runtime.BoolUtils
import Cohere.Types.Rule
import Cohere.Types.Verdict
import Cohere.Types.FactSet

namespace Cohere.Runtime

open Cohere.Types

universe u v
variable {Fact : Type u} {Action : Type v} [DecidableEq Fact] [DecidableEq Action]

/-!
Bool-backed action algebra for executable checking.

The kernel uses `Prop`-valued relations; for running, we use Bool versions.
-/
structure ActionAlgebraB (Fact : Type u) (Action : Type v) where
  Incompatible : Action -> Action -> Bool
  Feasible : Action -> FactSet Fact -> Bool

def sameActionB (v₁ v₂ : Verdict Action) : Bool :=
  decide (Verdict.action v₁ = Verdict.action v₂)

def conflictingB : Verdict Action -> Verdict Action -> Bool
  | .Obligated a1, .Rejected a2 => decide (a1 = a2)
  | .Rejected a1, .Obligated a2 => decide (a1 = a2)
  | .Allowed a1, .Rejected a2 => decide (a1 = a2)
  | .Rejected a1, .Allowed a2 => decide (a1 = a2)
  | _, _ => false

def firesB (r : Rule Fact Action) (F : FactSet Fact) : Bool :=
  subsetB r.premises F

def shadowedB (R : List (Rule Fact Action)) (F : FactSet Fact) (r1 : Rule Fact Action) : Bool :=
  if firesB r1 F then
    R.any (fun r2 =>
      firesB r2 F &&
      sameActionB r1.out r2.out &&
      strictSubsetB r1.premises r2.premises &&
      conflictingB r1.out r2.out
    )
  else
    false

def derived (R : List (Rule Fact Action)) (F : FactSet Fact) : List (Verdict Action) :=
  -- duplicates don't affect membership-based checks (memB/acceptB/invariants), so keep it simple
  (R.filter (fun r => firesB r F && !(shadowedB R F r))).map (fun r => r.out)

def acceptB (R : List (Rule Fact Action)) (F : FactSet Fact) (aStar : Action) : Bool :=
  let D := derived R F
  memB (.Obligated aStar) D ||
    (memB (.Allowed aStar) D && !(memB (.Rejected aStar) D))

end Cohere.Runtime
