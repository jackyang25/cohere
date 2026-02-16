/-
  Cohere.Types.Rule

  A rule (hyperedge) pairs a finite collection of fact premises
  with a verdict on an action:
    Rule ≡ Pf(Fact) × Verdict(Action)
-/
import Cohere.Types.Fact
import Cohere.Types.FactSet
import Cohere.Types.Action
import Cohere.Types.Verdict

namespace Cohere.Types

/--
A hyperedge rule with finite premises.
`premises` is represented as a list in this initial scaffold.
-/
structure Rule where
  premises : FactSet
  out : Verdict Action

end Cohere.Types
