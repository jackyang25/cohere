/-
  Cohere.Certificate.CertificateCheck

  Certificate checking for proposed actions.
  Given a proposed action a*:
    Accept if Obligated(a*) ∈ Derive(R,F),
             or Allowed(a*) ∈ Derive(R,F) with no rejection.
    Reject otherwise.
-/
import Cohere.Derivation.Derive
import Cohere.Types.FactSet
import Cohere.Types.Rule
import Cohere.Types.Verdict

namespace Cohere.Certificate

open Cohere.Types
open Cohere.Derivation

universe u v
variable {Fact : Type u} {Action : Type v}

/-- Derived set `D` contains a rejection for action `a`. -/
def HasRejection (D : Verdict Action -> Prop) (a : Action) : Prop :=
  D (.Rejected a)

/--
Accept predicate for certificates.

This is the trusted kernel decision: it depends only on `Derive R F`.
-/
def Accept (R : List (Rule Fact Action)) (F : FactSet Fact) (aStar : Action) : Prop :=
  let D := Derive R F
  D (.Obligated aStar) ∨ (D (.Allowed aStar) ∧ ¬ HasRejection D aStar)

/-- Reject is the logical negation of accept. -/
def Reject (R : List (Rule Fact Action)) (F : FactSet Fact) (aStar : Action) : Prop :=
  ¬ Accept R F aStar

end Cohere.Certificate
