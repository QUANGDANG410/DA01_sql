--Ex.1
SELECT b.continent,
FLOOR(AVG(a.population))
FROM city AS a
JOIN country AS b
ON a.countrycode=b.code
GROUP BY b.continent
--Ex.2
SELECT 
ROUND(
SUM (CASE WHEN t.signup_action='Confirmed' then 1 ELSE 0 END)*1.0/
COUNT (t.signup_action),2) AS confirm_rate
FROM texts AS t 
LEFT JOIN emails AS e 
ON t.email_id=e.email_id
--Ex3:
SELECT 
  c.customer_id
FROM products AS p LEFT JOIN customer_contracts AS c 
ON p.product_id=c.product_id
GROUP BY c.customer_id
HAVING (COUNT(DISTINCT product_category))= (SELECT COUNT(DISTINCT (product_category)) FROM p)
--Ex.4:
SELECT
    ab.age_bucket,
  (  
  ROUND(
  SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) /
    SUM(CASE WHEN activity_type IN ('open', 'send') THEN time_spent ELSE 0 END)*100.0
    ,2)
  ) AS send_perc,
    
  ( 
  ROUND(
  SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) /
    SUM(CASE WHEN activity_type IN ('open', 'send') THEN time_spent ELSE 0 END)*100.0
    ,2)
  ) AS open_perc  
    FROM
      activities AS act
    INNER JOIN
      age_breakdown AS ab 
    ON act.user_id = ab.user_id
    GROUP BY
      ab.age_bucket
--Ex6: 
SELECT p.product_name  ,
    SUM(o.unit) AS unit
FROM Products AS p
JOIN Orders AS o
ON p.product_id =o.product_id 
WHERE order_date >= '2020-02-01'  AND order_date <= '2020-02-29'
GROUP BY p.product_name 
HAVING (SUM(o.unit)) >= 100
