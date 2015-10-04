counter = 1
while counter < 11 do
	puts counter
	counter += 1
end

# For exclude max
for num in 1...10
	puts num
end

# For include max
for num in 1..10
	puts num
end

# The loop method
i = 20
loop do
  i -= 1
  print "#{i}"
  break if i <= 0
end

# Next!
i = 20
loop do
  i -= 1
  next if i % 2 != 0
  print "#{i}"
  break if i <= 0
end

# Saving numbers in an Array
my_array = []
for number in 1..5
  my_array.push(number)
end
my_array

# The .each iterator
puts "The .each iterator"
A = [3, 5, 2, 65, 98, 69]
A.each do|x|
	x *= 2
	puts "#{x}"	
end

# Remember that 'do' and 'end' can be replaced by {}
B = ['a', 'b', 'c']
B.each { |item|
	puts item
}

# The .times operator
5.times{ puts "Quiero comer pollito chicken!"}

# Looping with until
i = 1
until i > 50 do
    print i
    i += 1
end