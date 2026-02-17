/-
  Cohere.Runtime.ActionAlgebraLoader

  Build/load a Bool-backed action algebra (`ActionAlgebraB`) from JSON artifacts.

  This lives in `Runtime` so the artifacts layer (`Cohere.Artifacts.*`) stays
  independent of the executable checker.
-/

import Cohere.Artifacts.ActionAlgebraLoader
import Cohere.Runtime.ActionAlgebraB
import Cohere.Runtime.BoolUtils

namespace Cohere.Runtime

open Cohere.Artifacts
open Cohere.Types

def incompatB (pairs : List IncompatPairJson) (a b : String) : Bool :=
  pairs.any (fun p => decide ((p.a = a ∧ p.b = b) ∨ (p.a = b ∧ p.b = a)))

def feasibleB (entries : List FeasibleEntryJson) (a : String) (F : FactSet String) : Bool :=
  entries.any (fun e =>
    decide (e.action = a) && (subsetB e.requiresAllFacts F)
  )

def buildActionAlgebraB (inc : IncompatibilityJson) (feas : FeasibilityJson) : ActionAlgebraB String String :=
  { Incompatible := incompatB inc.pairs
    Feasible := feasibleB feas.entries
  }

def loadActionAlgebraB (incompatPath feasPath : System.FilePath) : IO (ActionAlgebraB String String) := do
  let inc ← Cohere.Artifacts.loadIncompatibility incompatPath
  let feas ← Cohere.Artifacts.loadFeasibility feasPath
  pure <| buildActionAlgebraB inc feas

end Cohere.Runtime
