require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name, id = SecureRandom.random_number(1000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def self.list_authors(things)
    authors = []
    things.each do |thing|
      authors << thing.author if thing.instance_of?(Game) && !authors.include?(thing.author.first_name)
    end
    authors.each_with_index do |author, index|
      puts "[#{index + 1}] (ID: #{author.id}) Author: #{author.first_name} #{author.last_name}"
    end
  end
end
