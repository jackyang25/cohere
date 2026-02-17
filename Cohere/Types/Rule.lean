/-
  Cohere.Types.Rule

  A rule (hyperedge) pairs a finite collection of fact premises
  with a verdict on an action:
    Rule ≡ Pf(Fact) × Verdict(Action)
-/
import Cohere.Types.FactSet
import Cohere.Types.Verdict

namespace Cohere.Types

/-
  Parametric kernel: `Rule` is generic over `Fact` and `Action` types.
-/
universe u v

/--
A hyperedge rule with finite premises.
`premises` is represented as a list in this initial scaffold.
-/
structure Rule (Fact : Type u) (Action : Type v) where
  premises : FactSet Fact
  out : Verdict Action

end Cohere.Types
