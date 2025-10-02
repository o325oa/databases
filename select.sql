-- SELECT запросы к БД
-- Название и продолжительность самого длительного трека
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

-- Названия треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период 2018–2020 включительно
SELECT title
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT title
FROM tracks
WHERE
      title ILIKE 'my %'
   OR title ILIKE '% my'
   OR title ILIKE '% my %'
   OR title ILIKE 'my'
   OR title ILIKE 'мой %'
   OR title ILIKE '% мой'
   OR title ILIKE '% мой %'
   OR title ILIKE 'мой';

--Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM genres g
JOIN artist_genre ag ON ag.genre_id = g.genre_id
GROUP BY g.genre_id, g.name
ORDER BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS track_count_2019_2020
FROM tracks t
JOIN albums a ON a.album_id = t.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, AVG(t.duration)::NUMERIC(10,2) AS avg_duration_sec
FROM albums a
JOIN tracks t ON t.album_id = a.album_id
GROUP BY a.album_id, a.title
ORDER BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году

SELECT ar.name
FROM artists ar
WHERE NOT EXISTS (
  SELECT 1
  FROM album_artist aa
  JOIN albums a ON a.album_id = aa.album_id
  WHERE aa.artist_id = ar.artist_id
    AND a.release_year = 2020
)
ORDER BY ar.name;

-- Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c.title
FROM compilations c
JOIN compilation_track ct ON ct.compilation_id = c.compilation_id
JOIN tracks t ON t.track_id = ct.track_id
JOIN albums a ON a.album_id = t.album_id
JOIN album_artist aa ON aa.album_id = a.album_id
JOIN artists ar ON ar.artist_id = aa.artist_id
WHERE ar.name = 'The Weeknd'
ORDER BY c.title;
