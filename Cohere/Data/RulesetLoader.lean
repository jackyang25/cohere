/-
  Cohere.Data.RulesetLoader

  Load hyperedges from versioned data artifacts.
-/

import Lean.Data.Json
import Cohere.Data.Schema
import Cohere.Types.Rule
import Cohere.Types.Verdict
import Cohere.Types.FactSet

namespace Cohere.Data

open Lean
open Cohere.Types

def parseJsonFile (α : Type) [FromJson α] (path : System.FilePath) : IO α := do
  let s ← IO.FS.readFile path
  let json ←
    match Json.parse s with
    | .ok j => pure j
    | .error e => throw <| IO.userError s!"JSON parse error in {path}: {e}"
  match fromJson? json with
  | .ok a => pure a
  | .error e => throw <| IO.userError s!"JSON schema error in {path}: {e}"

def verdictFromJson (v : VerdictJson) : IO (Verdict String) := do
  match v.kind with
  | "Obligated" => pure <| .Obligated v.action
  | "Allowed" => pure <| .Allowed v.action
  | "Disallowed" => pure <| .Disallowed v.action
  | "Rejected" => pure <| .Rejected v.action
  | other => throw <| IO.userError s!"Unknown verdict kind: {other}"

def ruleFromJson (r : RuleJson) : IO (Rule String String) := do
  let out ← verdictFromJson r.out
  pure { premises := r.premises, out }

def loadRuleset (path : System.FilePath) : IO (RulesetJson × List (Rule String String)) := do
  let rs ← parseJsonFile RulesetJson path
  let rules ← rs.rules.mapM ruleFromJson
  pure (rs, rules)

end Cohere.Data
