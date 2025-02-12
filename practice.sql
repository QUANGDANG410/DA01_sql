--Ex.1
SELECT b.continent,
FLOOR(AVG(a.population))
FROM city AS a
JOIN country AS b
ON a.countrycode=b.code
GROUP BY b.continent
--Ex.2
