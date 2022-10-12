require_relative '../author'
require_relative '../game'

describe Author do
  before(:each) do
    @author = Author.new('JK', 'Rowling')
  end

  describe 'author\'s first name' do
    it 'should return the correct name' do
      expect(@author.first_name).to eql 'JK'
    end
  end

  describe 'author\'s last name' do
    it 'should return the correct name' do
      expect(@author.last_name).to eql 'Rowling'
    end
  end

  describe 'add-item method' do
    it 'should return an array of movie objects' do
      game = Game.new(2020, true, 2020)
      @author.add_item(game)
      expect(@author.items).to include(game)
    end
  end
end