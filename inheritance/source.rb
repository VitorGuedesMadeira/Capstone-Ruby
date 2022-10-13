require 'securerandom'

class Source
  attr_accessor :id
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
    @id = SecureRandom.random_number(1000)
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  def self.list_sources(things)
    sources_names = []
    things.each do |thing|
      sources_names << thing.source.name if thing.instance_of?(Movie) && !sources_names.include?(thing.source.name)
    end
    sources_names.each_with_index do |name, index|
      puts "[#{index + 1}] Source: #{name}"
    end
  end
end
