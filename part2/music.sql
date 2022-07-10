-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artists_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums,
  producers_id INTEGER REFERENCES producers
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, artists_id, album_id, producers_id)
VALUES
  ('MMMBop', 238, 1, 1, {1, 2}),
  ('Bohemian Rhapsody', 355, 2, 2, 3),
  ('One Sweet Day', 282, {3, 4}, 3, 4),
  ('Shallow', 216, {5, 6}, 4, 5),
  ('How You Remind Me', 223, 7, 5, 6),
  ('New York State of Mind', 276, {8, 9}, 6, 7),
  ('Dark Horse', 215, {10, 11}, 7, {8, 9}),
  ('Moves Like Jagger', 201, {12, 13}, 8, {10, 11}),
  ('Complicated', 244, 14, 9, 12),
  ('Say My Name', 240, 15, 10, 13);

INSERT INTO artists
  (name)
VALUES
  ("Hanson"),
  ("Queen"),
  ("Mariah Cary"),
  ("Boyz II Men"),
  ("Lady Gaga"), 
  ("Bradley Cooper"),
  ("Nickelback"),
  ("Jay Z"),
  ("Alicia Keys"),
  ("Katy Perry"), 
  ("Juicy J"),
  ("Maroon 5"), 
  ("Christina Aguilera"),
  ("Avril Lavigne"),
  ("Destiny''s Child");

INSERT INTO albums
  (name, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star Is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO producers
  (name)
VALUES
  ("Dust Brothers"), 
  ("Stephen Lironi"),
  ("Roy Thomas Baker"),
  ("Walter Afanasieff"),
  ("Benjamin Rice"),
  ("Rick Parashar"),
  ("Al Shux"),
  ("Max Martin"), 
  ("Cirkut"),
  ("Shellback"), 
  ("Benny Blanco"),
  ("The Matrix"),
  ("Darkchild");












