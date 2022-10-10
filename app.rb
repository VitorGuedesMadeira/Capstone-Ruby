require_relative 'user_options'
require_relative 'movie'

class App
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
  end

  def run
    puts "\nWelcome to my catalog!"
    keep_looping = true
    while keep_looping
      UserOptions.user_options
      print 'Answer: '
      choice = gets.chomp
      choosing_answers(choice)
    end
  end

  def choosing_answers(choice)
    case choice
    when '1'
      1
    when '2'
      2
    when '3'
      Movie.list_movies(@movies)
    when '4'
      4
    when '5'
      5
    when '6'
      6
    when '7'
      7
    when '8'
      8
    when '9'
      9
    when '10'
      10
    when '11'
      @movies << Movie.add_movie
    when '12'
      12
    else
      exit
    end
  end
end
