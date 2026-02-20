/-
  VerifyMain

  Small CLI entry point for prototyping artifact verification.

  Usage:
    lake exe cohere-verify
    lake exe cohere-verify <rules.json> <incompatible.json> <infeasible.json> [fact-exclusions.json]

  Output format (stdout, one line per invariant):
    PASS no_contradictory_verdicts
    PASS no_incompatible_obligations
    FAIL ought_implies_can
-/
import Cohere.Artifacts.RulesetLoader
import Cohere.Runtime.Verifier
import Cohere.Runtime.InvariantChecks
import Cohere.Runtime.ActionAlgebraLoader
import Cohere.Runtime.FactConstraintsB
import Cohere.Runtime.FactConstraintsLoader

open Cohere.Artifacts
open Cohere.Runtime

def defaultRulesPath : System.FilePath := "data/rules/obstetrics-v1.0.json"
def defaultIncompatPath : System.FilePath := "data/actions/incompatible-v1.0.json"
def defaultInfeasPath : System.FilePath := "data/infeasibility/infeasible-v1.0.json"
def defaultExclusionsPath : Option System.FilePath := some "data/constraints/fact-exclusions-v1.0.json"

def main (args : List String) : IO UInt32 := do
  let (rulesPath, incompatPath, infeasPath, exclusionsPath) :=
    match args with
    | [r, i, f, e] =>
      (System.FilePath.mk r, System.FilePath.mk i, System.FilePath.mk f, some (System.FilePath.mk e))
    | [r, i, f] =>
      (System.FilePath.mk r, System.FilePath.mk i, System.FilePath.mk f, (none : Option System.FilePath))
    | _ =>
      (defaultRulesPath, defaultIncompatPath, defaultInfeasPath, defaultExclusionsPath)

  let (rsMeta, rules) ← loadRuleset rulesPath
  let algB ← Cohere.Runtime.loadActionAlgebraB incompatPath infeasPath

  let fcB : FactConstraintsB String ← do
    match exclusionsPath with
    | some p =>
      let found ← p.pathExists
      if found then Cohere.Runtime.loadFactConstraintsB p
      else pure { exclusionGroups := [] }
    | none => pure { exclusionGroups := [] }

  let actions := rsMeta.actions

  let rawFactSets : List (List String) :=
    rules.map (fun r => r.premises)

  let factSets := rawFactSets.filter (fun F => validFactSetB fcB F)

  let excluded := rawFactSets.length - factSets.length

  let noContra := factSets.all (fun F =>
    let D := derived rules F
    Cohere.Runtime.noContradictionB actions D
  )
  let noIncompat := factSets.all (fun F =>
    let D := derived rules F
    Cohere.Runtime.noIncompatibleObligationsB algB actions D
  )
  let oughtCan := factSets.all (fun F =>
    let D := derived rules F
    Cohere.Runtime.oughtImpliesCanB algB actions F D
  )

  IO.println s!"{if noContra then "PASS" else "FAIL"} no_contradictory_verdicts"
  IO.println s!"{if noIncompat then "PASS" else "FAIL"} no_incompatible_obligations"
  IO.println s!"{if oughtCan then "PASS" else "FAIL"} ought_implies_can"

  let ok := noContra && noIncompat && oughtCan
  IO.println s!"{if ok then "OK" else "FAIL"}: invariants checked for {factSets.length} fact-sets ({excluded} excluded by constraints) (ruleset {rsMeta.domain} v{rsMeta.version})."

  pure (if ok then 0 else 1)
