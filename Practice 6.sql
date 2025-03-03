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

Ex.6: 
-- Tính số lượng giao dịch approved và tổng số tiền, nhóm theo tháng
WITH approve AS
(SELECT 
    TO_CHAR(trans_date,'YYYY-MM') AS month,
    country,
    SUM (amount) AS approved_total_amount,
    COUNT (id) AS approved_count
FROM transactions
WHERE state='approved'
GROUP BY TO_CHAR(trans_date,'YYYY-MM'), country),

-- Tính số lượng giao dịch và tổng số tiền , nhóm theo tháng
trans AS
(SELECT 
    TO_CHAR(trans_date,'YYYY-MM') AS month,
    country,
    SUM (amount) AS trans_total_amount,
    COUNT (id) AS trans_count
FROM transactions
GROUP BY TO_CHAR(trans_date,'YYYY-MM'), country)

SELECT 
    trans.month,
    trans.country,
    trans.trans_count,
    approve.approved_count,
    trans.trans_total_amount,
    approve.approved_total_amount
FROM approve
JOIN trans ON approve.month=trans.month
WHERE trans.month=approve.month
AND trans.country=approve.country
ORDER BY trans.month

Ex.7:
SELECT 
    product_id, year AS first_year, quantity, price
FROM sales
WHERE year IN (SELECT MIN(year) FROM sales GROUP BY product_id)
GROUP BY product_id, quantity, price, year

Ex.8:
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(customer_id)= (SELECT COUNT(product_key) FROM product)

Ex.9: 
SELECT 
    employee_id
FROM employees
WHERE salary<30000
AND manager_id = (SELECT
    manager_id
FROM employees
WHERE manager_id NOT IN (SELECT employee_id FROM employees))

Ex.10:
WITH so_luong_job 
AS
(SELECT company_id, title, description,
COUNT (job_id) AS count_job
FROM job_listings
GROUP BY company_id, title, description)

SELECT COUNT(company_id) AS duplicate_companies
FROM so_luong_job
WHERE count_job>1

Ex.11:
-- Tìm tên của user_id có số lượng film đã rate nhiều nhất
WITH cte_max AS
(SELECT 
    name AS results
FROM (SELECT 
    Users.name,
    COUNT (rating) AS count_rating
FROM Users JOIN MovieRating ON Users.user_id = MovieRating.user_id
GROUP BY Users.name)
WHERE count_rating= (SELECT MAX(count_rating) FROM (SELECT 
    Users.name,
    COUNT (rating) AS count_rating
FROM Users JOIN MovieRating ON Users.user_id = MovieRating.user_id
GROUP BY Users.name))
ORDER BY results
LIMIT 1),

-- Tìm tên phim có trung bình rating lớn nhất
cte_avg AS
(SELECT 
    title AS results
FROM (SELECT 
    Movies.title,
    AVG(rating) AS avg_rating
FROM Movies JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28' 
GROUP BY Movies.title)
WHERE avg_rating = (SELECT MAX(avg_rating) FROM (SELECT 
    Movies.title,
    AVG(rating) AS avg_rating
FROM Movies JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28' 
GROUP BY Movies.title))
ORDER BY results
LIMIT 1)

SELECT results FROM cte_max
UNION
SELECT results FROM cte_avg

Ex.12:
WITH cte1 AS
(SELECT requester_id AS id FROM RequestAccepted),
cte2 AS 
(SELECT accepter_id AS id FROM RequestAccepted)

SELECT id,
    COUNT (id) AS num
FROM (SELECT id FROM cte1
UNION ALL 
SELECT id FROM cte2)
GROUP BY id
ORDER BY num DESC
LIMIT 1































