require_relative 'user_options'
require_relative 'movie'
require_relative 'music_album'
require_relative 'save_files'

class App
  def initialize
    @things = SaveFiles.read_files
  end

  def run
    p @things
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
      MusicAlbum.list_music_album(@things)
    when '3'
      Movie.list_movies(@things)
    when '4'
      4
    when '5'
      Genre.list_genres(@things)
    when '6'
      6
    when '7'
      7
    when '8'
      Source.list_sources(@things)
    when '9'
      9
    when '10'
      @things << MusicAlbum.add_music_album
    when '11'
      @things << Movie.add_movie
    when '12'
      12
    else
      SaveFiles.write_music_albums(@things)
      SaveFiles.write_genres(@things)
      exit
    end
  end
end
