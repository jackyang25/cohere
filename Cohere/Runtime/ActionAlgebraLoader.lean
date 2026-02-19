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

def infeasibleB (entries : List InfeasibleEntryJson) (a : String) (F : FactSet String) : Bool :=
  entries.any (fun e =>
    decide (e.action = a) && (subsetB e.premises F)
  )

def buildActionAlgebraB (inc : IncompatibilityJson) (infeas : InfeasibilityJson) : ActionAlgebraB String String :=
  { Incompatible := incompatB inc.pairs
    Infeasible := infeasibleB infeas.entries
  }

def loadActionAlgebraB (incompatPath infeasPath : System.FilePath) : IO (ActionAlgebraB String String) := do
  let inc ← Cohere.Artifacts.loadIncompatibility incompatPath
  let infeas ← Cohere.Artifacts.loadInfeasibility infeasPath
  pure <| buildActionAlgebraB inc infeas

end Cohere.Runtime
