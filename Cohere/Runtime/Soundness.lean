/-
  Cohere.Runtime.Soundness

  Minimal soundness bridge:
    Bool checker says `true` -> corresponding Prop-level kernel predicate holds.

  This module is intentionally scoped to keep the runtime verifier packageable
  without taking on a large proof burden all at once.
-/
import Std
import Cohere.Runtime.BoolUtils
import Cohere.Runtime.Verifier
import Cohere.Derivation.Firing
import Cohere.Derivation.Derive
import Cohere.Derivation.Specificity
import Cohere.Certificate.Check

namespace Cohere.Runtime.Soundness

open Cohere.Runtime
open Cohere.Types
open Cohere.Derivation
open Cohere.Certificate

universe u v
variable {Fact : Type u} [DecidableEq Fact] {Action : Type v}

/-! Small Bool/List helper lemmas (avoid depending on Std lemma names). -/

/-- If `a && b` is `true`, then both `a` and `b` are `true` (Bool-level conjunction elimination). -/
theorem bool_and_eq_true {a b : Bool} : (a && b) = true → a = true ∧ b = true := by
  cases a <;> cases b <;> simp

/-- If `a || b` is `true`, then `a` is `true` or `b` is `true` (Bool-level disjunction elimination). -/
theorem bool_or_eq_true {a b : Bool} : (a || b) = true → a = true ∨ b = true := by
  cases a <;> cases b <;> simp

/-- Convenience lemma: unpack a 4-way left-associated `&&` chain into four `= true` facts. -/
theorem and4_eq_true {a b c d : Bool} :
    (a && b && c && d) = true → a = true ∧ b = true ∧ c = true ∧ d = true := by
  intro h
  -- left-assoc: (((a && b) && c) && d)
  have h1 : (a && b && c) = true ∧ d = true := by
    exact bool_and_eq_true (a := (a && b && c)) (b := d) (by
      simpa [Bool.and_assoc] using h
    )
  have h2 : (a && b) = true ∧ c = true := by
    exact bool_and_eq_true (a := (a && b)) (b := c) (by
      simpa [Bool.and_assoc] using h1.1
    )
  have h3 : a = true ∧ b = true := bool_and_eq_true (a := a) (b := b) h2.1
  exact ⟨h3.1, h3.2, h2.2, h1.2⟩

/-- If `xs.any p = true`, then there exists a witness `x ∈ xs` with `p x = true`. -/
theorem any_eq_true_exists {α : Type _} (xs : List α) (p : α → Bool) :
    xs.any p = true → ∃ x, x ∈ xs ∧ p x = true := by
  intro h
  induction xs with
  | nil =>
      simp at h
  | cons y ys ih =>
      -- any on cons is `p y || any ys p`
      have h' : (p y || ys.any p) = true := by simpa [List.any] using h
      have : p y = true ∨ ys.any p = true := by
        -- case split on the booleans
        cases hp : p y <;> cases ht : ys.any p <;> simp [hp, ht] at h' ⊢
      cases this with
      | inl hy =>
          refine ⟨y, ?_, hy⟩
          simp
      | inr hys =>
          rcases ih hys with ⟨x, hxIn, hxP⟩
          refine ⟨x, ?_, hxP⟩
          simp [hxIn]

/-- Completeness direction for `any`: if a witness exists, then `xs.any p = true`. -/
theorem any_complete {α : Type _} (xs : List α) (p : α → Bool) :
    (∃ x, x ∈ xs ∧ p x = true) → xs.any p = true := by
  intro hex
  induction xs with
  | nil =>
      rcases hex with ⟨x, hx, _⟩
      cases hx
  | cons y ys ih =>
      rcases hex with ⟨x, hxIn, hxP⟩
      have hx : x = y ∨ x ∈ ys := by
        simpa [List.mem_cons] using hxIn
      cases hx with
      | inl hxy =>
          subst hxy
          simp [List.any, hxP]
      | inr hIn =>
          have : ys.any p = true := ih ⟨x, hIn, hxP⟩
          cases hp : p y <;> simp [List.any, hp, this]

