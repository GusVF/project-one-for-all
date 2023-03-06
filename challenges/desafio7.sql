SELECT AR.artist_name AS 'artista', A.album_name AS 'album', COUNT(U.user_id) AS 'pessoas_seguidoras'
FROM artist AS AR
INNER JOIN album AS A
ON AR.id = A.artist_id
INNER JOIN user_favorite_artist AS U
ON A.artist_id = U.artist_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;