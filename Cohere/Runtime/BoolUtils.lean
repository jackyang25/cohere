/-
  Cohere.Runtime.BoolUtils

  Small Bool helpers for list membership/subset.
-/
import Std

namespace Cohere.Runtime

universe u

def memB {α : Type u} [DecidableEq α] (x : α) (xs : List α) : Bool :=
  xs.any (fun y => decide (y = x))

def subsetB {α : Type u} [DecidableEq α] (P F : List α) : Bool :=
  P.all (fun p => memB p F)

def strictSubsetB {α : Type u} [DecidableEq α] (P Q : List α) : Bool :=
  subsetB P Q && !(subsetB Q P)

end Cohere.Runtime
