require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :id
  attr_reader :on_spotify

  def initialize(*args, on_spotify)
    super(*args)
    @on_spotify = on_spotify
  end

  def self.list_music_album(things)
    things.each_with_index do |thing, index|
      puts "[#{index}] The music album published date is: #{thing.publish_date}, spotify: #{thing.on_spotify}" if thing.instance_of? MusicAlbum
    end
  end

  def self.add_music_album
    print "\nType a publish date [year]: "
    print "\nAnswer: "
    music_album_date = gets.chomp.to_i
    print 'Is this Music Album on Spotify? [y/n]'
    print "\nAnswer: "
    spotify = gets.chomp
    is_on_spotify = case spotify.downcase
                    when 'y'
                      true
                    else
                      false
                    end
    print 'What is the genre?'
    print "\nAnswer: "
    genre_name = gets.chomp

    new_music_album = MusicAlbum.new(music_album_date, is_on_spotify)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_music_album)
    new_music_album
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
