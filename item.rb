class Item
  attr_reader :genre, :author, :source, :label, :publish_date, :archived, :id

  def initialize(publish_date, id = rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.new.year - publish_date > 10
  end
end
