-- Cohere: A verified clinical hypergraph decision support kernel.
-- This module serves as the library root and imports all submodules.

-- Layer 1: Types
import Cohere.Types.FactSet
import Cohere.Types.Verdict
import Cohere.Types.Rule
import Cohere.Types.ActionAlgebra

-- Layer 2: Derivation
import Cohere.Derivation.Firing
import Cohere.Derivation.Specificity
import Cohere.Derivation.Derive

-- Layer 3: Invariants
import Cohere.Invariants.NoContradiction
import Cohere.Invariants.NoIncompatible
import Cohere.Invariants.OughtImpliesCan
import Cohere.Invariants.InvariantChecker

-- Layer 4: Authoring Contract
import Cohere.Authoring.EntryPaths
import Cohere.Authoring.ConflictDetection
import Cohere.Authoring.OptionGeneration

-- Data loading
import Cohere.Artifacts.RulesetLoader
import Cohere.Artifacts.ActionAlgebraLoader
import Cohere.Artifacts.Schema

-- Certificate checking
import Cohere.Certificate.CertificateCheck
