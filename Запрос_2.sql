SELECT 

CASE 
	WHEN max_month.month = 1 THEN 'Январь'
	WHEN max_month.month = 2 THEN 'Феврвль'
	WHEN max_month.month = 3 THEN 'Март'
	WHEN max_month.month = 4 THEN 'Апрель'
	WHEN max_month.month = 5 THEN 'Май'
	WHEN max_month.month = 6 THEN 'Июнь'
	WHEN max_month.month = 7 THEN 'Июль'
	WHEN max_month.month = 8 THEN 'Август'
	WHEN max_month.month = 9 THEN 'Сентябрь'
	WHEN max_month.month = 10 THEN 'Октябрь'
	WHEN max_month.month = 11 THEN 'Ноябрь'
	ELSE 'Декабрь' END AS "Месяц"
    
FROM (
            SELECT date_part('month', DATE) AS month
            ,SUM(it.price) AS summa
            FROM purchASes AS p

            JOIN users AS u ON p.userid = u.userid
            JOIN items AS it ON it.itemid = p.itemid

            where u.age >= 35

            GROUP BY month )AS max_month

where max_month.summa = (
                        SELECT MAX(max_month.summa) FROM (SELECT date_part('month', date) AS month
                        ,SUM(it.price) AS summa
                        FROM purchASes AS p

                        JOIN users AS u ON p.userid = u.userid
                        JOIN items AS it ON it.itemid = p.itemid

                        where u.age >= 35

                        GROUP BY month )AS max_month )