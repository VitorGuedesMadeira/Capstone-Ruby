require 'securerandom'

class Author
  attr_accessor :id
  attr_reader :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = SecureRandom.random_number(1000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def self.list_authors(things)
    authors = []
    things.each do |thing|
      next unless thing.instance_of?(Game) && !authors.include?([thing.author.first_name,
                                                                 thing.author.last_name])

      authors << [thing.author.first_name,
                  thing.author.last_name]
    end
    authors.each_with_index do |author, index|
      puts "[#{index+1}] Author: #{author[0]} #{author[1]}"
    end
  end
end
