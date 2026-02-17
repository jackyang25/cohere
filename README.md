## Cohere

Verified clinical hypergraph decision support kernel (Lean 4).

This repo contains:
- **A reusable kernel** (pure, data-agnostic logic) for deriving verdicts from rules and checking safety invariants.
- **Optional artifact + runtime layers** to load versioned JSON artifacts and run an executable verifier.
- **Example data** under `data/` used as fixtures/demos (how you populate artifacts in production is up to you).

## What the kernel does (high level)

Given:
- a ruleset `R : List (Rule Fact Action)`
- a fact set `F : FactSet Fact`

the kernel defines:
- **Derivation**: `Derive R F : Verdict Action → Prop` (which verdicts are derivable)
- **Certificate decision**: `Accept R F a* : Prop` (whether a proposed action is accepted)
- **Safety invariants** (Prop-level):
  - no contradictory verdicts survive derivation
  - no incompatible obligations
  - ought implies can (obligations must be feasible)

The kernel is **parametric** in `Fact` and `Action`. There is no clinical ontology baked in.

## Repository layout

- **Kernel (pure)**: `Cohere/*` imported by `Cohere.lean`
  - `Cohere/Types/*`: `FactSet`, `Rule`, `Verdict`, `ActionAlgebra`
  - `Cohere/Derivation/*`: firing, specificity/shadowing, `Derive`
  - `Cohere/Invariants/*`: Prop-level invariant definitions (+ `AllInvariants`)
  - `Cohere/Certificate/*`: trusted accept/reject predicate
  - `Cohere/Authoring/*`: authoring-time conflict predicates and option generation

- **Artifacts (optional IO layer)**: `Cohere/Artifacts.lean`
  - `Cohere/Artifacts/Schema.lean`: JSON schema types
  - `Cohere/Artifacts/RulesetLoader.lean`: parse ruleset JSON
  - `Cohere/Artifacts/ActionAlgebraLoader.lean`: build Prop-level `ActionAlgebra` from JSON

- **Runtime (optional executable layer)**: `Cohere/Runtime.lean`
  - `Cohere/Runtime/Verifier.lean`: Bool-backed mirror of derivation + `acceptB`
  - `Cohere/Runtime/InvariantChecks.lean`: Bool-backed invariant checks
  - `Cohere/Runtime/Soundness.lean`: partial bridges (Bool `true` ⇒ Prop holds)
  - `Cohere/Runtime/ActionAlgebraLoader.lean`: build/load Bool action algebra from JSON

- **Executable verifier**:
  - `VerifyMain.lean`: `lake exe cohere-verify ...`
  - `VerifyScript.lean`: `#eval` runner (useful in environments where native executables are annoying)

- **Example artifacts**: `data/`

## Build

```bash
lake build
```

## Run the verifier on the bundled example data

```bash
lake exe cohere-verify
```

This uses the default files under `data/`.

## Run the verifier on your own artifacts

Provide three paths:
1) ruleset JSON
2) incompatibility JSON
3) feasibility JSON

```bash
lake exe cohere-verify path/to/rules.json path/to/incompat.json path/to/feasible.json
```

If verification fails, the executable returns a nonzero exit code (suitable for CI gating).

## Using this as a library

Lean imports are intentionally split so downstream users can choose what they need:

- **Kernel only**:

```lean
import Cohere
```

- **JSON artifact schemas + loaders**:

```lean
import Cohere.Artifacts
```

- **Executable checker/runtime bridges**:

```lean
import Cohere.Runtime
```

## Production usage (typical pattern)

Non-exhaustive recommended workflow:
- your authoring/ETL pipeline produces versioned JSON artifacts
- CI runs `lake exe cohere-verify ...` on every artifact update
- only verified artifacts are published/deployed (e.g., uploaded to a registry/bucket)

Optionally, a service that loads artifacts can also run verification at startup/on refresh and refuse to serve invalid artifacts.

## Notes / disclaimers

- This repository is a **kernel + verification tooling**. Clinical content and ontology integration are intentionally out of scope here.
- The `data/` folder is included as **example fixtures**; you can replace it entirely in your own deployment.
