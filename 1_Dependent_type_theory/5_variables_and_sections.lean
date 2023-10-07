/- Variables -/

variable (α β γ : Type)

def compose (g: β → γ) (f: α → β) (x: α) : γ := g (f x)

def doTwice (h: α → α) (x: α) : α := h (h x)

def doThrice (h: α → α) (x: α) : α := h (h (h x))             -- variable types defined only once

/- Variables of any type -/

variable (g' : β → γ) (f' : α → β) (h' : α → α)
variable (x : α)

def compose' := g' (f' x)
def doTwice' := h' (h' x)
def doThrice' := h' (h' (h' x))                         -- compact definition

#print compose'
#print doTwice'
#print doThrice'

/- Sections -/

section useful
  variable (α β γ : Type)
  variable (g : β → γ) (f : α → β) (h : α → α)
  variable (x : α)

  def compose'' := g (f x)
  def doTwice'' := h (h x)
  def doThrice'' := h (h (h x))                -- Variables scoped to section
end useful                                     -- and hence did not clash with previous definitions