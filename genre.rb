class Genre
  attr_accessor :id
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
    @id = Random.rand(1..1000)
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def self.list_genres(things)
    genres_names = []
    things.each do |thing|
      if thing.instance_of? MusicAlbum
        genres_names << thing.genre.name unless genres_names.include?(thing.genre.name)
      end
    end
    genres_names.each_with_index do |name, index|
      puts "[#{index}] Genre: #{name}"
    end
  end
end
