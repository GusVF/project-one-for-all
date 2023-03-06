SELECT AR.artist_name AS 'artista', A.album_name AS 'album'
FROM artist AS AR
INNER JOIN album AS A
ON AR.id = A.artist_id
WHERE AR.artist_name LIKE '%Elis%';