/-- Soundness of `memB`: `memB x xs = true` implies the Prop-level membership `x ∈ xs`. -/
theorem memB_true {α : Type _} [DecidableEq α] {x : α} {xs : List α} :
    memB x xs = true → x ∈ xs := by
  intro h
  -- memB x xs = xs.any (fun y => decide (y = x))
  rcases any_eq_true_exists xs (fun y => decide (y = x)) (by simpa [memB] using h) with
    ⟨y, hyIn, hyDec⟩
  have hyEq : y = x := by
    simpa [decide_eq_true_eq] using hyDec
  simpa [hyEq] using hyIn

/-- Completeness of `memB`: Prop-level membership `x ∈ xs` implies `memB x xs = true`. -/
theorem memB_complete {α : Type _} [DecidableEq α] {x : α} {xs : List α} :
    x ∈ xs → memB x xs = true := by
  intro hx
  induction xs with
  | nil =>
      cases hx
  | cons y ys ih =>
      have hx' : x = y ∨ x ∈ ys := by
        simpa [List.mem_cons] using hx
      cases hx' with
      | inl hxy =>
          -- x = y, so membership holds immediately
          -- avoid simp rewriting `List.any = true` into membership/exists
          have hyx : y = x := by simpa using hxy.symm
          have hdec : decide (y = x) = true := by
            simp [hyx]
          -- unfold memB/any just enough to see the leading `||`
          have : memB x (y :: ys) = (decide (y = x) || ys.any (fun z => decide (z = x))) := by
            rfl
          -- finish by rewriting the left disjunct to true
          rw [this, hdec]
          simp
      | inr hmem =>
          have : memB x ys = true := ih hmem
          have hAny : ys.any (fun z => decide (z = x)) = true := by
            simpa [memB] using this
          have : memB x (y :: ys) = (decide (y = x) || ys.any (fun z => decide (z = x))) := by
            rfl
          rw [this, hAny]
          -- right disjunct is true, so the `||` is true regardless of the left
          cases hdec : decide (y = x) <;> simp [hdec]

/-- Soundness of `subsetB`: `subsetB P F = true` implies Prop-level subset `P ⊆ F`. -/
theorem subsetB_true (P F : List Fact) :
    subsetB (α := Fact) P F = true → List.Subset P F := by
  intro h
  induction P with
  | nil =>
      intro x hx; cases hx
  | cons p ps ih =>
      have h0 : (memB p F && subsetB (α := Fact) ps F) = true := by
        -- definitional unfolding of subsetB on cons
        simpa [subsetB, List.all] using h
      have hpB : memB p F = true := (bool_and_eq_true h0).1
      have hpsB : subsetB (α := Fact) ps F = true := (bool_and_eq_true h0).2
      have hp' : p ∈ F := memB_true (α := Fact) (x := p) (xs := F) hpB
      have hps' : List.Subset ps F := ih hpsB
      intro x hx
      have hx' : x = p ∨ x ∈ ps := by
        simpa [List.mem_cons] using hx
      cases hx' with
      | inl hxp => simpa [hxp] using hp'
      | inr hmem => exact hps' hmem

/-- Completeness of `subsetB`: Prop-level subset `P ⊆ F` implies `subsetB P F = true`. -/
theorem subsetB_complete (P F : List Fact) :
    List.Subset P F → subsetB (α := Fact) P F = true := by
  intro h
  induction P with
  | nil =>
      simp [subsetB]
  | cons p ps ih =>
      have hp : p ∈ F := h (by simp)
      have hpB : memB p F = true := memB_complete (α := Fact) (x := p) (xs := F) hp
      have hps : List.Subset ps F := by
        intro x hx
        exact h (by simp [hx])
      have hpsB : subsetB (α := Fact) ps F = true := ih hps
      -- unfold subsetB on cons and finish with Bool simp
      have : subsetB (α := Fact) (p :: ps) F = (memB p F && subsetB (α := Fact) ps F) := by
        rfl
      rw [this]
      -- both conjuncts are true
      simp [hpB, hpsB]

/-- Soundness of rule firing: `firesB r F = true` implies Prop-level `Fires r F`. -/
theorem firesB_sound (r : Rule Fact Action) (F : FactSet Fact) :
    firesB (Fact := Fact) (Action := Action) r F = true → Fires r F := by
  intro h
  -- firesB is subsetB over premises
  have : List.Subset r.premises F := subsetB_true (Fact := Fact) r.premises F h
  simpa [Cohere.Runtime.firesB, Cohere.Derivation.Fires, Cohere.Derivation.PremisesHold, Cohere.Types.FactSet.Subset] using this

