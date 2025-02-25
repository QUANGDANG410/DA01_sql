Ex.1:
WITH so_luong_job 
AS
(SELECT company_id, title, description,
COUNT (job_id) AS count_job
FROM job_listings
GROUP BY company_id, title, description)

SELECT COUNT(company_id) AS duplicate_companies
FROM so_luong_job
WHERE count_job>1
Ex.2:
WITH app AS
(SELECT category, product, 
SUM(spend) AS total_spend
FROM product_spend
WHERE category='appliance'
GROUP BY category, product
ORDER BY total_spend DESC
LIMIT 2),
elec AS
(SELECT category, product, 
SUM(spend) AS total_spend
FROM product_spend
WHERE category='electronics'
GROUP BY category, product
ORDER BY total_spend DESC
LIMIT 2)
SELECT * FROM app
UNION ALL
SELECT * FROM elec





































