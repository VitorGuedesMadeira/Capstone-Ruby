class UserOptions
  def self.user_options
    options = [
      '',
      '     1) - List all books',
      '     2) - List all music albums',
      '     3) - List all movies',
      '     4) - List all games',
      '     5) - List all genres',
      '     6) - List all labels',
      '     7) - List all authors',
      '     8) - List all sources',
      '     9) - List items that can be archived',
      '    10) - List archived items',
      '    11) - Add a book',
      '    12) - Add a music album',
      '    13) - Add a movie',
      '    14) - Add a game',
      '    15) - Delete an item',
      '    16) - Exit',
      ''
    ]
    puts '________________________________________________'
    puts "\nPlease choose an option by entering a number:"
    puts options
  end
end
