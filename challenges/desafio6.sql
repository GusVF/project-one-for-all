SELECT MIN(plan_price) AS 'faturamento_minimo', 
MAX(plan_price) AS 'faturamento_maximo',
ROUND(AVG(plan_price),2)AS 'faturamento_medio',
SUM(plan_price) AS 'faturamento_total'
FROM plan AS P
INNER JOIN user AS U
ON P.id = U.plan_id;