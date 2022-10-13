require_relative '../item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(*args, cover_state, publisher)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_books(books)
    index = 1
    books.each do |book|
      if book.instance_of? Book
        puts "\n[#{index}] The book: #{book.label.title} by #{book.author.first_name} #{book.author.last_name} has been published by #{book.publisher} on #{book.publish_date}"
        index += 1
      end
    end
  end

  def self.add_book
    print 'Enter Title of the Book: '
    label_title = gets.chomp
    print 'Type the color of the Book: '
    label_color = gets.chomp
    print 'Author\'s first name: '
    author_first_name = gets.chomp
    print 'Author\'s last name: '
    author_last_name = gets.chomp
    print 'Enter the book\'s genre: '
    genre_name = gets.chomp
    print 'Enter the source of this book: '
    source_name = gets.chomp
    # item inputs
    print "\nWhat's the name of the publisher?"
    print "\nAnswer: "
    publisher = gets.chomp
    print 'What\s the publishing date? [year]'
    print "\nAnswer: "
    book_date = gets.chomp.to_i
    print "What's the cover state of the book? [good/bad] "
    cover_state = gets.chomp.downcase

    new_book = Book.new(book_date, cover_state, publisher)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_book)

    new_label = Label.new(label_title, label_color)
    new_label.add_item(new_book)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_book)

    new_source = Source.new(source_name)
    new_source.add_item(new_book)

    new_book
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
