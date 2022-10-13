require_relative './user_interface/user_options'
require_relative './user_interface/greetings'
require_relative './user_interface/goodbye'
require_relative './save_files/save_files'
require_relative './things/music_album'
require_relative './things/movie'
require_relative './things/game'
require_relative './things/book'
require_relative './archive/archived'
require_relative './delete_item/delete_item'

class App
  def initialize
    @things = SaveFiles.read_things
    @archived_things = SaveFiles.read_archived
  end

  def run
    Greetings.greetings
    keep_looping = true
    while keep_looping
      UserOptions.user_options
      choosing_answers
    end
  end

  def choosing_answers
    print 'Answer: '
    case gets.chomp
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
      Archived.list_can_be_archived(@things, @archived_things)
    when '10'
      Archived.list_archived_items(@archived_things)
    when '11'
      @things << Book.add_book
    when '12'
      @things << MusicAlbum.add_music_album
    when '13'
      @things << Movie.add_movie
    when '14'
      @things << Game.add_game
    when '15'
      DeleteItem.delete_item(@things)
    when '16'
      SaveFiles.write_things(@things, @archived_things)
      Goodbye.goodbye
      exit
    else
      puts 'Please insert a valid number!'
    end
  end
end
