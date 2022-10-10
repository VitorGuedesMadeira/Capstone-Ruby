require_relative '../genre'
require_relative '../music_album'

describe Genre do
  before(:each) do
    @music_album = MusicAlbum.new(2022, true)
    @new_genre = Genre.new('rock')
    @new_genre.add_item(@music_album)
  end

  describe 'Genre#add_item method' do
    it 'The Genre class method should return 1' do
      expect(@music_album.items.length).to eql 1
    end
  end
end
