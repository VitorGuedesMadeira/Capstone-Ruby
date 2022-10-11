require_relative '../movie'

describe Movie do
  describe 'can_be_archived?' do
    it 'should return the true' do
      movie = Movie.new(2010, false)
      expect(movie.send(:can_be_archived?)).to be true
    end
  end

  describe 'can_be_archived?' do
    it 'should return the true' do
      movie = Movie.new(2020, false)
      expect(movie.send(:can_be_archived?)).to be false
    end
  end
end
