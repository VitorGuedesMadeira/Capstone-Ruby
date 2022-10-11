CREATE TABLE sources(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE movies(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    silent BOOLEAN,
    sources_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_sources FOREIGN KEY(sources_id) REFERENCES sources(id)
);



-- ALTER TABLE movies ADD COLUMN sources_id INT; 
-- ALTER TABLE movies ADD CONSTRAINT fk_sources FOREIGN KEY(sources_id) REFERENCES sources(id);