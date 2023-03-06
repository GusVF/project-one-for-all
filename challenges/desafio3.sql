SELECT U.user_name AS 'pessoa_usuaria',
COUNT(P.songs_id) AS 'musicas_ouvidas',
 ROUND(SUM(length)/60,2) AS 'total_minutos'
FROM user AS U
INNER JOIN play_history AS P
ON U.id = P.user_id
INNER JOIN songs AS S
ON S.id = P.songs_id
GROUP BY U.user_name 
ORDER BY U.user_name;
