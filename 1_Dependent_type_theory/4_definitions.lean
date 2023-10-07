/- Function definition -/

def double_1 (x : Nat) : Nat :=
  x + x                                                 -- standard infix notation

#eval double_1 3                                        -- 6

def double_2 : Nat → Nat :=
  fun x => x + x                                        -- definition using lambda

#eval double_2 3                                        -- 6

/- type inference in definition -/

def double_3 (x : Nat) := x + x                         -- type is inferred

/- Constants -/

def pi := 3.14159265358979323846264338327950288         -- definition without type

/- Mulitple parameters -/

def add (x y : Nat) := x + y                            -- two parameters

#eval add 2 3                                           -- 5

/- Seperate type declarations -/

def add' (x : Nat) (y : Nat) := x + y                    -- two parameters with type

#eval add' 2 3                                          -- 5

/- Functions as input -/

def doTwice (f : Nat → Nat) (x : Nat) := f (f x)         -- function as input

#eval doTwice double_1 2                                -- 8

/- Types as input -/

def compose (α β γ : Type) (g : β → γ) (f : α → β) (x : α): γ := g (f x)

def square (x : Nat) := x * x

#eval compose Nat Nat Nat square double_1 2             -- 16

/- Local Definitions -/

#check let y := 2 + 2; y * y                           -- local definition
#eval let y := 2 + 2; y * y                            -- 16

def twice_double (x : Nat) : Nat :=
  let y := x + x; y * y

#eval twice_double 2                                    -- 16

/- chaining let statements -/

#check let y := 2 + 2; let z := y + y; z * z            -- Nat
#eval let y := 2 + 2; let z := y + y; z * z             -- 64

/- Omitting ';' -/

def t (x : Nat) : Nat :=
  let y := x + x
  y * y