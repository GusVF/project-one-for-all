SELECT A.album_name AS 'album', COUNT(U.song_id) AS 'favoritadas'
FROM album AS A
INNER JOIN  songs AS S ON A.id = S.album_id
INNER JOIN user_favorite_songs AS U ON S.id = U.song_id
GROUP BY album 
ORDER BY favoritadas DESC
LIMIT 3;
