/- Subgoals -/

variable (p q : Prop)

example (h : p ∧ q) : q ∧ p :=
  have hp : p := h.left
  have hq : q := h.right
  show q ∧ p from And.intro hq hp

/- Suffices to show -/

example (h : p ∧ q ) : q ∧ p :=
  have hp : p := h.left
  suffices hq : q from And.intro hq hp
  show q from h.right

