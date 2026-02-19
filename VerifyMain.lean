/-
  VerifyMain

  Small CLI entry point for prototyping artifact verification.

  Usage:
    lake exe cohere-verify
    lake exe cohere-verify data/rules/obstetrics-v1.0.json data/actions/incompatible-v1.0.json data/infeasibility/infeasible-v1.0.json
-/
import Cohere.Artifacts.RulesetLoader
import Cohere.Runtime.Verifier
import Cohere.Runtime.InvariantChecks
import Cohere.Runtime.ActionAlgebraLoader

open Cohere.Artifacts
open Cohere.Runtime

def defaultRulesPath : System.FilePath := "data/rules/obstetrics-v1.0.json"
def defaultIncompatPath : System.FilePath := "data/actions/incompatible-v1.0.json"
def defaultInfeasPath : System.FilePath := "data/infeasibility/infeasible-v1.0.json"

def main (args : List String) : IO UInt32 := do
  let (rulesPath, incompatPath, infeasPath) :=
    match args with
    | [r, i, f] => (System.FilePath.mk r, System.FilePath.mk i, System.FilePath.mk f)
    | _ => (defaultRulesPath, defaultIncompatPath, defaultInfeasPath)

  let (rsMeta, rules) ← loadRuleset rulesPath
  let algB ← Cohere.Runtime.loadActionAlgebraB incompatPath infeasPath

  let actions := rsMeta.actions

  -- Prototype check: evaluate invariants over fact sets generated from each rule's premises.
  -- Full "for all fact sets" checking comes later once we have a finite fact universe.
  let factSets : List (List String) :=
    (rules.map (fun r => r.premises))

  let ok :=
    factSets.all (fun F =>
      let D := derived rules F
      Cohere.Runtime.noContradictionB actions D &&
      Cohere.Runtime.noIncompatibleObligationsB algB actions D &&
      Cohere.Runtime.oughtImpliesCanB algB actions F D
    )

  if ok then
    IO.println s!"OK: invariants hold for {factSets.length} checked fact-sets (ruleset {rsMeta.domain} v{rsMeta.version})."
    pure 0
  else
    IO.eprintln s!"FAIL: invariant violation detected (ruleset {rsMeta.domain} v{rsMeta.version})."
    pure 1
