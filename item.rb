class Item
  attr_reader :genre, :author, :source, :label, :publish_date
  def initialize(id = rand(1..1000), publish_date)
    @id = id
    @genre
    @author
    @source
    @label
    @publish_date = publish_date
    @archived = false
  end

  def set_genre(genre)
    @genre = genre
  end

  def set_author(author)
    @author = author
  end

  def set_source(source)
    @source = source
  end

  def set_label(label)
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


test = Item.new(2010)
test.move_to_archive
p test