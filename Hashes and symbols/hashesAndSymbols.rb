# How to create a Hash
breakfast = { "bacon" => "tasty",
  "eggs" => "tasty",
  "oatmeal" => "healthy",
  "OJ" => "juicy"
}

# or
h = Hash.new


# Ruby returns nil if you try to access a key that doesn't exist
creatures = { "weasels" => 0,
  "puppies" => 6,
  "platypuses" => 3,
  "canaries" => 1,
  "Heffalumps" => 7,
  "Tiggers" => 1
}

creatures["omar"]

# Another syntax for hashes
popo = { :oxes => 2,
  :giraff => 1,
  :weezads => 17,
  :elve => 1,
  :canries => 4,
  :ha => 1
}

# What is a symbol ? Symbol is kind of a name, not a string!
puts "string" == :string # false

=begin
The .object_id method gets the ID of an object. It's
how Ruby knows whether two objects are the exact same object.
=end

puts "string1".object_id
puts "string2".object_id

puts :symbol1.object_id
puts :symbol2.object_id

# Symbols cannot be changed (immutable)
# Only one copy of any symbol exists at a given time
# Symbol-as-keys are faster than strings-as-keys because of the above two reasons

# Converting Between Symbols and Strings
puts :sasquatch.to_s
puts "sasquatch".to_sym

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

# Add your code below!
symbols = []
strings.each do |language|
    symbols.push(language.to_sym)
end

puts symbols

# The marriage of hashes and symbols

# This is the new syntax of hashes from Ruby 1.9
new_hash = {
	one: 1,
	two: 2,
	three: 3
}

# Comparing string and symbols
require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  900000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  900000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."

# We use select in order to filter a hash for values 
# that meet certain criteria

movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

# Filter the movies with rate > 3
good_movies = movie_ratings.select{ |movie, rate|
    rate > 3
}
puts good_movies

# Iterating ONLY over keys
good_movies.each_key { |k| puts k} 

# Iterating ONLY over values
good_movies.each_value { |v| puts v} 
