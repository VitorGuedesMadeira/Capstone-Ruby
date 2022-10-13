require_relative '../things/music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new(2010, true)
    @music_album.move_to_archive
  end

  describe 'MusicAlbum#can_be_archived? method' do
    it 'The MusicAlbum class method should return true' do
      expect(@music_album.archived).to be_truthy
    end
  end

  describe 'MusicAlbum#can_be_archived? method' do
    it 'The MusicAlbum class method should NOT return false' do
      expect(@music_album.archived).not_to be_falsey
    end
  end
end
