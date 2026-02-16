/-
  Cohere.Derivation.Firing

  Rule firing: a rule fires iff its premises are a subset
  of the runtime fact set (P ⊆ F).
-/

import Cohere.Types.Fact
import Cohere.Types.FactSet
import Cohere.Types.Rule

namespace Cohere.Derivation

open Cohere.Types

/--
Premise satisfaction: every premise token appears in the runtime fact list.

Note: this is a logical (`Prop`) subset relation, not a computable check.
-/
def PremisesHold (P F : FactSet) : Prop :=
  Cohere.Types.FactSet.Subset P F

/-- A rule fires iff its premises hold in the runtime fact set. -/
def Fires (r : Rule) (F : FactSet) : Prop :=
  PremisesHold r.premises F

end Cohere.Derivation
