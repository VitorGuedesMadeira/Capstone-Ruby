require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = SecureRandom.random_number(1000))
    @title = title
    @color = color
    @items = []
    @id = id
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def self.list_labels(things)
    labels = []
    things.each do |thing|
      labels << thing.label if thing.instance_of?(Book) && !labels.include?(thing.label.title)
    end
    labels.each_with_index do |label, index|
      puts "[#{index + 1}] (ID: #{label.id}) Label: #{label.title}"
    end
  end
end
