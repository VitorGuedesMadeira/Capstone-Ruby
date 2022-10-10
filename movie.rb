require_relative 'item'

class Movie < Item
  def initialize(*args, silent)
    super(*args)
    @silent = silent
  end

  def self.list_movies(movies)
    movies.each do |movie|
      puts "\nThe movie published date is: #{movie.publish_date}"
    end
  end

  def self.add_movie
    print "\nType a publish date: "
    print "\nAnswer: "
    movie_date = gets.chomp.to_i
    print 'Is this movie silent? [y/n]'
    print "\nAnswer: "
    movie_silent = gets.chomp
    silent_answer = case movie_silent.downcase
                    when 'y'
                      true
                    else
                      false
                    end
    Movie.new(movie_date, silent_answer)
  end

  private

  def can_be_archived?
    super || @silent
  end
end
