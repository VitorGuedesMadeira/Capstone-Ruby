require_relative '../inheritance/genre'
require_relative '../things/music_album'

describe Genre do
  before(:each) do
    @music_album = MusicAlbum.new(2022, true)
    @new_genre = Genre.new('rock')
    @new_genre.add_item(@music_album)
  end

  describe 'Genre#add_item method' do
    it 'The Genre class method should return 1' do
      expect(@new_genre.items.length).to eql 1
    end
  end

  describe 'Genre#add_item method' do
    it 'The Genre class method should NOT return 2' do
      expect(@new_genre.items.length).not_to eql 2
    end
  end

  describe 'Genre#name getter' do
    it 'The Genre class getter should return "rock"' do
      expect(@new_genre.name).to eql 'rock'
    end
  end
end
