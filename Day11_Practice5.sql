---Bai01--
select
COUNTRY.Continent, floor(avg(CITY.Population))
from city 
left join country
on CITY.CountryCode = COUNTRY.Code 
group by COUNTRY.Continent 
having COUNTRY.Continent is not null

  ---Bai02---
SELECT 
round(cast(sum(
CASE
  when signup_action = 'Confirmed' then 1
  else 0
end) as decimal)/count(*),2)
as confirm_rate
FROM texts;

----Bai03---
SELECT age_breakdown.age_bucket,
ROUND(100.0*SUM(CASE
  WHEN activities.activity_type = 'send' THEN activities.time_spent ELSE 0 END)/SUM(activities.time_spent),2)
AS send_perc,

ROUND(100.0*SUM(CASE
  WHEN activities.activity_type = 'open' THEN activities.time_spent ELSE 0 END)/SUM(activities.time_spent),2) 
AS open_perc

FROM activities

LEFT JOIN age_breakdown
ON activities.user_id=age_breakdown.user_id
where activities.activity_type in ('open','send')
GROUP BY age_breakdown.age_bucket

----Bai04----
SELECT 
customer_contracts.customer_id
FROM customer_contracts
LEFT JOIN products
ON customer_contracts.product_id=products.product_id
WHERE products.product_category IN ('Analytics','Containers','Compute') 
AND products.product_name LIKE '%Azure%'
GROUP BY customer_contracts.customer_id 
HAVING COUNT(products.product_category)=3 

----Bai05---
SELECT
mng.employee_id, mng.name,count(emp.employee_id) as reports_count, round(avg(emp.age),0) as average_age
FROM
Employees as mng
left JOIN Employees as emp
ON mng.employee_id =emp.reports_to
group by mng.employee_id, mng.name
having count(emp.employee_id) >=1 
order by employee_id

---Bai06---
Select 
Products.product_name, sum(Orders.unit) as unit
From Orders 
Left join Products 
on Orders.product_id = Products.product_id
where extract(month from Orders.order_date) = 2 and extract(year from Orders.order_date) = 2020
Group by Products.product_name 
having  sum(Orders.unit) >=100

---Bai07---
SELECT pages.page_id
FROM pages 
LEFT JOIN 
(select distinct page_id from page_likes) as page_likes1_change
on pages.page_id = page_likes1_change.page_id
where page_likes1_change.page_id is null 

---MID TEST---
--Bai01--
SELECT DISTINCT replacement_cost from film
ORDER BY replacement_cost 
LIMIT 1

---Bai02--
SELECT 
SUM(CASE
WHEN replacement_cost>=9.99 and replacement_cost<=19.99 then 1 ELSE 0 END) AS LOW
from film 

---Bai03---
Select film.title,film.length, category.name  
from film
join film_category on film.film_id=film_category.film_id
join category on film_category.category_id=category.category_id
where category.name in ('Drama','Sports')
order by film.length desc 
limit 1

---Bai04---
Select category.name, count (*) 
from film
join film_category on film.film_id=film_category.film_id
join category on film_category.category_id=category.category_id
group by category.name
order by count (*) desc
limit 1

---Bai05---
select actor.last_name, actor.first_name,count(film_actor.film_id)
from film_actor
left join actor
on film_actor.actor_id=actor.actor_id
group by actor.last_name, actor.first_name
order by count(film_actor.film_id) desc 
limit 1

---Bai06--
select count(address.address_id)
from address
left join customer
on address.address_id=customer.address_id
where customer.customer_id is null

---Bai07---
select city.city,sum(payment.amount)
from payment 
join customer on payment.customer_id=customer.customer_id
join address on customer.address_id=address.address_id
join city on address.city_id= city.city_id
group by city.city
order by sum(payment.amount) desc
limit 1

---Bai08--
select (city.city)||','||' '||(country.country) AS city_country,sum(payment.amount)
from payment 
join customer on payment.customer_id=customer.customer_id
join address on customer.address_id=address.address_id
join city on address.city_id= city.city_id
join country on city.city_id=country.country_id
group by city.city,country.country
order by sum(payment.amount) desc
limit 1





