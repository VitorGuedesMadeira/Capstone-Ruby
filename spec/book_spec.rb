require_relative '../book'

describe Book do
  describe 'can_be_archived?' do
    it 'should return true' do
      book = Book.new(1954, 'The Lord of the Rings', 'William Morrow')
      expect(book.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return false' do
      book = Book.new(1954, 'bad', 'William Morrow')
      expect(book.send(:can_be_archived?)).to be true
    end
  end
end
