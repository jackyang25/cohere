# Cohere

Verified clinical hypergraph decision support kernel, written in Lean 4.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Lean 4](https://img.shields.io/badge/Lean-4_(v4.15.0)-blue.svg)](https://lean-lang.org/)
[![Lake](https://img.shields.io/badge/build-Lake-lightgrey.svg)](https://github.com/leanprover/lake)

---

## What it does

Given a ruleset `R` and a patient fact set `F`, the kernel defines:

- **Derivation** -- `Derive R F` produces the set of verdicts (`Obligated`, `Allowed`, `Disallowed`, `Rejected`) that survive specificity-based shadowing.
- **Certificate decision** -- `Accept R F a*` determines whether a proposed action is accepted.
- **Safety invariants** (Prop-level, checked at verification time):

| # | Invariant | Statement |
|---|-----------|-----------|
| 1 | No contradiction | `Obligated(a)` and `Rejected(a)` never co-derive; nor do `Allowed(a)` and `Rejected(a)` |
| 2 | No incompatible obligations | Two actions marked incompatible are never both `Obligated` |
| 3 | Ought implies can | `Obligated(a)` never triggers an infeasibility entry |

The kernel is **parametric** in `Fact` and `Action`. No clinical ontology is baked in.

## Infeasibility table

Every action is feasible by default. The infeasibility table encodes exceptions only.

Each entry has a premise set, just like a rule. If those premises are a subset of the patient's fact set, the entry fires and the action becomes infeasible. Any single matching entry is sufficient. This uses the same subset matching as rule firing -- one matching model for the entire system.

## Repository layout

```
Cohere/
├── Types/          FactSet, Rule, Verdict, ActionAlgebra
├── Derivation/     Firing, Specificity/Shadowing, Derive
├── Invariants/     NoContradiction, NoIncompatible, OughtImpliesCan
├── Certificate/    Accept/Reject predicate
├── Authoring/      Conflict detection, option generation
├── Artifacts/      JSON schema types + loaders (optional IO layer)
└── Runtime/        Bool-backed verifier, invariant checks, soundness proofs
```

- `VerifyMain.lean` -- CLI entry point (`lake exe cohere-verify`)
- `data/` -- Example JSON artifacts (rules, incompatibility, infeasibility)

## Build

```bash
lake build
```

## Run the verifier

Default artifacts:

```bash
lake exe cohere-verify
```

Custom artifacts (three paths: ruleset, incompatibility, infeasibility):

```bash
lake exe cohere-verify path/to/rules.json path/to/incompat.json path/to/infeasible.json
```

Nonzero exit code on failure (suitable for CI gating).

## Using as a library

```lean
import Cohere              -- kernel only (pure, no IO)
import Cohere.Artifacts    -- + JSON schema types and loaders
import Cohere.Runtime      -- + Bool-backed checker and soundness bridges
```

## Integration

This kernel is used by [verified-protocol-hypergraph](https://github.com/jackyang25/verified-protocol-hypergraph), which provides a full-stack dashboard, ontology layer, and REST API on top of it. The two repos are fully decoupled -- Cohere is cloned and compiled inside the Docker build.

## Disclaimers

This is a kernel and verification tooling. Clinical content and ontology integration are out of scope. The `data/` folder contains example fixtures only.
