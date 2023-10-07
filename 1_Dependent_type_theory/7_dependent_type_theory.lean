/- Types can depend on parameters -/

def l1 : List Nat := [1, 2, 3]
def l2 : List Bool := [true, false]

#check l1
#check l2
#check List             -- List.{u} (α : Type u) : Type u

/- Polymorphic functions -/

def cons (α : Type) (x : α) (xs : List α) : List α :=
  x :: xs

#check cons
#check cons Nat
#check cons Bool

#check @List.cons    -- {α : Type u_1} → α → List α → List α
#check @List.nil     -- {α : Type u_1} → List α
#check @List.length  -- {α : Type u_1} → List α → Nat
#check @List.append  -- {α : Type u_1} → List α → List α → List α

/- Dependent Cartesian Product Types -/

universe u v

def f (α : Type u) (β : α → Type v) (a : α) (b : β a) : (a : α) × β a :=
  ⟨a, b⟩

def g (α : Type u) (β : α → Type v) (a : α) (b : β a) : Σ a : α, β a :=
  Sigma.mk a b          -- same as above

def h1 (x : Nat) : Nat :=
  (f Type (fun α => α) Nat x).2

#eval h1 5              -- 5

def h2 (x : Nat) : Nat :=
  (g Type (fun α => α) Nat x).2

#eval h2 5              -- 5, f and g are equivalent