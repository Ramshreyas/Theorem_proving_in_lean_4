/- SIMPLE TYPE THEORY -/

/- Define some constants. -/

def m : Nat := 1              -- m is a natural number
def n : Nat := 0
def b1 : Bool := true         -- b1 is a Boolean
def b2 : Bool := false

/- Check their types. -/

#check m                      -- output: Nat
#check n
#check n + 0                  -- Nat
#check m * (n + 0)            -- Nat
#check b1                     -- Bool
#check b1 && b2               -- "&&" is the Boolean and
#check b1 || b2               -- Boolean or
#check true                   -- Boolean "true"

/- Evaluate -/

#eval 5 * 4                   -- 20
#eval m + 2                   -- 3
#eval b1 && b2                -- false

/- Arrows -/
#check Nat → Nat              -- type the arrow as "\to" or "\r"
#check Nat -> Nat             -- alternative ASCII notation

#check Nat × Nat              -- type the product as "\times"
#check Prod Nat Nat           -- alternative notation

#check Nat → Nat → Nat
#check Nat → (Nat → Nat)      --  same type as above

#check Nat × Nat → Nat
#check (Nat → Nat) → Nat      -- a "functional"

#check Nat.succ               -- successor function
#check (0,1)                  -- pair
#check Nat.add

#check Nat.succ 2             -- Nat → Nat
#check Nat.add 2              -- Nat → Nat
#check Nat.add 2 3            -- Nat
#check (1,2).1                -- Nat
#check (1,2).2                -- Nat

#eval Nat.succ 2              -- 3
#eval Nat.add 2 3             -- 5
#eval (1,3).1                 -- 1
#eval (1,3).2                 -- 3