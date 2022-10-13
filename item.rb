require 'securerandom'

class Item
  attr_reader :genre, :author, :source, :label, :publish_date, :archived, :id

  def initialize(publish_date)
    @id = SecureRandom.random_number(1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.new.year - publish_date > 10
  end
end
