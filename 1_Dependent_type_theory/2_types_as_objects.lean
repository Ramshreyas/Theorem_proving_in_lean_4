/- Types as objects -/

#check Nat                  -- Type
#check Bool                 -- Type
#check Nat → Bool           -- Type
#check Nat × Bool           -- Type
#check Nat → Nat × Bool     -- Type
#check (Nat → Nat) × Bool   -- Type
#check (Nat → Nat × Bool)   -- Type
#check (Nat → Nat) × (Nat → Bool) -- Type

/- Type Constants -/

def α : Type := Nat
def β : Type := Bool
def F : Type → Type := List
def G : Type → Type → Type := Prod

#check α
#check β
#check F
#check G

#check F α
#check F Nat
#check G α
#check G α β
#check G β Nat

/- The Cartesian Product -/
#check Prod                  -- Type → Type → Type
#check Prod α β              -- Type
#check Prod Nat Bool         -- Type
#check Nat × Bool            -- Type

/- Lists -/
def γ : Type := Nat

#check List γ                -- Type
#check List Nat              -- Type

/- The types of Type -/

#check Type                 -- Type 1
#check Type 1               -- Type 2
#check Type 2               -- Type 3
#check Type 3               -- Type 4

/- The type of Type 0 is not Type 1 -/
#check Type 0               -- Type 1

/- Polymorphic types -/
#check List                 -- List.{u} (α : Type u) : Type u
#check List Type            -- Type 1
#check Prod                 -- Prod.{u_1 u_2} (α : Type u_1) (β : Type u_2) : Type (max u_1 u_2)

/- Defining polymorphic Constants -/
universe u

def H (α : Type u) : Type u := Prod α α

#check H                    -- Type u_1 → Type u_1 (H.{u} (α : Type u) : Type u)

/- Alternately, -/
def H'.{v} (α : Type v) : Type v := Prod α α  -- Type v → Type v

#check H'                  -- Type v → Type v

