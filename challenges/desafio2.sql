SELECT 
(SELECT COUNT(*) FROM songs) AS 'cancoes',
(SELECT COUNT(*) FROM artist) As 'artistas',
(SELECT COUNT(*) FROM album) AS 'albuns';