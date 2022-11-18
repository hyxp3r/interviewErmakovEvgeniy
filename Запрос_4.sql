SELECT  

it.itemid as "Товар"
,SUM(it.price)/(
    SELECT  
    SUM(it.price)

    FROM items  as it 

    JOIN purchases as pc ON pc.itemid = it.itemid

    WHERE date_part('year', date) = (SELECT MAX(date_part('year', DATE)) FROM purchases )) as "Доля"

FROM items  as it 

JOIN purchases as pc ON pc.itemid = it.itemid

WHERE date_part('year', date) = (SELECT MAX(date_part('year', DATE)) FROM purchases )

GROUP by it.itemid
ORDER BY SUM(it.price) desc
LIMIT 3;




