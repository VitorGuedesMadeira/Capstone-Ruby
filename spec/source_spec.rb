require_relative '../inheritance/source'
require_relative '../things/movie'

describe Source do
  before(:each) do
    @source = Source.new('Online')
  end

  describe 'source name' do
    it 'should return the correct name' do
      expect(@source.name).to eql 'Online'
    end
  end

  describe 'add-item method' do
    it 'should return an array of movie objects' do
      movie = Movie.new(2020, true)
      @source.add_item(movie)
      expect(@source.items).to include(movie)
    end
  end
end
