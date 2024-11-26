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



