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
