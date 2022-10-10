class Source
  attr_reader :name

  def initialize(name, _id = rand(0..1000))
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  def self.list_sources(things)
    sources_names = []
    things.each do |thing|
      sources_names << thing.source.name unless sources_names.include?(thing.source.name)
    end
    sources_names.each_with_index do |name, index|
      puts "[#{index}] Source: #{name}"
    end
    puts sources_names
  end
end
