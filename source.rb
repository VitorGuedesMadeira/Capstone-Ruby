class Source
  attr_reader :name
  def initialize (name, id= rand(0..1000))
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  def self.list_sources(sources)
    sources.each do |source|
      puts source.name
    end
  end
end
