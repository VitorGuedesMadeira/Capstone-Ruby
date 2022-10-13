require 'securerandom'

class Label
  attr_accessor :id
  attr_reader :title, :items, :color

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
    labels_titles = []
    things.each do |thing|
      labels_titles << thing.label.title if thing.instance_of?(Book) && !labels_titles.include?(thing.label.title)
    end
    labels_titles.each_with_index do |title, index|
      puts "[#{index + 1}] Label: #{title}"
    end
  end
end
