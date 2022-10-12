require_relative 'user_options'
require_relative 'movie'
require_relative 'music_album'
require_relative 'game'
require_relative 'book'
require_relative 'save_files'

class App
  def initialize
    @things = SaveFiles.read_files
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
      Book.list_books(@things)
    when '2'
      MusicAlbum.list_music_album(@things)
    when '3'
      Movie.list_movies(@things)
    when '4'
      Game.list_games(@things)
    when '5'
      Genre.list_genres(@things)
    when '6'
      6
    when '7'
      Author.list_authors(@things)
    when '8'
      Source.list_sources(@things)
    when '9'
      @things << Book.add_book
    when '10'
      @things << MusicAlbum.add_music_album
    when '11'
      @things << Movie.add_movie
    when '12'
      @things << Game.add_game
    else
      SaveFiles.write_things(@things)
      exit
    end
  end
end
