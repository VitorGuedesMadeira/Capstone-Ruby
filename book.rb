require_relative 'item'
require_relative 'source'
require_relative 'author'
require_relative 'label'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(*args, cover_state, publisher)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    books.each_with_index do |book, index|
      if book.instance_of? Book
        puts "[#{index}] The Book: #{book.label.title} by #{book.author.first_name} #{book.author.last_name} has been Published by #{book.publisher} on #{book.publish_date}"
      end
    end
  end

  def self.add_book
    print 'Enter Title of the Book: '
    book_title = gets.chomp
    print 'Author\'s first name?: '
    author_first_name = gets.chomp
    print 'Author\'s last name?: '
    author_last_name = gets.chomp
    print "\nType the Name of the publisher: "
    publisher = gets.chomp
    print 'Type publishing date [year]: '
    book_date = gets.chomp.to_i
    print "\nType a Cover State of the Book [good/bad]: "
    cover_state = gets.chomp.downcase
    print "\nType the color of the Book: "
    book_color = gets.chomp

    new_book = Book.new(book_date, cover_state, publisher)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_book)

    new_label = Label.new(book_title, book_color)
    new_label.add_item(new_book)
    new_book
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
