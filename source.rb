class Source
  attr_accessor :id
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
    @id = Random.rand(1..1000)
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  def self.list_sources(things)
    sources_names = []
    things.each do |thing|
      if thing.instance_of? Movie
        sources_names << thing.source.name unless sources_names.include?(thing.source.name)
      end
    end
    sources_names.each_with_index do |name, index|
      puts "[#{index}] Source: #{name}"
    end
  end
end
