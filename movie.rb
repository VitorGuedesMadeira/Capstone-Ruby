require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :id
  attr_reader :silent

  def initialize(*args, silent)
    super(*args)
    @silent = silent
  end

  def self.list_movies(things)
    index = 1
    things.each do |thing|
      if thing.instance_of? Movie
        puts "\n[#{index}] The movie #{thing.label.title}, genre #{thing.genre.name} was published date on #{thing.publish_date}"
        index += 1
      end
    end
  end

  def self.add_movie
    print 'Enter the name of the movie: '
    label_title = gets.chomp
    print 'Director\'s first name?: '
    author_first_name = gets.chomp
    print 'Director\'s last name?: '
    author_last_name = gets.chomp
    print 'Enter the movie\'s genre: '
    genre_name = gets.chomp
    print 'Enter the source of the movie: '
    source_name = gets.chomp
    # item inputs
    print "\nWhat's the publish date? [year] "
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

    new_movie = Movie.new(movie_date, silent_answer)

    new_source = Source.new(source_name)
    new_source.add_item(new_movie)

    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_movie)

    new_label = Label.new(label_title, 'unknown')
    new_label.add_item(new_movie)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_movie)

    new_movie
  end

  private

  def can_be_archived?
    super || @silent
  end
end
