/-
  Cohere.Artifacts.FactConstraintsLoader

  Load fact exclusion groups from versioned JSON data.
-/
import Cohere.Artifacts.RulesetLoader
import Cohere.Artifacts.Schema
import Cohere.Types.FactConstraints

namespace Cohere.Artifacts

open Cohere.Types

def loadFactExclusions (path : System.FilePath) : IO FactExclusionsJson :=
  parseJsonFile FactExclusionsJson path

def buildFactConstraints (fe : FactExclusionsJson) : FactConstraints String :=
  { exclusionGroups := fe.groups.map (fun g => g.facts) }

def loadFactConstraints (path : System.FilePath) : IO (FactConstraints String) := do
  let fe ← loadFactExclusions path
  pure <| buildFactConstraints fe

end Cohere.Artifacts
