require 'json'
require_relative 'music_album'
require_relative 'genre'
require_relative 'source'
require_relative 'movie'
require_relative 'book'
require_relative 'label'

class SaveFiles
  # write_MusicAlbums
  def self.write_music_albums(things)
    music_album_data_array = []
    things.each do |thing|
      next unless thing.instance_of?(MusicAlbum)

      music_album_data_array << {
        publish_date: thing.publish_date,
        id: thing.id,
        on_spotify: thing.on_spotify,
        genre: {
          name: thing.genre.name,
          id: thing.genre.id
        }
      }
    end
    File.write('./data/music_album.json', JSON.pretty_generate(music_album_data_array))
  end

  # read_MusicAlbums and Genres
  def self.read_music_albums
    array_music_albums = []
    return array_music_albums unless File.exist?('./data/music_album.json')

    music_album_file = File.open('./data/music_album.json')
    data = JSON.parse(music_album_file.read)
    data.each do |music_album|
      new_music_album = MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'])
      new_music_album.id = music_album['id']
      new_genre = Genre.new(music_album['genre']['name'])
      new_genre.id = music_album['genre']['id']
      new_genre.add_item(new_music_album)
      array_music_albums << new_music_album
    end
    music_album_file.close
    array_music_albums
  end

  # write_Books
  # read_Books

  # write_Movies
  def self.write_movies(things)
    movies_data_array = []
    things.each do |thing|
      next unless thing.instance_of?(Movie)

      movies_data_array << {
        publish_date: thing.publish_date,
        id: thing.id,
        silent: thing.silent,
        source: {
          name: thing.source.name,
          id: thing.source.id
        }
      }
    end
    File.write('./data/movies.json', JSON.pretty_generate(movies_data_array))
  end

  # read_movies
  def self.read_movies
    array_movies = []
    return array_movies unless File.exist?('./data/movies.json')

    movies_file = File.open('./data/movies.json')
    data = JSON.parse(movies_file.read)
    data.each do |movie|
      new_movie = Movie.new(movie['publish_date'], movie['silent'])
      new_movie.id = movie['id']
      new_source = Source.new(movie['source']['name'])
      new_source.id = movie['source']['id']
      new_source.add_item(new_movie)
      array_movies << new_movie
    end
    movies_file.close
    array_movies
  end

  # write_Games
  def self.write_games(things)
    games_data_array = []
    things.each do |thing|
      next unless thing.instance_of?(Game)

      games_data_array << {
        publish_date: thing.publish_date,
        id: thing.id,
        multiplayer: thing.multiplayer,
        last_played_at: thing.last_played_at,
        author: {
          first_name: thing.author.first_name,
          last_name: thing.author.last_name,
          id: thing.author.id
        }
      }
    end
    File.write('./data/games.json', JSON.pretty_generate(games_data_array))
  end

  # read_Games13
  def self.read_games
    array_games = []
    return array_games unless File.exist?('./data/games.json')

    games_file = File.open('./data/games.json')
    data = JSON.parse(games_file.read)
    data.each do |game|
      new_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
      new_game.id = game['id']
      new_author = Author.new(game['author']['first_name'], game['author']['last_name'])
      new_author.id = game['author']['id']
      new_author.add_item(new_game)
      array_games << new_game
    end
    games_file.close
    array_games
  end

  # write_Books
  def self.write_books(things)
    books_data_array = []
    things.each do |thing|
      next unless thing.instance_of?(Book)

      books_data_array << {
        publish_date: thing.publish_date,
        cover_state: thing.cover_state,
        publisher: thing.publisher,
        label: {
          id: thing.id,
          color: thing.label.color
        },
        author: {
          first_name: thing.author.first_name,
          last_name: thing.author.last_name,
          id: thing.author.id
        }
      }
    end
    File.write('./data/books.json', JSON.pretty_generate(books_data_array))
  end

    # read_Books
    def self.read_books
      array_books = []
      return array_books unless File.exist?('./data/books.json')
  
      books_file = File.open('./data/books.json')
      data = JSON.parse(books_file.read)
      data.each do |book|
        new_book = Book.new(book['publish_date'], book['cover_state'], book['publisher'])
        new_label = Label.new(book['cover_state'], book['label']['book_color'])
        new_label.id=book['label']['id']
        new_author = Author.new(book['author']['first_name'], book['author']['last_name'])
        new_author.id = book['author']['id']
        new_author.add_item(new_book)
        new_label.add_item(new_book)
        array_books << new_book
      end
      books_file.close
      array_books
    end

  # read ALL files
  def self.read_files
    things = []
    things.concat read_music_albums
    things.concat read_movies
    things.concat read_games
    things.concat read_books
    things
  end

  def self.write_things(things)
    write_movies(things)
    write_music_albums(things)
    write_games(things)
    write_books(things)
  end
end
