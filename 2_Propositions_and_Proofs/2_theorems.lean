/- Theorems -/

variable {p : Prop}
variable {q : Prop}

/- If p implies q, then p is true -/
theorem t1 : p → q → p :=
  /- Hypothesis: p - true -/
  fun hp : p =>
    /- Hypothesis: q - true -/
    fun hq : q =>
      /- Conclusion: p - true -/
      hp

#print t1

/- Alternatively, -/

theorem t1' : p → q → p :=
  /- Hypothesis: p - true -/
  fun hp : p =>
  /- Hypothesis: q - true -/
  fun hq : q =>
  /- Conclusion: p - true -/
  show p from hp

#print t1'

/- We can move the lambda-abstracted values to the left of the ':' -/
theorem t1'' (hp : p) (hq : q) : p := hp

#print t1''

/- Applying the theorem is the same as function application -/
axiom hp : p

theorem t2 : q → p := t1 hp       -- This is how we use previously proved theorems, by application

/- Aside: Unsound axioms can prove anything -/

axiom unsound : False
-- Everything follows from false
theorem wrong : 1 = 0 :=
  False.elim unsound

/- Recall that we can also write theorem t1 with implicit types: -/

theorem t1''' {p q : Prop} (hp : p) (hq : q) : p :=
  hp

#print t1'''

/- Alternatively: -/

theorem t1'''' : ∀ {p q : Prop}, p → q → p :=
  fun {p q : Prop} (hp : p) (hq : q) => hp

/- Using variable declaration for brevity -/
variable {p q : Prop}

theorem t3 : p → q → p := fun (hp : p) (hq : q) => hp 

/- We can also make hp, the assumption that p is true, a variable -/
variable (hp : p)

theorem t4 : q → p := fun (hq : q) => hp

/- Generalizing this, we observe: -/

theorem t5 (p q : Prop) (hp : p) (hq : q) : p := hp

variable (p q r s : Prop)

#check t5 p q           -- p → q → p
#check t5 r s           -- r → s → r
#check t5 (r → s) (s → r) -- (r → s) → (s → r) → r → s

/- Revisit composition, but now with Propositions, rather than types -/

theorem t6 (h1 : q → r) (h2 : p → q) : p → r :=
  fun h3 : p =>
    show r from h1 (h2 h3)        -- If p implies q, and q implies r, then p implies r
