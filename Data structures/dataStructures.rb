# Access by index
demo_array = [100, 200, 300, 400, 500]
puts demo_array[2]

# Array of arrays
multiArray = [[1,3,4], [5,6,8], [3,5,0]]
multiArray.each do |x|
	puts "#{x}"
end

# Hashes
my_hash = { 
	"name" => "Eric",
	"age" => 26,
	"hungry" => true
}

puts my_hash["name"]
puts my_hash["age"]
puts my_hash["hungry"]

# Using Hash.new
pets1 = Hash.new
pets2 = {}

puts pets1.length
puts pets2.length

pets1["Carlitos"] = "Snoopy"
pets1["Daniel"] = "Danger"

pets1.each { |k,v|
    puts pets[k]
}

# Iteration
family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

family.each { |x, y| puts "#{x}: #{y}" }

# Iterating over multidimensional arrays
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]
s.each do |item|
    item.each { |x| puts x}
end

# Iterating over Hashes
secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}

secret_identities.each do |k,v|
    puts "#{k}: #{v}"
end