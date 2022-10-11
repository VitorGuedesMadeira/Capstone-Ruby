class Genre
  attr_reader :name, :items, :id

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
      genres_names << thing.genre.name unless genres_names.include?(thing.genre.name)
    end
    genres_names.each_with_index do |name, index|
      puts "[#{index}] Genre: #{name}"
    end
  end
end
