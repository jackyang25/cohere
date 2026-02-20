/-
  Cohere.Runtime.FactConstraintsLoader

  Build a Bool-backed FactConstraintsB from JSON artifacts.
-/
import Cohere.Artifacts.FactConstraintsLoader
import Cohere.Runtime.FactConstraintsB

namespace Cohere.Runtime

open Cohere.Artifacts

def buildFactConstraintsB (fe : FactExclusionsJson) : FactConstraintsB String :=
  { exclusionGroups := fe.groups.map (fun g => g.facts) }

def loadFactConstraintsB (path : System.FilePath) : IO (FactConstraintsB String) := do
  let fe ← Cohere.Artifacts.loadFactExclusions path
  pure <| buildFactConstraintsB fe

end Cohere.Runtime
