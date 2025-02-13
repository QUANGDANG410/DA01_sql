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
