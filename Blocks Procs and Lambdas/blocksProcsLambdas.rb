# BLOCKS

# .collect method
fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
doubled_fibs = fibs.collect { |x| x*2 }

print "#{doubled_fibs}\n"

# Learning to yield
# Methods that accept blocks have a way of transferring 
# control from the calling method to the block and back again

def block_test
  puts "We're in the method! DENTRO"
  puts "Yielding to the block...DENTRO"
  yield
  puts "We're back in the method DENTRO!"
end

block_test { puts ">>> We're in the block FUERA!" }

# Yielding with parameters
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

# 'n' will take the value passed by yield(name) in the method
yield_name("Eric") { |n| puts "My name is #{n}." }

# Now call the method with your name!
yield_name("Omar") { |n| puts "My name is #{n}." }

# Example
def double(p)
    puts "METHOD: The double of #{p} is ", p*2
    yield(10)
    puts "METHOD: Exit the method"
end

double(4) { |x| puts "This is done on the block: #{x*2}" }

#PROCS

# Blocks are not objects !. This is one of the very few exceptions
# to the "everything is an object" rule in Ruby.
# You can use Procs (saved blocks). You can name a block and turn in
# into a proc.

# proc syntax -> cube = Proc.new { |x| x ** 3 }
# You can then pass the proc to a method that would otherwise take a block
# The & is used to convert the cube proc into a block

# Ex 1
multiples_of_3 = Proc.new { |n|
  n % 3 == 0
}

M = (1..100).to_a.select(&multiples_of_3)
print M.to_s + "\n"

# Ex 2
floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new { |x| x.floor}

# .collect invokes the given block once for each element of self.
print floats.collect(&round_down).to_s

# Ex 3 (using .select)
# select Returns a new array containing all elements of ary for which 
# the given block returns a true value.
group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]

# Complete this as a new Proc
over_4_feet = Proc.new { |x|
    x > 4
}

# Change these three so that they use your new over_4_feet Proc
can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)

puts can_ride_1
puts can_ride_2

# Methods can yield to procs
def greeter
    yield
end

phrase = Proc.new {
    puts "Hello there!"
}

greeter(&phrase)

# Calling a proc using .call
hi = Proc.new do puts "Hello!" end

def greeting
	puts "in"
	yield
	puts "exit"
end

greeting do hi.call end

# Symbols meet Procs
# You can also convert symbols to procs using &:
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.collect(&:to_s)
print "#{strings_array}\n"

# LAMBDAS --> lambda { |param| block }

# Lambda is an object
# lambda { puts "Hello!"} == Proc.new { puts "Hello!"}

# Ex 1
def lambda_demo(a_lambda)
	puts "I'm the method!"
	a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })

# Ex 2
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |lam| lam.to_sym }
symbols = strings.collect(&symbolize)

# Lambdas vs Procs
=begin
There are 2 diffs between lambdas and procs:
	- a lambda checks the number of args passed to it
	- when a lambda returns, it passes the control back to the
	calling method, when a proc returns, it does so without going
	back to the calling method
=end
 
 # Ex 3
 def batman_ironman_proc
  victor = Proc.new { return "PROC Batman will win!" }
  victor.call
  "This will never be printed!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor2 = lambda { return "LAMBDA Batman will win!" }
  victor2.call
  puts "Hello, I have the control now!"
end

puts batman_ironman_lambda

# Ex 4
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

symbol_filter = lambda { |x| x.is_a? Symbol}
symbols = my_array.select(&symbol_filter)

=begin

1. A block is just a bit of code between do..end or {}. 
It's not an object on its own, but it can be passed to 
methods like .each or .select.

2. A proc is a saved block we can use over and over.

3. A lambda is just like a proc, only it cares about the 
number of arguments it gets and it returns to its calling 
method rather than returning immediately.

=end

# Review

# Procs
odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
ints = odds_n_ends.select{ |x| x.is_a? Integer}

ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]
under_100 = Proc.new do |x| x < 100 end
youngsters = ages.select(&under_100)

# Lambdas
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
# Because it will be checking a hash, your lambda should include |key, value| instead of just |value|.
first_half = lambda { |k,v| v < 'M' }
a_to_m = crew.select(&first_half) # & convert lambda to block

# Is the same of  doing this, but the idea is refactoring and reusage of blocks
a_to_m_2 = crew.select do |k,v| v < 'M' end