/-- Soundness of verdict conflict checking: `conflictingB v1 v2 = true` implies `Verdict.conflicting v1 v2`. -/
theorem conflictingB_sound [DecidableEq Action] (v1 v2 : Verdict Action) :
    conflictingB (Action := Action) v1 v2 = true -> Verdict.conflicting v1 v2 := by
  intro h
  cases v1 <;> cases v2 <;> simp [conflictingB, Verdict.conflicting] at h ⊢
  all_goals
    simpa [decide_eq_true_iff] using h

/-- Soundness of "same action" checking: `sameActionB v1 v2 = true` implies actions are equal. -/
theorem sameActionB_sound [DecidableEq Action] (v1 v2 : Verdict Action) :
    sameActionB (Action := Action) v1 v2 = true -> Verdict.action v1 = Verdict.action v2 := by
  intro h
  simpa [sameActionB, decide_eq_true_iff] using h

/-- Soundness of strict subset checking: `strictSubsetB P Q = true` implies `P ⊂ Q` as Prop subsets. -/
theorem strictSubsetB_sound (P Q : List Fact) :
    strictSubsetB (α := Fact) P Q = true → (List.Subset P Q ∧ ¬ List.Subset Q P) := by
  intro h
  -- strictSubsetB = subsetB P Q && !(subsetB Q P)
  have h' : subsetB (α := Fact) P Q = true ∧ subsetB (α := Fact) Q P = false := by
    cases hPQ : subsetB (α := Fact) P Q <;> cases hQP : subsetB (α := Fact) Q P <;> simp [strictSubsetB, hPQ, hQP] at h <;> simp [hPQ, hQP]
  have hPQ' : List.Subset P Q := subsetB_true (Fact := Fact) P Q h'.1
  have hnotQP' : ¬ List.Subset Q P := by
    intro hQP'
    have : subsetB (α := Fact) Q P = true := subsetB_complete (Fact := Fact) Q P hQP'
    cases h'.2 ▸ this
  exact ⟨hPQ', hnotQP'⟩

/-- Soundness of shadowing: if the Bool shadowing check says `true`, then the Prop-level `Shadowed` holds. -/
theorem shadowedB_sound [DecidableEq Action] (R : List (Rule Fact Action)) (F : FactSet Fact) (r1 : Rule Fact Action) :
    r1 ∈ R →
    shadowedB (Fact := Fact) (Action := Action) R F r1 = true →
      Shadowed R F r1 := by
  intro hr1 h
  -- unfold shadowedB; fired case must hold
  cases hfb : firesB (Fact := Fact) (Action := Action) r1 F with
  | false =>
      -- shadowedB is false if r1 doesn't fire
      simp [shadowedB, hfb] at h
  | true =>
    have hfiresB : firesB (Fact := Fact) (Action := Action) r1 F = true := by
      simpa using hfb
    have hfires : Fires r1 F := firesB_sound (r := r1) (F := F) hfiresB
    -- turn `any = true` into a witness rule
    have hex :
        ∃ r2, r2 ∈ R ∧
          ((firesB (Fact := Fact) (Action := Action) r2 F = true ∧
            sameActionB (Action := Action) r1.out r2.out = true) ∧
            strictSubsetB (α := Fact) r1.premises r2.premises = true) ∧
            conflictingB (Action := Action) r1.out r2.out = true := by
      simpa [shadowedB, hfiresB] using h
    rcases hex with ⟨r2, hr2, hrest⟩
    have hf2B : firesB (Fact := Fact) (Action := Action) r2 F = true := hrest.1.1.1
    have hsaB : sameActionB (Action := Action) r1.out r2.out = true := hrest.1.1.2
    have hssB : strictSubsetB (α := Fact) r1.premises r2.premises = true := hrest.1.2
    have hcB : conflictingB (Action := Action) r1.out r2.out = true := hrest.2

    have hf2 : Fires r2 F := firesB_sound (r := r2) (F := F) hf2B
    have hsa : SameAction r1 r2 := sameActionB_sound (v1 := r1.out) (v2 := r2.out) hsaB
    have hms : MoreSpecific r1 r2 := by
      have hss : List.Subset r1.premises r2.premises ∧ ¬ List.Subset r2.premises r1.premises :=
        strictSubsetB_sound (Fact := Fact) r1.premises r2.premises hssB
      simpa [MoreSpecific, PremisesHold, Cohere.Types.FactSet.Subset] using hss
    have hc : Verdict.conflicting r1.out r2.out := conflictingB_sound (v1 := r1.out) (v2 := r2.out) hcB
    exact ⟨hr1, hfires, ⟨r2, hr2, hf2, hsa, hms, hc⟩⟩

