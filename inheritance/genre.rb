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
    genres_names = []
    things.each do |thing|
      genres_names << thing.genre.name if thing.instance_of?(MusicAlbum) && !genres_names.include?(thing.genre.name)
    end
    genres_names.each_with_index do |name, index|
      puts "[#{index + 1}] Genre: #{name}"
    end
  end
end
