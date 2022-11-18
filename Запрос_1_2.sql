select 
round(SUM(group_year.summa)/(COUNT(*) *12),2) as "Средние траты в месяц"

from 

(select date_part('year', date) as year
,SUM(it.price) as summa
from purchases as pc


JOIN users as u ON pc.userid = u.userid
JOIN items as it ON it.itemid = pc.itemid

where u.age BETWEEN 26 and 35

GROUP BY date_part('year', date)) as group_year