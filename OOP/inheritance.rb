# Inheritance.
# Express an is-a relationship i.e Student is a Person
=begin
	class DerivedClass < BaseClass
	  # Some stuff!
	end
=end

class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

# SuperBadError class inherits from ApplicationError
# SuperBadError is a ApplicationError
class SuperBadError < ApplicationError
end

# err has access to the method display_error via inheritance
err = SuperBadError.new
err.display_error

# Override!
class Creature
    def initialize(name)
        @name = name
    end
  
    def fight
        puts "Punch to the chops!"
    end
end
=begin
    You can directly access the attributes or methods of 
    a superclass with super keyword.
    When you call super from inside a method, that tells 
    Ruby to look in the superclass of the current class and find 
    a method with the same name as the one from which super 
    is called.
=end
class Dragon < Creature
    def fight
        puts "Breathes fire!"
        super
    end
    
    
end

cody = Dragon.new("Cody")
cody.fight

# Any given Ruby class can ONLY have one superclass. 
# NO MULTIPLE INHERITANCE

# oneline
class Elf < Creature; end

