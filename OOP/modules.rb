# MODULES
# You can think of a module as a toolbox 
# that contains a set methods and constants
# Modules can't create instance and can't have subclasses.
# They are just used to store things

module Circle

  # Including constants in modules is a great idea
  # Constants are written in ALL_CAPS
  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

module MyLibrary
	FAVE_BOOK = "Relato de un naufrago"
end

# One of the main purposes of modules is to separate methods and
# constants into named spaces. That is how Ruby does not 
# confuse Math::PI and Circle::PI. "::" is the scope resolution
# operator.

puts "Circle PI: #{Circle::PI}"
puts "Maths PI: #{Math::PI}"

# Some modules like Math are already present in the interpreter.
# Others need to be explicitly brought in using require

require 'date'
puts Date.today

# We can do MORE. We can include a module. Any class that include
# a module can use those module's methods!. No longer need "::"
class Angle
  include Math
  attr_accessor :radians
  
  def initialize(radians)
    @radians = radians
  end
  
  def cosine
    cos(@radians)
  end
end

acute = Angle.new(1)
puts acute.cosine

# MIXINS -- The marriage of modules and classes
=begin
When a module is used to mix additional behavior and 
information into a class, it's called a mixin. 
Mixins allow us to customize a class without having 
to rewrite code!
=end
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump

# By mixing in traits from various modules as needed, we can
# add any combination of behaviors to our classes we like!
module MartialArts
	def swordsman
		puts "I am a swordman"
	end
end

class Ninja
	# give a Ninja the swordsman method
	include MartialArts
	def initialize(clan)
		@clan = clan
	end
end

class Samurai
	# give a Samurai the swordsman method
	include MartialArts
	def initialize(shogun)
		@shogun = shogun
	end
end

# Whereas include mixes a module's methods at the instance level,
# the extend keyword mixes them at a class level.
# This means that class itself can use methods, ex:

# ThePresent has a .now method that we'll extend to TheHereAnd

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now