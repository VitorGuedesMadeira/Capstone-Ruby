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

  def self.list_sources(things)
    things.each do |thing|
      arr.push (thing.source)
    end
  end
end
