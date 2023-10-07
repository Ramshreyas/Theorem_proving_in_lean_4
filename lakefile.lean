import Lake
open Lake DSL

package «theorem_proving_in_lean_4» {
  -- add any package configuration options here
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «TheoremProvingInLean4» {
  -- add any library configuration options here
}
