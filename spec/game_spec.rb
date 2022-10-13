require_relative '../things/game'

describe Game do
  describe 'can_be_archived?' do
    it 'should return true' do
      game = Game.new(false, 2010, 2010)
      expect(game.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return false' do
      game = Game.new(false, 2020, 2020)
      expect(game.send(:can_be_archived?)).to be false
    end
  end
end
