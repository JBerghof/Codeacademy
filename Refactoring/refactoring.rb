# The Zen of Ruby
# Ruby prioritizes programmer productivity over program optimization

puts "Oneline if statement" if true

puts "Esto se imprime si la condicion no se cumple" unless false

# Ternary conditional expression
# boolean ? Do this if true: Do this if false

puts 5 == 6 ? "5 != 6 is true" : "5 == 6 is false"

def boolean_to_string(b)
  puts b == true ? "true" : "false"
end

puts boolean_to_string(true)
puts boolean_to_string(false)

# When and Then: The case statement

puts "Hello there!"
greeting = gets.chomp

case greeting
    when "English" then puts "Hello!"
    when "French" then puts "Bonjour!"
    when "German" then puts "Guten Tag!"
    when "Finnish" then puts "Haloo!"
    else puts "I don't know that language!"
end

# Conditional assignment ||=
# Assign a variable if it hasn't already been assigned

favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

# This assignment does not happen since our variable has already a value
favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

# Regular assignment to overwrite the precedent value
favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book

# Using conditional assignment for optional parameters
def my_method(optional_param)
  optional_param ||= 3
end

puts "with parameter: #{my_method(5)}"
puts "optional: #{my_method(nil)}"

# Implicit return
# Ruby's methods will return the result of the last evaluated expression

def multiple_of_three(n)
    n % 3 == 0 ? "True" : "False"
end


# Short-Circuit Evaluation
# Ruby doesn't look at both expressions unless it has to
def a
  puts "A was evaluated!"
  return true
end

def b
  puts "B was also evaluated!"
  return true
end

puts a || b
puts "------"
puts a && b

# .upto and .downto methods
"L".upto("P") { |letter| puts letter }

# .respond_to? takes a symbol (method name) and return true if an object
# can receive that method and false otherwise
[1, 2, 3].respond_to?(:push) # => true since you can call push on an array
[1, 2, 3].respond_to?(:to_sym) # => false since you can't turn an array into a symbol

age = 26
puts age.next
puts age.respond_to?(:next)

# Pushing to arrays and strings using <<
alphabet = ["a", "b", "c"]
alphabet << "d" 

caption = "A giraffe surrounded by "
caption << "weezards!"

# String interpolation ( casting integers to strings using #{} )
favorite_things = ["Ruby", "espresso", "candy"]

puts "A few of my favorite things:"

favorite_things.each do |thing|
	puts "I love #{thing}!" 
end
