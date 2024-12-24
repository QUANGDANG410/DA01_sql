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
