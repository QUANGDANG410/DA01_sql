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
WITH 
user_thang_6 AS
(SELECT 
  user_id, event_date
FROM user_actions
WHERE event_date BETWEEN '06/01/2022' AND '06/30/2022'),

user_thang_7 AS
(SELECT 
  user_id, event_date
FROM user_actions
WHERE event_date BETWEEN '07/01/2022' AND '07/31/2022'),

tong_hop AS 
(SELECT
user_thang_7.user_id, 
user_thang_7.event_date
FROM user_thang_7 
JOIN user_thang_6 ON user_thang_7.user_id=user_thang_6.user_id)

SELECT
EXTRACT (month from event_date) AS mth ,
COUNT (DISTINCT user_id) AS monthly_active_users
FROM tong_hop 
GROUP BY EXTRACT (month from event_date)





































