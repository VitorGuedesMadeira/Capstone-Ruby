-- sources
CREATE TABLE sources(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);
-- movies
CREATE TABLE movies(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    silent BOOLEAN,
    sources_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_sources FOREIGN KEY(sources_id) REFERENCES sources(id)
);
-- genres
CREATE TABLE genres(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);
-- music albums
CREATE TABLE music_albums(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genres_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_genres FOREIGN KEY(genres_id) REFERENCES genres(id)
);
-- authors
CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY(id)
);
-- games
CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE NOT NULL,
    games_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_authors FOREIGN KEY(games_id) REFERENCES authors(id)
);
-- labels
CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(id)
);
-- books
CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    cover_state VARCHAR(150),
    publisher VARCHAR(150),
    book_color VARCHAR(50),
    books_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_labels FOREIGN KEY(books_id) REFERENCES labels(id)
);
-- generating indexes for performance
CREATE INDEX movie_source_idx ON movies(sources_id);
CREATE INDEX music_genre_idx ON music_albums(genres_id);
CREATE INDEX game_author_idx ON games(authors_id);
CREATE INDEX book_label_idx ON books(labels_id);