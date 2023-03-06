SELECT S.song_name AS 'cancao', COUNT(P.songs_id) AS 'reproducoes'
FROM songs AS S
INNER JOIN play_history AS P
ON  S.id = P.songs_id 
GROUP BY cancao 
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;