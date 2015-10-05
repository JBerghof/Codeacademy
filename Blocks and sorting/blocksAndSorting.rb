# Methods
def greeting
	puts "cuando yo me vaya de aqui"
end

def array10
	return (1..10).to_a
end

A = array10
puts A

B = []
5.times{
	B.push("oh")
}

puts B

# Parameters and arguments
def cubertino(n)
  puts n ** 3
end

cubertino(8)

# Use splat when you do not know the number of arguments there will be
def what_up(greeting, *bros)
  bros.each { |bro| puts "#{greeting}, #{bro}!" }
end
 
what_up("What's up", "Justin", "Ben", "Kevin Sorbo")

# How to define a Method
def by_five?(n)
  return n % 5 == 0
end

puts by_five?(6)

# BLOCKS -> Blocks are like nameless methods 
1.times do 
	puts "I am a block"
end

1.times{ puts "So am I"}

# How blocks differs from methods

# Method
def capitalLetter(string)
	puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalLetter("ruben")

# Block that captalizes each string in the array
["omar", "julian"].each{ |item|
	puts "#{item[0].upcase}#{item[1..-1]}"
}

# Sorting with blocks
my_array = [3, 4, 8, 7, 1, 6, 5, 9, 2]

# Call the sort! method on my_array below.
# my_array should then equal [1, 2, 3, 4, 5, 6, 7, 8, 9].

print my_array.sort!
puts

=begin
	The combined comparison operator returns:
	- 0 if the first operand (item to be compared) equals the second
	- 1 if first operand is greater than the second
	- -1 if the first operand is less than the second

=end

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

puts "book_1 <=> book_2 returns #{book_1 <=> book_2}"

# Changing the Sorting order Z-A instead of A-Z
books = ["Charlie and the Chocolate Factory", "War and Peace", "Utopia", "A Brief History of Time", "A Wrinkle in Time"]

# To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

# Sort your books in descending order, in-place below
books.sort! { |firstBook, secondBook| secondBook <=> firstBook }

# Example of sorting in descending order
fruits = ["orange", "apple", "banana", "pear", "grapes"]
fruits.sort!{ |a,b| b <=> a }

# By default parameters in methods
def alphabetize(arr, rev=false)
	if rev
		arr.sort { |item1, item2| item2 <=> item1 }
	else
		arr.sort { |item1, item2| item1 <=> item2 }
	end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "A-Z: #{alphabetize(books)}"
puts "Z-A: #{alphabetize(books, true)}"

# Other way of doing the same
def alphabetize(arr, rev=false)
    arr.sort!
    if rev
        arr.reverse!
    else
        arr
    end
end

numbers = [5, 1, 3, 8]
alphabetize(numbers, true)
puts numbers