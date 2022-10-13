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
      '     9) - Add a book',
      '    10) - Add a music album',
      '    11) - Add a movie',
      '    12) - Add a game',
      '    13) - Exit',
      ''
    ]
    puts '________________________________________________'
    puts "\nPlease choose an option by entering a number:"
    puts options
  end
end
