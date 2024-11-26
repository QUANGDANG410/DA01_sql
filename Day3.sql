--Ex 1
select name from city
where countrycode ="USA" 
and population >120000
--Ex 2
select * from city
where countrycode ='JPN'
--Ex 3
select city, state from station
--Ex 4
select distinct city from station 
where city like 'A%'
or city like 'E%'
or city like 'I%'
or city like 'O%'
or city like 'U%'
--Ex 5
select distinct city from station 
where city like '%A'
or city like '%E'
or city like '%I'
or city like '%O'
or city like '%U'
--Ex 6
select distinct city from station 
where city not like 'A%'
and city not like'E%'
and city not like'I%'
and city not like'O%'
and city not like'U%'
--Ex 7
select name from employee
order by name
--Ex 8
select name from employee
where salary >2000
and months <10
order by employee_id
--Ex 9
select product_id from products
where low_fats ='Y'
and recyclable ='Y'
--Ex 10
select name from customer
where not referee_id = 2 or referee_id is null -- Doi voi gia tri null phai su dun is null
--Ex 11
select name, population, area from world
where population >= 25000000
or area >= 3000000
--Ex 12
select distinct author_id as id from views 
where author_id = viewer_id
order by author_id
--Ex 13
SELECT part FROM parts_assembly
WHERE finish_date IS NULL
--Ex 14
select yearly_salary from lyft_drivers;
where yearly_salary <= 30000 or >= 700000
--Ex 15
select * from uber_advertising;
where year = 2019
and money_spent >= 100000