/-!
End-to-end bridges:

- `derived` (list) ↔ `Derive` (Prop predicate)
- `acceptB` (Bool) → `Accept` (Prop predicate)
-/

/-- Helper: if `P ⊄ F` as Prop, then the executable `subsetB P F` must be `false`. -/
theorem subsetB_false_of_notSubset (P F : List Fact) :
    (¬ List.Subset P F) → subsetB (α := Fact) P F = false := by
  intro hnot
  by_cases hb : subsetB (α := Fact) P F = true
  · have : List.Subset P F := subsetB_true (Fact := Fact) P F hb
    exact False.elim (hnot this)
  · cases h : subsetB (α := Fact) P F <;> simp [h] at hb ⊢

/-- Completeness of firing: Prop-level `Fires r F` implies executable `firesB r F = true`. -/
theorem firesB_complete [DecidableEq Action] (r : Rule Fact Action) (F : FactSet Fact) :
    Fires r F → firesB (Fact := Fact) (Action := Action) r F = true := by
  intro hf
  -- Fires is subset under Prop
  have hsub : List.Subset r.premises F := by
    simpa [Fires, PremisesHold, Cohere.Types.FactSet.Subset] using hf
  -- subsetB_complete gives Bool=true
  simpa [Cohere.Runtime.firesB] using (subsetB_complete (Fact := Fact) r.premises F hsub)

/-- Completeness of same-action: Prop equality of actions implies `sameActionB = true`. -/
theorem sameActionB_complete [DecidableEq Action] (v1 v2 : Verdict Action) :
    Verdict.action v1 = Verdict.action v2 → sameActionB (Action := Action) v1 v2 = true := by
  intro h
  simp [Cohere.Runtime.sameActionB, h]

/-- Completeness of conflict checking: `Verdict.conflicting v1 v2` implies `conflictingB v1 v2 = true`. -/
theorem conflictingB_complete [DecidableEq Action] (v1 v2 : Verdict Action) :
    Verdict.conflicting v1 v2 → conflictingB (Action := Action) v1 v2 = true := by
  intro h
  cases v1 <;> cases v2 <;> simp [Verdict.conflicting, Cohere.Runtime.conflictingB] at h ⊢
  all_goals
    -- remaining goals are equality decisions
    simp [h]

/-- Completeness of strict subset: if `P ⊂ Q` as Prop subsets, then `strictSubsetB P Q = true`. -/
theorem strictSubsetB_complete (P Q : List Fact) :
    (List.Subset P Q ∧ ¬ List.Subset Q P) → strictSubsetB (α := Fact) P Q = true := by
  rintro ⟨hPQ, hnotQP⟩
  have h1 : subsetB (α := Fact) P Q = true := subsetB_complete (Fact := Fact) P Q hPQ
  have h2 : subsetB (α := Fact) Q P = false := subsetB_false_of_notSubset (Fact := Fact) Q P hnotQP
  cases hb : subsetB (α := Fact) Q P <;> simp [strictSubsetB, h1, hb] at h2 ⊢

