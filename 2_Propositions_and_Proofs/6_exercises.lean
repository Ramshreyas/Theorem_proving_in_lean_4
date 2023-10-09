variable (p q r : Prop)

open Classical

-- commutativity of ∧ and ∨
theorem comm_and (p q : Prop): p ∧ q ↔ q ∧ p :=
  Iff.intro
    (fun h : p ∧ q =>
      show q ∧ p from And.intro (And.right h) (And.left h))
    (fun h : q ∧ p =>
      show p ∧ q from And.intro (And.right h) (And.left h))

theorem comm_and_left : p ∧ q → q ∧ p :=
  fun h : p ∧ q =>
    show q ∧ p from And.intro (And.right h) (And.left h)

theorem comm_and_right : q ∧ p → p ∧ q :=
  fun h : q ∧ p =>
    show p ∧ q from And.intro (And.right h) (And.left h)

theorem comm_or : p ∨ q ↔ q ∨ p :=
  Iff.intro
    (fun h : p ∨ q =>
      show q ∨ p from Or.elim h Or.inr Or.inl)
    (fun h : q ∨ p =>
      show p ∨q from Or.elim h Or.inr Or.inl)

theorem comm_or_left : p ∨ q → q ∨ p :=
  fun h : p ∨ q =>
    show q ∨ p from Or.elim h Or.inr Or.inl

theorem comm_or_right : q ∨ p → p ∨ q:=
  fun h : q ∨ p =>
    show p ∨ q from Or.elim h Or.inr Or.inl

-- associativity of ∧ and ∨
theorem assoc_and : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  Iff.intro
    (fun hpqr : (p ∧ q) ∧ r =>
      show p ∧ q ∧ r from ⟨hpqr.left.left, hpqr.left.right, hpqr.right⟩)
    (fun hpqr : p ∧ (q ∧ r) =>
      show (p ∧ q) ∧ r from ⟨(⟨hpqr.left, hpqr.right.left⟩), hpqr.right.right⟩)

theorem assoc_or : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) :=
  Iff.intro
    (fun h : (p ∨ q) ∨ r =>
      h.elim 
      (fun hpq: p ∨ q =>
        ) 
      ())      -- Forward Sweep
    ()      -- Backward sweep


-- distributivity


example : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) := sorry
example : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) := sorry

-- other properties
example : (p → (q → r)) ↔ (p ∧ q → r) := sorry
example : ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) := sorry
example : ¬(p ∨ q) ↔ ¬p ∧ ¬q := sorry
example : ¬p ∨ ¬q → ¬(p ∧ q) := sorry
example : ¬(p ∧ ¬p) := sorry
example : p ∧ ¬q → ¬(p → q) := sorry
example : ¬p → (p → q) := sorry
example : (¬p ∨ q) → (p → q) := sorry
example : p ∨ False ↔ p := sorry
example : p ∧ False ↔ False := sorry
example : (p → q) → (¬q → ¬p) := sorry