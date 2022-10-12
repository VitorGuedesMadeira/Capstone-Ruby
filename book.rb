require_relative 'item'
require_relative 'source'
require_relative 'author'

class Book < Item
  attr_accessor :cover_state
  attr_accessor :publisher

  def initialize(*args, publisher, cover_state)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end
  
  def self.list_books(books)
    books.each_with_index do |books, index|
      puts "[#{index}] The Book: #{books.cover_state} by #{books.author.first_name} #{books.author.last_name} has been Published by #{books.publisher} on #{books.publish_date}" if books.instance_of? Book
    end
  end

  def self.add_book
    
    print 'Author\'s first name?'
    print "\nAnswer: "
    author_first_name = gets.chomp

    print 'Author\'s last name?'
    print "\nAnswer: "
    author_last_name = gets.chomp

    print "\nType a Cover State of the Book: "
    cover_state = gets.chomp
    print "\nType the Name of the publisher: "
    publisher = gets.chomp

    print "\nType a publish date [year]: "
    print "\nAnswer: "
    book_date = gets.chomp.to_i
   
    new_book = Book.new(book_date, cover_state, publisher)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_book)

    new_book
  end

  def can_be_archived?
    super || @cover_state==="bad"
    false
  end
end
