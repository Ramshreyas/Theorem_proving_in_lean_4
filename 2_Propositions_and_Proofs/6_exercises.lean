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
  ⟨λ h : (p ∨ q) ∨ r => h.elim                        -- Forward pass
    (λ hpq => hpq.elim Or.inl (Or.inr ∘ Or.inl))
    (Or.inr ∘ Or.inr),
   λ h : p ∨ (q ∨ r) => h.elim                        -- Backward pass
    (Or.inl ∘ Or.inl)
    (λ hqr => hqr.elim (Or.inl ∘ Or.inr) Or.inr)⟩

-- distributivity

example : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  Iff.intro
    (fun h : p ∧ (q ∨ r) =>
      have hp : p := h.left
      Or.elim h.right
        (fun hq : q => show (p ∧ q) ∨ (p ∧ r) from Or.inl ⟨hp, hq⟩)
        (fun hr : r => show (p ∧ q) ∨ (p ∧ r) from Or.inr ⟨hp, hr⟩))
    (fun h : (p ∧ q) ∨ (p ∧ r) =>
      Or.elim h
        (fun hpq : p ∧ q =>
          have hp : p := hpq.left
          have hq : q := hpq.right
          show p ∧ (q ∨ r) from ⟨hp, Or.inl hq⟩)
        (fun hpr : p ∧ r =>
          have hp : p := hpr.left
          have hr : r := hpr.right
          show p ∧ (q ∨ r) from ⟨hp, Or.inr hr⟩))

example : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) :=
  Iff.intro
    (fun h : p ∨ (q ∧ r) =>
      Or.elim h
        (fun hp : p =>
          show (p ∨ q) ∧ (p ∨ r) from ⟨Or.inl hp, Or.inl hp⟩)
        (fun hqr : q ∧ r => 
          show (p ∨ q) ∧ (p ∨ r) from ⟨Or.inr hqr.left, Or.inr hqr.right⟩))
    (fun h : (p ∨ q) ∧ (p ∨ r) =>
      have hpq := h.left
      have hpr := h.right
      Or.elim hpq
        (fun hp : p => show p ∨ (q ∧ r) from Or.inl hp)
        (fun hq : q => 
          Or.elim hpr
            (fun hp : p => show p ∨ (q ∧ r) from Or.inl hp)
            (fun hr : r => show p ∨ (q ∧ r) from Or.inr ⟨hq, hr⟩)))
          


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