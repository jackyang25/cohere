#!/usr/bin/env bash
set -euo pipefail

# verify.sh — Load versioned clinical data and run invariant proofs.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "=== Cohere: Build-time verification ==="
echo "Project root: $PROJECT_ROOT"

cd "$PROJECT_ROOT"

echo "Building Lean library..."
lake build

echo "Running artifact verifier..."
lake env lean VerifyScript.lean

echo "=== Verification completed ==="
