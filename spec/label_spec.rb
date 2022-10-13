require_relative '../inheritance/label'
require_relative '../things/book'

describe Book do
  before(:each) do
    @new_book = Book.new(1954, 'The Lord of the Rings', 'William Morrow')
    @new_label = Label.new('The Lord of the Rings', 'Brown')
    @new_label.add_item(@new_book)
  end

  describe 'Booke#add_item method' do
    it 'The Label class method should return 1' do
      expect(@new_label.items.length).to eql 1
    end
  end

  describe 'Labele#add_item method' do
    it 'The Label class method should NOT return 2' do
      expect(@new_label.items.length).not_to eql 2
    end
  end

  describe 'Label#name getter' do
    it 'The Label class getter should return "The Lord of the Rings"' do
      expect(@new_label.title).to eql 'The Lord of the Rings'
    end
  end
end
