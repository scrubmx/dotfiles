IRB.conf[:PROMPT_MODE] = :SIMPLE

# Return a list of methods defined locally for a particular object.
class Object
  def local_methods(object = self)
    (object.methods - object.class.superclass.instance_methods).sort
  end
end

# Since irb won't provide a way to clear the screen
def clear
  system 'clear'
  nil
end

# Useful aliases
alias q exit
