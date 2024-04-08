---Bai1---
with a as (
Select count(job_id) as no_of_job_id,company_id,title,description from job_listings
group by company_id,title,description)
select count(a.no_of_job_id) as duplicate_companies from a
where a.no_of_job_id>=2 

---Bai2----
select category,product,sum(spend) from product_spend
where extract(year from transaction_date) = 2022
group by category,product
order by category, sum(spend) desc

---Bai3---
WITH a as (
select policy_holder_id, count(case_id) as no_of_case_id from callers
group by policy_holder_id)
select count(a.no_of_case_id) as member_count from a 
where a.no_of_case_id >=3 

---Bai04---
with page_likes_change as (
select count(user_id) as count_user_id, page_id from page_likes
group by page_id)
select pages.page_id 
from pages 
left join page_likes_change 
on pages.page_id	= page_likes_change.page_id
where page_likes_change.count_user_id is null 

---Bai05---

with a as (
select user_id, count(distinct extract (month from event_date)) as no_of_month from user_actions
where extract (month from event_date) in (6,7) and  extract (year from event_date) = 2022 
group by user_id
ORDER BY user_id)
select '7' as month, count(a.user_id) as monthly_active_users 
from a where a.no_of_month = 2 

--Bai06---
with a as (
select id,country, state, amount, to_char(trans_date,'yyyy-mm') as month from Transactions)
select a.month,country, count(*) as trans_count, 
sum (case when state = 'approved' then 1 else 0 end) as approved_count,
sum(amount) as trans_total_amount,
sum (case when state = 'approved' then amount else 0 end) as approved_total_amount
from a
group by a.month,country

---Bai07---
with a as (
select product_id,min(year) as first_year from Sales
group by product_id)
select a.product_id, a.first_year, Sales.quantity, Sales.price
from a
left join Sales 
on a.product_id=Sales.product_id
and a.first_year= Sales.year

---Bai08---
select customer_id from customer
group by customer_id
having count(product_key)=2

---BAi09---
select employee_id from Employees
where salary < 30000 and manager_id not in (select employee_id from Employees)
order by employee_id

---Bai10--
with a as (
Select count(job_id) as no_of_job_id,company_id,title,description from job_listings
group by company_id,title,description)
select count(a.no_of_job_id) as duplicate_companies from a
where a.no_of_job_id>=2 

  
---Bai11--
with a as 
(select Users.name as results
from MovieRating
left join Users 
on MovieRating.user_id = Users.user_id
group by Users.name,Users.user_id 
order by count(MovieRating.rating) desc, Users.name 
limit 1),
 b as (
select Movies.title as results
from MovieRating
left join Movies 
on MovieRating. movie_id = Movies. movie_id
where extract (month from created_at) = 2 and extract (year from created_at) = 2020
group by MovieRating. movie_id,Movies.title
order by avg(MovieRating.rating) desc, Movies.title
limit 1)
select results from a
union 
select results from b 

---Bai12---
with a as
(select requester_id as id from RequestAccepted ),
b as (select accepter_id as id from RequestAccepted),
c as (
select a.id from a
union all 
select b.id from b)
select c.id, count(c.id) as num from c
group by c.id
order by count(c.id) desc 
limit 1



