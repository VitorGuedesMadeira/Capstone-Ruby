require 'json'
require_relative 'music_album'
require_relative 'genre'

class SaveFiles
  #write_MusicAlbums
  def self.write_music_albums(things)
    music_album_data_array = []
    things.each do |thing|
      if thing.instance_of?(MusicAlbum)
        music_album_data_array << {
          publish_date: thing.publish_date,
          id: thing.id,
          on_spotify: thing.on_spotify
        }
      end
    end
    File.write('./data/music_album.json', JSON.pretty_generate(music_album_data_array))
  end
  #read_MusicAlbums
  def self.read_music_albums
    array_music_albums = []
    return array_music_albums unless File.exist?('./data/music_album.json')

    music_album_file = File.open('./data/music_album.json')
    data = JSON.parse(music_album_file.read)
    data.each do |music_album|
      new_music_album = MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'])
      new_music_album.id = music_album['id']
      array_music_albums << new_music_album
    end
    music_album_file.close
    array_music_albums
  end

  #write_Books
  #read_Books

  #write_Movies
  #read_Movies

  #write_Games
  #read_Games

  #write_genres
  def self.write_genres(things)
    genres_data_array = []
    things.each do |thing|
      if thing.instance_of?(MusicAlbum)
        genres_data_array << {
          name: thing.genre.name,
          id: thing.genre.id
        }
      end
    end
    File.write('./data/genres.json', JSON.pretty_generate(genres_data_array))
  end
  #read_genres

  #write_authors
  #read_authors

  #write_sources
  #read_sources

  #write_labels
  #read_labels
end