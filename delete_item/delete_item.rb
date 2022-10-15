class DeleteItem
  def self.delete_item(things)
    puts "\nWhich item do you want to delete?"
    puts '1) Book'
    puts '2) Movie'
    puts '3) Music Album'
    puts '4) Game'
    print "\nAnswer: "
    case gets.chomp.downcase
    when '1'
      Book.list_books(things)
      selected_item(things, 'book')
    when '2'
      Movie.list_movies(things)
      selected_item(things, 'movie')
    when '3'
      MusicAlbum.list_music_album(things)
      selected_item(things, 'music album')
    when '4'
      Game.list_games(things)
      selected_item(things, 'game')
    else
      puts "\nInvalid input!"
      delete_item(things)
    end
  end

  def self.selected_item(things, item)
    puts "\nPlease select the #{item} to be deleted (by ID)"
    print 'Answer: '
    item_selected = gets.chomp
    things.delete_if { |thing| thing.id == item_selected.to_i }
    puts "\n#{item.capitalize} deleted!"
  end
end
