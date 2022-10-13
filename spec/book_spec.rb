require_relative '../things/book'

describe Book do
  describe 'can_be_archived?' do
    it 'should return true' do
      book = Book.new('The Lord of the Rings', 'William Morrow', 1954)
      expect(book.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return false' do
      book = Book.new('good', 'William Morrow', 2020)
      expect(book.send(:can_be_archived?)).to be false
    end
  end
end
