/-
  Cohere.Examples.ObstetricsDemo

  This module is for learning and prototyping only.
  It is NOT clinical advice and is NOT part of the trusted kernel.

  Intention:
  - define a small concrete `Fact`/`Action` universe
  - instantiate a tiny ruleset
  - sanity-check `Derive` and `Accept` against the paper examples

  Note: we intentionally do NOT import this module from `Cohere.lean`.
-/

import Cohere
import Std

namespace Cohere.Examples.ObstetricsDemo

open Cohere.Types

/-!
Concrete (toy) universe for prototyping.

These are stand-ins for the canonical tokens that would normally come from the ontology layer.
-/
inductive DemoFact where
  | severePreeclampsia
  | gaGE34w
  | placentaPrevia
  | fetalStatusReassuring
  | extremePrematurity
deriving DecidableEq, Repr, BEq

inductive DemoAction where
  | deliver
  | deliverCesarean
  | wait
  | escalateMFM
  | escalateSpecialist
deriving DecidableEq, Repr, BEq

abbrev FS : Type := FactSet DemoFact
abbrev RuleT : Type := Rule DemoFact DemoAction
abbrev V : Type := Verdict DemoAction

/-!
Example ruleset mirroring the LaTeX examples (illustrative only):

- R1: {Severe, GA>=34} -> Obligated(Deliver)
- R2: {Reassuring} -> Allowed(Wait)
- R3: {Previa} -> Rejected(Deliver)
- R4: {Severe, GA>=34, Previa} -> Obligated(Deliver.Cesarean)   (resolution rule)
- R5: {Severe, GA>=34, ExtremePrematurity} -> Obligated(Escalate.MFM)
-/
def ruleset : List RuleT :=
  [ { premises := [.severePreeclampsia, .gaGE34w], out := .Obligated .deliver }
  , { premises := [.fetalStatusReassuring], out := .Allowed .wait }
  , { premises := [.placentaPrevia], out := .Rejected .deliver }
  /-
    Resolution rule for the overlap.

    Note: the kernel currently treats distinct action tokens as distinct actions.
    To demonstrate specificity-based shadowing (and avoid a contradiction on `deliver`),
    this overlap rule targets the same action token `deliver`.

    If you later model action refinement/subtyping, you can switch this back to
    `deliverCesarean` and teach the conflict/shadowing relation about refinements.
  -/
  , { premises := [.severePreeclampsia, .gaGE34w, .placentaPrevia], out := .Obligated .deliver }
  , { premises := [.severePreeclampsia, .gaGE34w, .extremePrematurity], out := .Obligated .escalateMFM }
  ]

/-!
Toy action algebra.

This mirrors the sample JSON artifacts:
- Deliver/Deliver.Cesarean are incompatible with Wait.
- Feasible is unconstrained (always true) in this placeholder.
-/
def incompatible : DemoAction -> DemoAction -> Prop
  | .deliver, .wait => True
  | .wait, .deliver => True
  | .deliverCesarean, .wait => True
  | .wait, .deliverCesarean => True
  | _, _ => False

def feasible (_a : DemoAction) (_F : FS) : Prop := True

def alg : ActionAlgebra DemoFact DemoAction :=
  { Incompatible := incompatible, Feasible := feasible }

/-!
Executable (Bool) driver for prototyping.

This is *not* the proof-level kernel; it is a small computable mirror so you can see I/O.
-/
def subsetb (P F : List DemoFact) : Bool :=
  P.all (fun p => F.contains p)

def strictSubsetb (P Q : List DemoFact) : Bool :=
  subsetb P Q && !(subsetb Q P)

def sameActionb (v₁ v₂ : V) : Bool :=
  (Verdict.action v₁) == (Verdict.action v₂)

def conflictingb : V -> V -> Bool
  | .Obligated a1, .Rejected a2 => a1 == a2
  | .Rejected a1, .Obligated a2 => a1 == a2
  | .Allowed a1, .Rejected a2 => a1 == a2
  | .Rejected a1, .Allowed a2 => a1 == a2
  | _, _ => false

def firesb (r : RuleT) (F : FS) : Bool :=
  subsetb r.premises F

def shadowedb (Rs : List RuleT) (F : FS) (r1 : RuleT) : Bool :=
  if firesb r1 F then
    Rs.any (fun r2 =>
      firesb r2 F &&
      sameActionb r1.out r2.out &&
      strictSubsetb r1.premises r2.premises &&
      conflictingb r1.out r2.out
    )
  else
    false

def derived (Rs : List RuleT) (F : FS) : List V :=
  ((Rs.filter (fun r => firesb r F && !(shadowedb Rs F r))).map (fun r => r.out)).eraseDups

def memVerdict (v : V) (vs : List V) : Bool :=
  vs.any (fun w => decide (w = v))

def acceptb (Rs : List RuleT) (F : FS) (aStar : DemoAction) : Bool :=
  let D := derived Rs F
  memVerdict (.Obligated aStar) D ||
    (memVerdict (.Allowed aStar) D && !(memVerdict (.Rejected aStar) D))

/-!
Sample fact sets for the paper scenarios.
-/
def factsA : FS := [.severePreeclampsia, .gaGE34w]
def factsOverlap : FS := [.severePreeclampsia, .gaGE34w, .placentaPrevia]

/-!
Run a couple of sanity checks in the Lean evaluator.

Expected:
- Example A derives `Obligated deliver`
- Overlap case derives `Obligated deliverCesarean` (and does not keep the conflicting deliver verdicts)
-/
#eval derived ruleset factsA
#eval derived ruleset factsOverlap

#eval acceptb ruleset factsA .deliver
#eval acceptb ruleset factsOverlap .deliver
#eval acceptb ruleset factsOverlap .deliverCesarean

end Cohere.Examples.ObstetricsDemo
