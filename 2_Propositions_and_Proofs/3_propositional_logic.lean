/- Logical Operators -/

variable (p q : Prop)

#check p → q → p ∧ q
#check ¬ p → p ↔ false
#check p ∨ q → q ∨ p

/- ------------------------------------------------------------------------- -/
/- Conjunction -/

example (hp : p) (hq : q) : p ∧ q := And.intro hp hq

#check fun (hp : p) (hq : q) => And.intro hp hq

/- Left and Right elimination rules -/

example (h : p ∧ q) : p := And.left h           
example (h : p ∧ q) : q := And.right h        -- These are tactics proof applied on h

/- Prove p ∧ q → q ∧ p  -/

example (h : p ∧ q) : q ∧ p :=
  And.intro (And.right h) (And.left h)

/- Anonymous Constructor for structures -/
variable (hp : p) (hq : q)

#check (⟨hp, hq⟩ : p ∧ q)

/- Accessing functions of types from instances -/

variable (xs : List Nat)

#check List.length xs
#check xs.length          -- same as above

example (h : p ∧ q) : q ∧ p :=
  ⟨h.right, h.left⟩               -- same proof as line 23

example (h : p ∧ q) : q ∧ p ∧ q :=
  ⟨h.right, ⟨h.left, h.right⟩⟩  

example (h : p ∧ q) : q ∧ p ∧ q :=
  ⟨h.right, h.left, h.right⟩         -- Same as previous, but flattened

/- ------------------------------------------------------------------------- -/
/- Disjunction -/

/- Or introduction-/
example (hp : p) : p ∨ q := Or.intro_left q hp
example (hq : q) : p ∨ q := Or.intro_right p hq

/- Or elimination -/

example (h : p ∨ q) : q ∨ p :=
  Or.elim h
    (fun hp : p =>
      show q ∨ p from Or.intro_right q hp)
    (fun hq : q =>
      show q ∨ p from Or.intro_left p hq)     -- Proof by cases

/- Shorthand for Or.intro_right and left -/
example (h : p ∨ q) : q ∨ p :=
  Or.elim h
    (fun hp : p => Or.inr hp)
    (fun hq : q => Or.inl hq)

/- Accessing elim from h -/
example (h : p ∨ q) : q ∨ p :=
  h.elim (fun hp => Or.inr hp) (fun hq => Or.inl hq)

/- ------------------------------------------------------------------------- -/
/- Negation and Falsity -/

example (hpq : p → q) (hnq : ¬ q) : ¬ p :=
  fun hp : p =>
  show False from hnq (hpq hp)      -- Proof by contradiction

example (hp : p) (hnp : ¬p) : q := False.elim (hnp hp)

example (hp : p) (hnp : ¬p) : q := absurd hp hnp      -- Same as above

variable (r : Prop)

example (hnp : ¬p) (hq : q) (hqp : q → p) : r := absurd (hqp hq) hnp

/- ------------------------------------------------------------------------- -/
/- Logical Equivalence -/

theorem and_swap : p ∧ q ↔ q ∧ p :=
  Iff.intro
    (fun h : p ∧ q =>
      show q ∧ p from And.intro (And.right h) (And.left h))
    (fun h : q ∧ p =>
      show p ∧ q from And.intro (And.right h) (And.left h))

theorem and_swap' : p ∧ q ↔ q ∧ p :=
  ⟨fun h => ⟨h.right, h.left⟩, fun h => ⟨h.right, h.left⟩⟩

example (h : p ∧ q) : q ∧ p := (and_swap p q).mp h