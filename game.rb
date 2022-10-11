require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at
  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.list_games(things)
    things.each_with_index do |thing, index|
      puts "[#{index}] The game published date is: #{thing.publish_date}" if thing.instance_of? Game
    end
  end

  def self.add_game
    print "\nType a publish date [year]: "
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
    print 'What is the source?'
    print "\nAnswer: "
    source_name = gets.chomp

    new_game = Game.new(game_date, multiplayer_answer, last_played)

    new_source = Source.new(source_name)
    new_source.add_item(new_game)
    new_game
  end

  private
  
  def can_be_archived?
    super && Time.new.year-last_played_at > 2
  end
end

# game = Game.new(2010, true, 2019)
# game.move_to_archive
# p game