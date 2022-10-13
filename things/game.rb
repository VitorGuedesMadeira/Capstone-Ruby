require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.list_games(things)
    index = 1
    things.each do |thing|
      if thing.instance_of? Game
        puts "\n[#{index}] (ID:#{thing.id}) The game: #{thing.label.title} by #{thing.author.first_name} #{thing.author.last_name} has been published in #{thing.publish_date}"
        index += 1
      end
    end
  end

  def self.add_game
    print 'Enter name of the game: '
    label_title = gets.chomp
    print 'Games\'s creator first name: '
    author_first_name = gets.chomp
    print 'Game\'s creator last name: '
    author_last_name = gets.chomp
    print 'Enter the game\'s genre: '
    genre_name = gets.chomp
    print 'Enter the source of this game: '
    source_name = gets.chomp
    # item inputs
    print "\nWhat's the publish date? [year] "
    print "\nAnswer: "
    game_date = gets.chomp.to_i
    print 'Is it a multiplayer game? [y/n]'
    print "\nAnswer: "
    game_multiplayer = gets.chomp
    multiplayer_answer = case game_multiplayer.downcase
                         when 'y'
                           true
                         else
                           false
                         end
    print 'When was the game last played?'
    print "\nAnswer: "
    last_played = gets.chomp.to_i

    new_game = Game.new(multiplayer_answer, last_played, game_date)

    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_game)

    new_label = Label.new(label_title, 'unknown')
    new_label.add_item(new_game)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_game)

    new_source = Source.new(source_name)
    new_source.add_item(new_game)

    new_game
  end

  private

  def can_be_archived?
    super && Time.new.year - last_played_at > 2
  end
end
