--Ex.1
SELECT
SUM(CASE
    WHEN device_type='laptop' then 1 
    ELSE 0
END) AS laptop_views,
SUM(CASE
    WHEN device_type='tablet' then 1 
    WHEN device_type='phone' then 1
    ELSE 0
END) AS mobile_views
FROM viewership
--Ex.2
SELECT *, 
CASE 
    WHEN x+y>z AND x+z>y AND y+z>x then 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle
-- EX.3
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id=1
-- Ex.4
SELECT 
ROUND (100.00* SUM(CASE
    WHEN call_category IS NULL THEN 1
    WHEN call_category ='n/a' THEN 1
    ELSE 0
END) / COUNT (*),1) AS uncategorised_call_pct
FROM callers
-- Ex.5
SELECT survived,
SUM(CASE
    WHEN pclass =1 THEN 1
END) AS "first_class",
SUM(CASE
    WHEN pclass =2 THEN 1
END) AS "second_classs",
SUM(CASE
    WHEN pclass =3 THEN 1
END) AS "third_class"
FROM titanic
GROUP BY survived
