require 'json'
require_relative '../inheritance/genre'
require_relative '../inheritance/author'
require_relative '../inheritance/label'
require_relative '../inheritance/source'

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
        label: {
          title: thing.label.title,
          id: thing.label.id,
          color: thing.label.color
        },
        author: {
          first_name: thing.author.first_name,
          last_name: thing.author.last_name,
          id: thing.author.id
        },
        genre: {
          name: thing.genre.name,
          id: thing.genre.id
        },
        source: {
          name: thing.source.name,
          id: thing.source.id
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
      new_music_album = MusicAlbum.new(music_album['publish_date'], music_album['on_spotify'], music_album['id'])
      # genre
      new_genre = Genre.new(music_album['genre']['name'], music_album['genre']['id'])
      new_genre.add_item(new_music_album)
      # source
      new_source = Source.new(music_album['source']['name'], music_album['source']['id'])
      new_source.add_item(new_music_album)
      # label
      new_label = Label.new(music_album['label']['title'], music_album['label']['color'], music_album['label']['id'])
      new_label.add_item(new_music_album)
      # author
      new_author = Author.new(music_album['author']['first_name'], music_album['author']['last_name'], music_album['author']['id'])
      new_author.add_item(new_music_album)
      # returning
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
        label: {
          title: thing.label.title,
          id: thing.label.id,
          color: thing.label.color
        },
        author: {
          first_name: thing.author.first_name,
          last_name: thing.author.last_name,
          id: thing.author.id
        },
        genre: {
          name: thing.genre.name,
          id: thing.genre.id
        },
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
      new_movie = Movie.new(movie['publish_date'], movie['silent'], movie['id'])
      # source
      new_source = Source.new(movie['source']['name'], movie['source']['id'])
      new_source.add_item(new_movie)
      # label
      new_label = Label.new(movie['label']['title'], movie['label']['color'], movie['label']['id'])
      new_label.add_item(new_movie)
      # author
      new_author = Author.new(movie['author']['first_name'], movie['author']['last_name'], movie['author']['id'])
      new_author.add_item(new_movie)
      # genre
      new_genre = Genre.new(movie['genre']['name'], movie['genre']['id'])
      new_genre.add_item(new_movie)
      # returning
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
        label: {
          title: thing.label.title,
          id: thing.label.id,
          color: thing.label.color
        },
        author: {
          first_name: thing.author.first_name,
          last_name: thing.author.last_name,
          id: thing.author.id
        },
        genre: {
          name: thing.genre.name,
          id: thing.genre.id
        },
        source: {
          name: thing.source.name,
          id: thing.source.id
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
      new_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'], game['id'])
      # author
      new_author = Author.new(game['author']['first_name'], game['author']['last_name'], game['author']['id'])
      new_author.add_item(new_game)
      # label
      new_label = Label.new(game['label']['title'], game['label']['color'], game['label']['id'])
      new_label.add_item(new_game)
      # genre
      new_genre = Genre.new(game['genre']['name'], game['genre']['id'])
      new_genre.add_item(new_game)
      # source
      new_source = Source.new(game['source']['name'], game['source']['id'])
      new_source.add_item(new_game)
      # returning
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
        id: thing.id,
        label: {
          title: thing.label.title,
          id: thing.label.id,
          color: thing.label.color
        },
        author: {
          first_name: thing.author.first_name,
          last_name: thing.author.last_name,
          id: thing.author.id
        },
        genre: {
          name: thing.genre.name,
          id: thing.genre.id
        },
        source: {
          name: thing.source.name,
          id: thing.source.id
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
      new_book = Book.new(book['publish_date'], book['cover_state'], book['publisher'], book['id'])
      # label
      new_label = Label.new(book['label']['title'], book['label']['color'], book['label']['id'])
      new_label.add_item(new_book)
      # author
      new_author = Author.new(book['author']['first_name'], book['author']['last_name'], book['author']['id'])
      new_author.add_item(new_book)
      # genre
      new_genre = Genre.new(book['genre']['name'], book['genre']['id'])
      new_genre.add_item(new_book)
      # source
      new_source = Source.new(book['source']['name'], book['source']['id'])
      new_source.add_item(new_book)
      # returning
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
