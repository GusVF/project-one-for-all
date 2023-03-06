SELECT 
  CASE 
    WHEN user_age <= 30 THEN 'Até 30 anos'
    WHEN user_age >= 31 AND user_age <= 60 THEN 'Entre 31 e 60 anos'
    WHEN user_age > 60 THEN 'Maior de 60 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT USR.id) AS total_pessoas_usuarias,
  COUNT( FAV.song_id) AS total_favoritadas
FROM user AS USR
LEFT JOIN user_favorite_songs AS FAV ON USR.id = FAV.user_id
LEFT JOIN songs AS S ON FAV.song_id = S.id
GROUP BY 
  CASE 
    WHEN user_age <= 30 THEN 'Até 30 anos'
    WHEN user_age >= 31 AND user_age <= 60 THEN 'Entre 31 e 60 anos'
    WHEN user_age > 60 THEN 'Maior de 60 anos'
  END;
