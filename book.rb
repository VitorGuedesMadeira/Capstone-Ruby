require_relative 'item'
require_relative 'source'
require_relative 'author'
require_relative 'label'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(*args, publisher, cover_state)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    books.each_with_index do |book, index|
      if book.instance_of? Book
        puts "[#{index}] The Book: #{book.cover_state} by #{book.author.first_name} #{book.author.last_name} has been Published by #{book.publisher} on #{book.publish_date}"
      end
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

    print "\nType the color of the Book: "
    print "\nAnswer: "
    book_color = gets.chomp

    new_book = Book.new(book_date, cover_state, publisher)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_book)

    new_label = Label.new(cover_state, book_color)
    new_label.add_item(new_book)
    new_book
  end

  def can_be_archived?
    if (super || @cover_state == 'bad')
      return true
    else
      return false
    end
  end
end
