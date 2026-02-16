/-
  Cohere.Invariants.InvariantChecker

  Combined checker for all three invariants:
    1. No contradictory verdicts
    2. No incompatible obligations
    3. Ought implies can
-/
import Cohere.Invariants.NoContradiction
import Cohere.Invariants.NoIncompatible
import Cohere.Invariants.OughtImpliesCan
import Cohere.Types.ActionAlgebra
import Cohere.Types.Rule

namespace Cohere.Invariants

open Cohere.Types

/-- The conjunction of all kernel safety invariants for a ruleset `R`. -/
def AllInvariants (alg : ActionAlgebra) (R : List Rule) : Prop :=
  NoContradiction R ∧
  NoIncompatibleObligations alg R ∧
  OughtImpliesCan alg R

end Cohere.Invariants
