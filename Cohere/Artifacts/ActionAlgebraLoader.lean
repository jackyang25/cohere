/-
  Cohere.Artifacts.ActionAlgebraLoader

  Load Incompatible and Feasible tables from versioned data.
-/

import Cohere.Artifacts.RulesetLoader
import Cohere.Artifacts.Schema
import Cohere.Types.ActionAlgebra
import Cohere.Types.FactSet

namespace Cohere.Artifacts

open Cohere.Types

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

end Cohere.Artifacts
