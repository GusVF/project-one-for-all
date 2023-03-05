SELECT COUNT(DISTINCT S.song_name) AS 'cancoes', 
COUNT(DISTINCT AR.artist_name) AS 'artistas',
COUNT(DISTINCT AL.album_name) AS 'albuns'
FROM songs AS S
INNER JOIN artist AS AR
ON S.artist_id = AR.id
INNER JOIN album AS AL
ON S.album_id = AL.id;
