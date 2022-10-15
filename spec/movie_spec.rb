require_relative '../things/movie'

describe Movie do
  describe 'can_be_archived?' do
    it 'should return true' do
      movie = Movie.new(false, 2010)
      expect(movie.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return false' do
      movie = Movie.new(false, 2020)
      expect(movie.send(:can_be_archived?)).to be false
    end
  end
end
