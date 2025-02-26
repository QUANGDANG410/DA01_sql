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
Ex.3:
WITH so_luong_cuoc_goi 
AS 
(SELECT policy_holder_id,
COUNT (case_id) AS count_case
FROM callers
GROUP BY policy_holder_id)

SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM so_luong_cuoc_goi
WHERE count_case>=3
Ex.4:
WITH loc_data AS
(SELECT p.page_id, p1.liked_date
FROM pages AS p 
LEFT JOIN page_likes AS p1
ON p.page_id=p1.page_id)
SELECT page_id
FROM loc_data
WHERE liked_date IS NULL 
ORDER by page_id
Ex.5:






































