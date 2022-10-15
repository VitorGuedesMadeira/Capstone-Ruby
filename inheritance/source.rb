require 'securerandom'

class Source
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = SecureRandom.random_number(1000))
    @name = name
    @items = []
    @id = id
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  def self.list_sources(things)
    sources = []
    things.each do |thing|
      sources << thing.source if thing.instance_of?(Movie) && !sources.include?(thing.source.name)
    end
    sources.each_with_index do |source, index|
      puts "[#{index + 1}] (ID: #{source.id}) Source: #{source.name}"
    end
  end
end
