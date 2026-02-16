/-
  Cohere.Authoring.OptionGeneration

  Given a conflict between rules A and B, generate three base options:
    (a) P_A ∪ P_B → v₁(a)   (Rule A's verdict applies)
    (b) P_A ∪ P_B → v₂(a)   (Rule B's verdict applies)
    (c) P_A ∪ P_B → Obligated(Escalate.Specialist)

  We represent premise unions as list concatenation.
-/
import Cohere.Authoring.ConflictDetection
import Cohere.Types.Action
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Authoring

open Cohere.Types

/-- Premise union for the overlap case (`P₁ ∪ P₂`), using lists. -/
def OverlapPremises (r₁ r₂ : Rule) : FactSet :=
  Cohere.Types.FactSet.union r₁.premises r₂.premises

/-- Option (a): Rule A's verdict applies to the overlap. -/
def OptionA (rA rB : Rule) : Rule :=
  { premises := OverlapPremises rA rB, out := rA.out }

/-- Option (b): Rule B's verdict applies to the overlap. -/
def OptionB (rA rB : Rule) : Rule :=
  { premises := OverlapPremises rA rB, out := rB.out }

/--
Option (c): escalate for the overlap.

We parameterize by the escalation action token, so the kernel does not hardcode
any action ontology details.
-/
def OptionC (escalateSpecialist : Action) (rA rB : Rule) : Rule :=
  { premises := OverlapPremises rA rB, out := .Obligated escalateSpecialist }

/-- The three base options as a list. -/
def BaseOptions (escalateSpecialist : Action) (rA rB : Rule) : List Rule :=
  [OptionA rA rB, OptionB rA rB, OptionC escalateSpecialist rA rB]

end Cohere.Authoring
