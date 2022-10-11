class Author
  attr_reader :first_name, :last_name
  def initialize(first_name, last_name, id=rand(1..1000))
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def self.list_authors(things)
    authors = []
    things.each do |thing|
      authors << [thing.author.first_name, thing.author.last_name] unless authors.include?([thing.author.first_name, thing.author.last_name])
    end
    authors.each_with_index do |author, index|
      puts "[#{index}] Author: #{author[0]} #{author[1]}"
    end
  end

end