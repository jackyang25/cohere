/-
  Cohere.Artifacts.ActionAlgebraLoader

  Load Incompatible and Infeasible tables from versioned data.
-/

import Cohere.Artifacts.RulesetLoader
import Cohere.Artifacts.Schema
import Cohere.Types.ActionAlgebra
import Cohere.Types.FactSet

namespace Cohere.Artifacts

open Cohere.Types

def loadIncompatibility (path : System.FilePath) : IO IncompatibilityJson :=
  parseJsonFile IncompatibilityJson path

def loadInfeasibility (path : System.FilePath) : IO InfeasibilityJson :=
  parseJsonFile InfeasibilityJson path

def incompatProp (pairs : List IncompatPairJson) (a b : String) : Prop :=
  ∃ p, p ∈ pairs ∧ ((p.a = a ∧ p.b = b) ∨ (p.a = b ∧ p.b = a))

def infeasibleProp (entries : List InfeasibleEntryJson) (a : String) (F : FactSet String) : Prop :=
  ∃ e, e ∈ entries ∧ e.action = a ∧ FactSet.Subset e.premises F

def buildActionAlgebra (inc : IncompatibilityJson) (infeas : InfeasibilityJson) : ActionAlgebra String String :=
  { Incompatible := incompatProp inc.pairs
    Infeasible := infeasibleProp infeas.entries
  }

def loadActionAlgebra (incompatPath infeasPath : System.FilePath) : IO (ActionAlgebra String String) := do
  let inc ← loadIncompatibility incompatPath
  let infeas ← loadInfeasibility infeasPath
  pure <| buildActionAlgebra inc infeas

end Cohere.Artifacts
