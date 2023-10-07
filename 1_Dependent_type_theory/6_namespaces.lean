/- Namespaces -/

namespace foo
  def a : Nat := 10
  def f (x : Nat) : Nat := x + a
  def fa : Nat := f a
  def ffa : Nat := f (f a)

  #check a
  #check f
  #check fa
  #check ffa
end foo

-- #check a     -- error
-- #check f     -- error

#check foo.a
#check foo.f
#check foo.fa
#check foo.ffa

open foo

#check a
#check f
#check fa
#check ffa

/- Examples in Lean -/
#check List.nil
#check List.cons
#check List.map

open List

#check nil
#check cons
#check map

/- Nested Namespaces -/

namespace Foo
  def a : Nat := 10

  namespace bar
    def f : Nat → Nat := fun x => x + a

    #check a      -- inner namespace can see outer namespace
    #check f
  end bar

  #check a
  #check bar.f    -- outer namespace needs namespace prefix to see inner namespace

end Foo

/- Closed namespaces can be reopened -/

namespace Foo
  #check a
end Foo