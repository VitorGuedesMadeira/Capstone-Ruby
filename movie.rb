require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_reader :silent
  def initialize(*args, silent)
    super(*args)
    @silent = silent
  end

  def self.list_movies(things)
    things.each_with_index do |thing, index|
      puts "[#{index}] The movie published date is: #{thing.publish_date}" if thing.instance_of? Movie
    end
  end

  def self.add_movie
    print "\nType a publish date [year]: "
    print "\nAnswer: "
    movie_date = gets.chomp.to_i
    print 'Is it a silent movie? [y/n]'
    print "\nAnswer: "
    movie_silent = gets.chomp
    silent_answer = case movie_silent.downcase
                    when 'y'
                      true
                    else
                      false
                    end
    print 'What is the source?'
    print "\nAnswer: "
    source_name = gets.chomp
    
    new_movie = Movie.new(movie_date, silent_answer)

    new_source = Source.new(source_name)
    new_source.add_item(new_movie)
    return new_movie
  end

  private

  def can_be_archived?
    super || @silent
  end
end
