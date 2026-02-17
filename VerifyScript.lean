/-
  VerifyScript

  Runs artifact verification inside the Lean evaluator (via `#eval`).

  This avoids relying on a native `lake exe` binary, which can trip macOS dyld
  issues in some environments.
-/
import VerifyMain

def run : IO Unit := do
  let code ← main []
  if code = 0 then
    pure ()
  else
    throw <| IO.userError "artifact verification failed"

#eval! run
