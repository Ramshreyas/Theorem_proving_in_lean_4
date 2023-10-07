/- Law of the Excluded Middle -/
open Classical

variable (p : Prop)
#check em p

/- Double negation elimination -/

theorem dne {p : Prop} (h : ¬¬p) : p :=
  Or.elim (em p)
    (fun hp : p => hp)
    (fun hnp : ¬p => absurd hnp h)

/- using cases -/
example (h : ¬¬p) : p :=
  byCases
    (fun h1 : p => h1)
    (fun h1 : ¬p => absurd h1 h)

/- using contradiction -/
example (h : ¬¬p) : p :=
  byContradiction
    (fun h1 : ¬p =>
    show False from h h1)

/- using classical -/

example (h : ¬(p ∧ q)) : ¬p ∨ ¬q :=
  Or.elim (em p)
    (fun hp : p =>
      Or.inr
        (show ¬q from
          fun hq : q =>
          h ⟨hp, hq⟩))
    (fun hp : ¬p => Or.inl hp)