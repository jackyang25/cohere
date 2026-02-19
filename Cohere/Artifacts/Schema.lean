/-
  Cohere.Artifacts.Schema

  Data format definitions for versioned clinical data artifacts
  (rules, incompatibility tables, infeasibility tables).
-/

import Lean.Data.Json

namespace Cohere.Artifacts

open Lean

/-!
These schema types define the JSON artifact formats under `data/`.

They are intentionally minimal and stringly-typed so we can prototype quickly.
The kernel remains parametric; a loader layer maps these strings to concrete IDs.
-/

structure VerdictJson where
  kind : String
  action : String
deriving FromJson, Repr

structure RuleJson where
  id : String
  premises : List String
  out : VerdictJson
  source : Option String := none
deriving FromJson, Repr

structure RulesetJson where
  version : String
  domain : String
  facts : List String := []
  actions : List String := []
  rules : List RuleJson := []
  notes : Option String := none
deriving FromJson, Repr

structure IncompatPairJson where
  a : String
  b : String
deriving FromJson, Repr

structure IncompatibilityJson where
  version : String
  pairs : List IncompatPairJson := []
  notes : Option String := none
deriving FromJson, Repr

structure InfeasibleEntryJson where
  action : String
  premises : List String := []
deriving FromJson, Repr

structure InfeasibilityJson where
  version : String
  entries : List InfeasibleEntryJson := []
  notes : Option String := none
deriving FromJson, Repr

end Cohere.Artifacts
