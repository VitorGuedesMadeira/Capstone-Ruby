require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def self.list_music_album(things)
    index = 1
    things.each do |thing|
      if thing.instance_of? MusicAlbum
        puts "\n[#{index}] The music album published date is: #{thing.publish_date}, spotify: #{thing.on_spotify}"
        index += 1
      end
    end
  end

  def self.add_music_album
    print 'Enter name of the music album: '
    label_title = gets.chomp
    print 'Artist\'s first name: '
    author_first_name = gets.chomp
    print 'Artist\'s last name: '
    author_last_name = gets.chomp
    print 'Enter the music album\'s genre: '
    genre_name = gets.chomp
    print 'Enter the source of this music album: '
    source_name = gets.chomp
    # item inputs
    print "\nWhat's the publish date? [year] "
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

    new_music_album = MusicAlbum.new(is_on_spotify, music_album_date)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_music_album)

    new_source = Source.new(source_name)
    new_source.add_item(new_music_album)

    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_music_album)

    new_label = Label.new(label_title, 'unknown')
    new_label.add_item(new_music_album)

    new_music_album
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
