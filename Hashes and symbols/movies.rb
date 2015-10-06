# A night at the movies

movies = Hash.new

puts "Select an option please: "
puts "-- 'add' for adding a movie to the library"
puts "-- 'update' for updating a movie from the library"
puts "-- 'display' for displaying all the movies of the library"
puts "-- 'delete' for deleting a movie to the library"
choice = gets.chomp
choice.downcase!

# The case statement
case choice
when "add"
    puts "Introduce the title to add: "
    title = gets.chomp
    puts "Introduce the rate for that movie (0 to 4): "
    rating = gets.chomp
    if movies[title.to_sym].nil?
        movies[title.to_sym] = rating.to_i
    else
        puts "The movie already exists!"
    end

when "update"
    puts "Introduce the movie title to update: "
    title = gets.chomp
    if movies[title.to_sym].nil?
        puts "Unknown movie!"
    else
        puts "Introduce the new rate for that movie (0 to 4): "
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i
    end

when "display"
    puts "List of movies:"
    movies.each{ |movie, rating|
        puts "#{movie}: #{rating}"
    }
    
when "delete"
    puts "Introduce the title to delete: "
    title = gets.chomp
    if movies[title.to_sym].nil?
        puts "Unknown movie!"
    else
        movies.delete(title.to_sym)
        puts "The movie #{title} has been deleted!"
    end

else
    puts "Error!"

end