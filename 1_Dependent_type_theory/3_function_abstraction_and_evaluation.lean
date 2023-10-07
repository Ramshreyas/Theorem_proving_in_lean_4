/- Lambdas -/

#check fun (x : Nat) => x + 1
#check λ (x : Nat) => x + 1
#check fun x : Nat => x + 1
#check λ x : Nat => x + 1

#eval (λ x : Nat => x + 1) 5          -- 6

/- Lambda Abstraction -/

#check fun x : Nat => fun y : Bool => if not y then x + 1 else x + 2
#check fun (x : Nat) (y : Bool) => if not y then x + 1 else x + 2
#check fun x y => if not y then x + 1 else x + 2                        -- type inference

def f (n : Nat) : String := toString n
def g (s : String) : Bool := s.length > 0

#check fun x : Nat => x        -- Nat → Nat               -- identity function
#check fun x : Nat => true     -- Nat → Bool              -- constant function  
#check fun x : Nat => g (f x)  -- Nat → Bool              -- composition of f and g
#check fun x => g (f x)        -- Nat → Bool              -- type inference of above

/- Functions as parameters -/

#check fun (g : String → Bool) (f : Nat → String) (x : Nat) => g (f x)

/- Types as parameters -/

#check fun (α β γ : Type) (g : β → γ) (f : α → β) (x : α) => g (f x)

#check (fun x : Nat => x) 1      -- 1 : Nat
#check (fun x : Nat => true) 1   -- 1 : Bool 

#check (fun (α β γ : Type) (u : β → γ) (v : α → β) (x : α) => u (v x)) Nat String Bool g f 0  -- Bool

#eval (fun x : Nat => 1) 1    -- 1
#eval (fun x : Nat => true) 1 -- true