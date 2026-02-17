/-
  Cohere.Data.ActionAlgebraLoader

  Load Incompatible and Feasible tables from versioned data.
-/

import Cohere.Data.RulesetLoader
import Cohere.Data.Schema
import Cohere.Types.ActionAlgebra
import Cohere.Types.FactSet
import Cohere.Runtime.Verifier
import Cohere.Runtime.BoolUtils

namespace Cohere.Data

open Cohere.Types
open Cohere.Runtime

def loadIncompatibility (path : System.FilePath) : IO IncompatibilityJson :=
  parseJsonFile IncompatibilityJson path

def loadFeasibility (path : System.FilePath) : IO FeasibilityJson :=
  parseJsonFile FeasibilityJson path

def incompatProp (pairs : List IncompatPairJson) (a b : String) : Prop :=
  ∃ p, p ∈ pairs ∧ ((p.a = a ∧ p.b = b) ∨ (p.a = b ∧ p.b = a))

def feasibleProp (entries : List FeasibleEntryJson) (a : String) (F : FactSet String) : Prop :=
  ∃ e, e ∈ entries ∧ e.action = a ∧ FactSet.Subset e.requiresAllFacts F

def buildActionAlgebra (inc : IncompatibilityJson) (feas : FeasibilityJson) : ActionAlgebra String String :=
  { Incompatible := incompatProp inc.pairs
    Feasible := feasibleProp feas.entries
  }

def loadActionAlgebra (incompatPath feasPath : System.FilePath) : IO (ActionAlgebra String String) := do
  let inc ← loadIncompatibility incompatPath
  let feas ← loadFeasibility feasPath
  pure <| buildActionAlgebra inc feas

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
  let inc ← loadIncompatibility incompatPath
  let feas ← loadFeasibility feasPath
  pure <| buildActionAlgebraB inc feas

end Cohere.Data
