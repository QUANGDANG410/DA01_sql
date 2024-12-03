--DAY 5
--Ex1
select distinct city from station
where ID%2=0
--Ex2
select count(CITY) - count(distinct CITY) from station
--Ex4:
SELECT 
ROUND (CAST(SUM (order_occurrences*	item_count)/ SUM (order_occurrences) AS DECIMAL),1) as mean
FROM items_per_order
--Ex5
SELECT candidate_id
FROM candidates
WHERE skill IN('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill)=3;
--Ex6:
SELECT user_id,
DATE(max(post_date))-DATE(min(post_date)) as days_between
FROM posts
WHERE post_date>='2021-01-01' AND post_date<'2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id)>=2
--Ex7
SELECT card_name,
max(issued_amount) - min(issued_amount)
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY (max(issued_amount) - min(issued_amount)) DESC
--Ex8
SELECT manufacturer,
COUNT (drug) as number_of_drugs,
ABS(SUM(cogs-total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
--Ex9
select *from Cinema
where id%2=1 and description not like 'boring'
order by rating desc
--Ex10
select teacher_id,
count (distinct subject_id) as cnt
from teacher
group by teacher_id
--Ex11
select user_id,
count(follower_id) as followers_count
from followers
group by user_id
order by user_id
--Ex12
select class 
from courses
group by class
having count(student)>=5
