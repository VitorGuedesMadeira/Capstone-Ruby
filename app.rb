require_relative 'user_options'
require_relative 'movie'
require_relative 'music_album'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'save_files'

class App
  def initialize
    @things = SaveFiles.read_files
  end

  def run
    puts '        _                                       '
    puts '  /\\/\\ (_) ___ _ __ _____   _____ _ __ ___  ___ '
    puts " /    \\| |/ __| '__/ _ \\ \\ / / _ \\ '__/ __|/ _ \\"
    puts '/ /\\/\\ \\ | (__| | | (_) \\ V /  __/ |  \\__ \\  __/'
    puts '\\/    \\/_|\\___|_|  \\___/ \\_/ \\___|_|  |___/\\___|'

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
      Label.list_labels(@things)
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
    when '13'
      SaveFiles.write_things(@things)
      puts "\nSee you later! :)"
      puts 'Co-authors: Vitor Guedes | Diego Yon | Muhammad Ashraf'
      puts ''
      exit
    else
      puts 'Please insert a valid number!'
    end
  end
end
