SELECT DISTINCT user_name AS 'pessoa_usuaria',
 MIN(IF(YEAR(play_date) >= 2021, 'Ativa', 'Inativa')) AS 'status_pessoa_usuaria'
FROM user AS U
INNER JOIN  play_history AS P
ON U.id = P.user_id
GROUP BY U.user_name
ORDER BY  U.user_name;