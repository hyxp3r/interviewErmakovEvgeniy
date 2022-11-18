SELECT 
round(SUM(group_year.summa)/(COUNT(*) *12),2) as "Средние траты в месяц"

FROM 

(SELECT date_part('year', date) as year
,SUM(it.price) AS summa
FROM purchases AS pc


JOIN users AS u ON pc.userid = u.userid
JOIN items AS it ON it.itemid = pc.itemid

WHERE u.age BETWEEN 18 AND 25

GROUP BY date_part('year', DATE)) AS group_year