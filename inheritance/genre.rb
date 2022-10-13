require 'securerandom'

class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name, id = SecureRandom.random_number(1000))
    @name = name
    @items = []
    @id = id
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def self.list_genres(things)
    genres = []
    things.each do |thing|
      genres << thing.genre if thing.instance_of?(MusicAlbum) && !genres.include?(thing.genre.name)
    end
    genres.each_with_index do |genre, index|
      puts "[#{index + 1}] (ID: #{genre.id}) Genre: #{genre.name}"
    end
  end
end
