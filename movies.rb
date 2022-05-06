class Movie
  attr_reader :title, :rating, :duration

  def initialize(title, rating, duration)
    @title = title
    @rating = rating
    @duration = duration
  end

  def watch
    puts "Watching #{title} - #{rating} (#{duration} mins)..."
  end
end

class MovieQueue
  include Enumerable

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each(&block)
    @movies.each(&block)
  end

  def each_pg_movie(&block)
    @movies.select { |movie| movie.rating == 'PG' }.each(&block)
  end

  def each_by_rating(rating, &block)
    @movies.select { |movie| movie.rating == rating }.each(&block)
  end
end

movie1 = Movie.new('Toy Story', 'G', 81)
movie2 = Movie.new('Cast Away', 'PG', 143)
movie3 = Movie.new('Apollo 13', 'PG', 140)
movie4 = Movie.new('Cars', 'G', 117)

queue = MovieQueue.new('Friday Night')
queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)
queue.add_movie(movie4)

queue.each { |movie| movie.watch }
puts '____'
queue.each_pg_movie { |movie| movie.watch }
puts '____'
queue.each_by_rating('G') { |movie| movie.watch }

puts '____'
long_movies = queue.select { |m| m.duration > 100 }
puts long_movies