/-- Completeness of shadowing: if Prop-level `Shadowed` holds, then `shadowedB = true`. -/
theorem shadowedB_complete [DecidableEq Action] (R : List (Rule Fact Action)) (F : FactSet Fact) (r1 : Rule Fact Action) :
    Shadowed R F r1 → shadowedB (Fact := Fact) (Action := Action) R F r1 = true := by
  intro hs
  rcases hs with ⟨hr1, hf1, ⟨r2, hr2, hf2, hsa, hms, hc⟩⟩
  have hfires1 : firesB (Fact := Fact) (Action := Action) r1 F = true := firesB_complete (Fact := Fact) (Action := Action) r1 F hf1
  have hfires2 : firesB (Fact := Fact) (Action := Action) r2 F = true := firesB_complete (Fact := Fact) (Action := Action) r2 F hf2
  have hsaB : sameActionB (Action := Action) r1.out r2.out = true := sameActionB_complete (Action := Action) r1.out r2.out hsa
  have hmsB : strictSubsetB (α := Fact) r1.premises r2.premises = true := by
    -- MoreSpecific is exactly (subset ∧ ¬subset)
    have : (List.Subset r1.premises r2.premises ∧ ¬ List.Subset r2.premises r1.premises) := by
      simpa [MoreSpecific, PremisesHold, Cohere.Types.FactSet.Subset] using hms
    exact strictSubsetB_complete (Fact := Fact) r1.premises r2.premises this
  have hcB : conflictingB (Action := Action) r1.out r2.out = true := conflictingB_complete (Action := Action) r1.out r2.out hc

  -- show the `any` predicate holds for r2, hence any=true
  let p : Rule Fact Action → Bool := fun r =>
    firesB (Fact := Fact) (Action := Action) r F &&
    sameActionB (Action := Action) r1.out r.out &&
    strictSubsetB (α := Fact) r1.premises r.premises &&
    conflictingB (Action := Action) r1.out r.out
  have hp : p r2 = true := by
    simp [p, hfires2, hsaB, hmsB, hcB]
  have : (R.any p) = true :=
    any_complete R p ⟨r2, hr2, hp⟩

  simp [Cohere.Runtime.shadowedB, hfires1, p, this]

/-- If a rule is *not* shadowed (Prop), then the executable `shadowedB` cannot return `true`. -/
theorem shadowedB_false_of_notShadowed [DecidableEq Action]
    (R : List (Rule Fact Action)) (F : FactSet Fact) (r : Rule Fact Action) :
    r ∈ R → (¬ Shadowed R F r) → shadowedB (Fact := Fact) (Action := Action) R F r = false := by
  intro hr hn
  by_cases hb : shadowedB (Fact := Fact) (Action := Action) R F r = true
  · have hs : Shadowed R F r := shadowedB_sound (Fact := Fact) (Action := Action) R F r hr hb
    exact False.elim (hn hs)
  · cases h : shadowedB (Fact := Fact) (Action := Action) R F r <;> simp [h] at hb ⊢

/-- If `shadowedB` returns `false`, then `Shadowed` cannot hold (Prop). -/
theorem notShadowed_of_shadowedB_false [DecidableEq Action]
    (R : List (Rule Fact Action)) (F : FactSet Fact) (r : Rule Fact Action) :
    shadowedB (Fact := Fact) (Action := Action) R F r = false → ¬ Shadowed R F r := by
  intro hb hs
  have : shadowedB (Fact := Fact) (Action := Action) R F r = true :=
    shadowedB_complete (Fact := Fact) (Action := Action) R F r hs
  cases hb ▸ this

/-- Soundness of derivation (membership form): list membership in `derived` implies Prop-level `Derive`. -/
theorem derived_mem_sound [DecidableEq Action]
    (R : List (Rule Fact Action)) (F : FactSet Fact) (v : Verdict Action) :
    v ∈ derived (Fact := Fact) (Action := Action) R F → Derive R F v := by
  intro hv
  have hv' : v ∈ (R.filter (fun r => firesB (Fact := Fact) (Action := Action) r F && !(shadowedB (Fact := Fact) (Action := Action) R F r))).map (fun r => r.out) := by
    simpa [Cohere.Runtime.derived] using hv
  rcases List.mem_map.1 hv' with ⟨r, hrIn, rfl⟩
  have hr : r ∈ R ∧ (firesB (Fact := Fact) (Action := Action) r F && !(shadowedB (Fact := Fact) (Action := Action) R F r)) = true := by
    simpa [List.mem_filter] using hrIn
  have hff : firesB (Fact := Fact) (Action := Action) r F = true := (bool_and_eq_true hr.2).1
  have hsb : shadowedB (Fact := Fact) (Action := Action) R F r = false := by
    -- !(shadowedB ..) = true -> shadowedB .. = false
    have : (!(shadowedB (Fact := Fact) (Action := Action) R F r)) = true := (bool_and_eq_true hr.2).2
    cases hb : shadowedB (Fact := Fact) (Action := Action) R F r <;> simp [hb] at this <;> simp [hb]
  have hf : Fires r F := firesB_sound (Fact := Fact) (Action := Action) r F hff
  have hnsh : ¬ Shadowed R F r := notShadowed_of_shadowedB_false (Fact := Fact) (Action := Action) R F r hsb
  exact ⟨r, hr.1, hf, hnsh, rfl⟩

