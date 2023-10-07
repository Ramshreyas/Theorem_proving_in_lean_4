/- Implicit arguments -/

universe u

def Lst (α : Type u) : Type u := List α

def Lst.cons {α : Type u} (x : α) (xs : Lst α) : Lst α := List.cons x xs
def Lst.nil {α : Type u} : Lst α := List.nil
def Lst.append {α : Type u} (xs ys : Lst α) : Lst α := List.append xs ys

#check Lst.cons 0 Lst.nil
#eval Lst.cons 0 Lst.nil

def as : Lst Nat := Lst.nil
def bs : Lst Nat := Lst.cons 5 Lst.nil

#check Lst.append as bs
#eval Lst.append as bs

def ident {α : Type u} (x : α) := x

#check ident
#check ident 10
#check ident "hello"
#check @ident

section
  variable {α : Type u}
  variable (x : α)
  def ident' := x
end

#check ident'
#check ident' 10
#check ident' "hello"

/- Implicit type casting -/

#check List.nil
#check id

#check (List.nil : List Nat)
#check (id : Nat → Nat)

#check 2
#check (2 : Nat)
#check (2 : Int)

#check @id
#check @id Nat
#check @id Bool

#check @id Nat 1
#check @id Bool true