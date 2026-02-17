/-
  Cohere.Runtime.Checker

  Bool invariant checks over derived verdicts.
-/
import Cohere.Runtime.BoolUtils
import Cohere.Runtime.Verifier

namespace Cohere.Runtime

open Cohere.Types

universe u v
variable {Fact : Type u} {Action : Type v} [DecidableEq Fact] [DecidableEq Action]

def noContradictionB (actions : List Action) (D : List (Verdict Action)) : Bool :=
  actions.all (fun a =>
    !(memB (.Obligated a) D && memB (.Rejected a) D) &&
    !(memB (.Allowed a) D && memB (.Rejected a) D)
  )

def noIncompatibleObligationsB (alg : ActionAlgebraB Fact Action) (actions : List Action) (D : List (Verdict Action)) : Bool :=
  let obligated := actions.filter (fun a => memB (.Obligated a) D)
  !(obligated.any (fun a =>
    obligated.any (fun b =>
      alg.Incompatible a b
    )
  ))

def oughtImpliesCanB (alg : ActionAlgebraB Fact Action) (actions : List Action) (F : FactSet Fact) (D : List (Verdict Action)) : Bool :=
  actions.all (fun a =>
    if memB (.Obligated a) D then alg.Feasible a F else true
  )

end Cohere.Runtime
