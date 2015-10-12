# Classes

# by convention, class names start with a capital letter
# and use CamelCase

# Language class
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
	
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description

# Person class
class Person

	# class variable
	@@people_count = 0

	# initialize as the function that "boots up" each 
	# object the class creates.
	def initialize(name, age)
		# we use @ before a variable to signify that 
		# it's an instance variable
		@name = name
		@age = age
		@@people_count += 1
	end

	def self.numberOfInstances
		# return the class variable
		@@people_count
	end
end

omar = Person.new("Omar", 29)
dhh = Person.new("David", 13)
puts "Number of Person instances: #{Person.numberOfInstances}"

# Computer class -- Notion of scope in Ruby (valid for methods and variables)
# global variables -> $
# local variables -> 
# class variables -> @@
# instance variables -> @ 
class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

# Example of a more sofisticated code
def create_record(attributes, raise_error = false)
  record = build_record(attributes)
  yield(record) if block_given?
  saved = record.save
  set_new_record(record)

  # error if the user tries to create or save an invalid record
  raise RecordInvalid.new(record) if !saved && raise_error
  record
end

# Message class
class Message
    @@messages_sent = 0
    def initialize(from, to)
        @from = from
        @to = to
        @@messages_sent += 1
    end
end

class Email < Message
    def initialize(from, to)
        super
    end
end

my_message = Message.new("Me", "You")