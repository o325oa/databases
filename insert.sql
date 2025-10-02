-- Заполнение БД

INSERT INTO genres (name) VALUES
  ('Rock'),
  ('Pop'),
  ('Hip-Hop');


INSERT INTO artists (name) VALUES
  ('Adele'),
  ('Drake'),
  ('Imagine Dragons'),
  ('The Weeknd');

INSERT INTO artist_genre (artist_id, genre_id) VALUES
  (1, 2);

INSERT INTO artist_genre (artist_id, genre_id) VALUES
  (2, 3),
  (2, 2);

INSERT INTO artist_genre (artist_id, genre_id) VALUES
  (3, 1),
  (3, 2);

INSERT INTO artist_genre (artist_id, genre_id) VALUES
  (4, 2);

INSERT INTO albums (title, release_year) VALUES
  ('Evolve Deluxe', 2018),
  ('Scorpion', 2018),
  ('After Hours', 2020);

INSERT INTO album_artist (album_id, artist_id) VALUES
  (1, 3);

INSERT INTO album_artist (album_id, artist_id) VALUES
  (2, 2);

INSERT INTO album_artist (album_id, artist_id) VALUES
  (3, 4),
  (3, 1);

INSERT INTO tracks (album_id, title, duration) VALUES
  (1, 'Believer', 204),       
  (1, 'Thunder', 187),        
  (2, 'God''s Plan', 198),    
  (2, 'In My Feelings', 217), 
  (3, 'Blinding Lights', 200),
  (3, 'Save Your Tears', 215);

INSERT INTO tracks (album_id, title, duration) VALUES
  (3, 'My Longest Song', 420); 

INSERT INTO compilations (title, release_year) VALUES
  ('Pop Essentials 2018', 2018),
  ('Best of 2019', 2019),
  ('Chart Hits 2020', 2020),
  ('Rock & Pop Mix', 2017);

INSERT INTO compilation_track (compilation_id, track_id) VALUES
  (1, 1), 
  (1, 3); 

INSERT INTO compilation_track (compilation_id, track_id) VALUES
  (2, 2),  
  (2, 4); 

INSERT INTO compilation_track (compilation_id, track_id) VALUES
  (3, 5), 
  (3, 6),  
  (3, 7);  

INSERT INTO compilation_track (compilation_id, track_id) VALUES
  (4, 1),
  (4, 5); 