/-- Completeness of derivation (membership form): Prop-level `Derive` implies list membership in `derived`. -/
theorem derived_mem_complete [DecidableEq Action]
    (R : List (Rule Fact Action)) (F : FactSet Fact) (v : Verdict Action) :
    Derive R F v → v ∈ derived (Fact := Fact) (Action := Action) R F := by
  intro hD
  rcases hD with ⟨r, hrR, hf, hnsh, hout⟩
  have hfB : firesB (Fact := Fact) (Action := Action) r F = true := firesB_complete (Fact := Fact) (Action := Action) r F hf
  have hsB : shadowedB (Fact := Fact) (Action := Action) R F r = false :=
    shadowedB_false_of_notShadowed (Fact := Fact) (Action := Action) R F r hrR hnsh
  have hpred : (firesB (Fact := Fact) (Action := Action) r F && !(shadowedB (Fact := Fact) (Action := Action) R F r)) = true := by
    cases hb : shadowedB (Fact := Fact) (Action := Action) R F r <;> simp [hb, hfB] at hsB ⊢
  have hrInFilter : r ∈ R.filter (fun r => firesB (Fact := Fact) (Action := Action) r F && !(shadowedB (Fact := Fact) (Action := Action) R F r)) := by
    simp [List.mem_filter, hrR, hpred]
  have hv0 : v ∈ (R.filter (fun r => firesB (Fact := Fact) (Action := Action) r F && !(shadowedB (Fact := Fact) (Action := Action) R F r))).map (fun r => r.out) := by
    -- map membership via witness r
    refine List.mem_map.2 ?_
    exact ⟨r, hrInFilter, by simp [hout]⟩
  simpa [Cohere.Runtime.derived] using hv0

/-- Soundness of certificate acceptance: `acceptB = true` implies Prop-level `Accept`. -/
theorem acceptB_sound [DecidableEq Action]
    (R : List (Rule Fact Action)) (F : FactSet Fact) (aStar : Action) :
    acceptB (Fact := Fact) (Action := Action) R F aStar = true → Accept R F aStar := by
  intro h
  -- unfold acceptB
  simp [Cohere.Runtime.acceptB] at h
  let Dlist := derived (Fact := Fact) (Action := Action) R F
  have hcases :
      memB (.Obligated aStar) Dlist = true ∨
        (memB (.Allowed aStar) Dlist = true ∧ memB (.Rejected aStar) Dlist = false) := by
    -- `simp` already produced this shape, just rewrite the local name `Dlist`
    simpa [Dlist] using h
  -- convert to Prop Accept
  -- Accept uses D := Derive R F
  cases hcases with
  | inl hob =>
      have : (.Obligated aStar) ∈ Dlist := memB_true (α := Verdict Action) (x := .Obligated aStar) (xs := Dlist) hob
      have hD : Derive R F (.Obligated aStar) := by
        simpa using derived_mem_sound (Fact := Fact) (Action := Action) R F (.Obligated aStar) (by simpa [Dlist] using this)
      -- Accept is left disjunct
      simpa [Cohere.Certificate.Accept, Cohere.Certificate.HasRejection] using Or.inl hD
  | inr hall =>
      have hAllowedMem : (.Allowed aStar) ∈ Dlist :=
        memB_true (α := Verdict Action) (x := .Allowed aStar) (xs := Dlist) hall.1
      have hAllowed : Derive R F (.Allowed aStar) := by
        simpa using derived_mem_sound (Fact := Fact) (Action := Action) R F (.Allowed aStar) (by simpa [Dlist] using hAllowedMem)
      have hNoRej : ¬ Derive R F (.Rejected aStar) := by
        intro hRej
        have hRejMem : (.Rejected aStar) ∈ Dlist := by
          have : (.Rejected aStar) ∈ derived (Fact := Fact) (Action := Action) R F :=
            derived_mem_complete (Fact := Fact) (Action := Action) R F (.Rejected aStar) hRej
          simpa [Dlist] using this
        have : memB (.Rejected aStar) Dlist = true :=
          memB_complete (α := Verdict Action) (x := .Rejected aStar) (xs := Dlist) hRejMem
        -- contradiction with memB = false
        cases hall.2 ▸ this
      -- Accept is right disjunct
      -- unfold Accept/HasRejection
      simp [Cohere.Certificate.Accept, Cohere.Certificate.HasRejection, hAllowed, hNoRej]

end Cohere.Runtime.Soundness
