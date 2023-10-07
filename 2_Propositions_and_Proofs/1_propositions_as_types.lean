/- Propositions as Types -/

#check And            -- And : Prop → Prop → Prop
#check Or             -- Or : Prop → Prop → Prop
#check Not            -- Not : Prop → Prop

variable (p q r : Prop)

#check p ∧ q                          -- p ∧ q : Prop
#check p ∨ q                          -- p ∨ q : Prop
#check (p → q) → (q → p)              -- p → q : Prop

axiom and_comm (p q : Prop) : p ∧ q → q ∧ p
#check and_comm p q                   -- and_comm : ∀ (p q : Prop), p ∧ q → q ∧ p