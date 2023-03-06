SELECT COUNT(P.user_id) AS 'musicas_no_historico'
FROM play_history AS P
INNER JOIN user AS U
ON P.user_id = U.id
WHERE U.user_name LIKE '%Barb%';