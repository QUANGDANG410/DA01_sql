-- Ex.1:
select name
from students
where marks>75
order by right(name,3), ID
-- Ex.2:
select 
user_id,
concat(upper (left(name,1)), lower (right(name, length(name)-1))) as name
from Users
order by user_id
-- Ex.3
select manufacturer,
'$' || round(sum (total_sales)/1000000,0) ||' '|| 'million' as sale 
from pharmacy_sales
group by manufacturer
order by sum(total_sales)/1000000 desc , manufacturer
-- Ex.4
SELECT
product_id,
round(avg (stars),2) as avg_stars,
extract (month from submit_date) as mth 
from reviews
group by product_id,
extract (month from submit_date) 
order by extract (month from submit_date), product_id
-- Ex.5:
select sender_id,
count (message_id) as message_count
from messages
where extract (month from sent_date)=8
and extract (year from sent_date )=2022
group by sender_id
order by message_count desc 
limit 2
-- Ex.6
select tweet_id    
from Tweets
where length (content)>15
-- Ex.7
select
activity_date as day,
count(distinct user_id) as active_users
from activity
where activity_date between '2019-06-26' and '2019-07-27'
group by activity_date
-- Ex.8
select 
count (id) as number_of_employees
from employees
where extract (month from joining_date) between 1 and 7
and extract (year from joining_date)=2022
-- Ex.9
select 
position ('a' in first_name)
from worker
where first_name='Amitah'
-- Ex.10
select
title,
substring (title,length(winery)+2,4) as year
from winemag_p2
