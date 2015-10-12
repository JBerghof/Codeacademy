# Scope on methods

class Person
  # methods are public by default  

  def initialize(name, age)
    @name = name
    @age = age
  end
  
  public    # This method can be called from outside the class.
  
  # Everything after the public keyword through the end of the 
  # class definition will now be public unless we say otherwise

  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end
  
  private   # This method can't!
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new("Eric", 26)
eric.about_me
#eric.bank_account_number

# object.method -- object is the receiver of the method

# ATTRIBUTES
# We can use attr_reader to access a variable and attr_writer 
# to change it. We can use attr_accessor to make a variable 
# readable and writeable. If we write:
class Person
  attr_reader :name
  attr_writer :job
  attr_accessor :age

  def initialize(name, age, job)
    @name = name
    @job = job
  end
 
end

p1 = Person.new("Omar", 2, "engineer")
puts p1.name
p1.age = 29
puts p1.age
