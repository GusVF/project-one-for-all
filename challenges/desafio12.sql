SELECT AR.artist_name AS 'artista', 
CASE 
   WHEN COUNT(FAV.song_id) >= 5 THEN 'A'
   WHEN COUNT(FAV.song_id) >= 3 AND COUNT(FAV.song_id) <= 4 THEN 'B'
   WHEN COUNT(FAV.song_id) >= 1 AND COUNT(FAV.song_id) <= 2 THEN 'C'
   ELSE '-'
 END AS 'ranking'
FROM artist AS AR 
LEFT JOIN album AS AL ON AR.id = AL.artist_id
LEFT JOIN songs AS S ON AL.id = S.album_id
LEFT JOIN user_favorite_songs AS FAV ON S.id = FAV.song_id
LEFT JOIN user as USR ON FAV.user_id = USR.id
GROUP BY AR.id
ORDER BY  COUNT(FAV.song_id) DESC, artista;