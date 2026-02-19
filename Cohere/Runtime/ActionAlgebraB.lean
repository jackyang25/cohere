/-
  Cohere.Runtime.ActionAlgebraB

  Bool-backed action algebra for executable checking.

  The kernel uses `Prop`-valued relations (`Cohere.Types.ActionAlgebra`); for running
  executable checks we use this `Bool` version.
-/

import Cohere.Types.FactSet

namespace Cohere.Runtime

universe u v

/-- Bool-backed action algebra interface for runtime checking. -/
structure ActionAlgebraB (Fact : Type u) (Action : Type v) where
  Incompatible : Action -> Action -> Bool
  Infeasible : Action -> Cohere.Types.FactSet Fact -> Bool

end Cohere.Runtime
