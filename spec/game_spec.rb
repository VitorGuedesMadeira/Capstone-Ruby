require_relative '../game'

describe Game do
  describe 'can_be_archived?' do
    it 'should return the true' do
      game = Game.new(2010, false, 2010)
      expect(game.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return the true' do
      game = Game.new(2020, false, 2020)
      expect(game.send(:can_be_archived?)).to be false
    end
  end
end