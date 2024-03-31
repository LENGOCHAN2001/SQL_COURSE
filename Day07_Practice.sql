---Bai01---
select name from students
where Marks >75
order by right(name,3), id 
  
---Bai02---
Select user_id,
CONCAT(Upper(Left(name,1)),Lower(Right(Name,length(name)-1))) as name 
from Users
order by user_id

---Bai03---
SELECT manufacturer,
concat('$',round(sum(total_sales)/1000000,0),' ','million') as sale
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer

----Bai04---
SELECT 
EXTRACT(month from submit_date) as mth,product_id as product, 
round(avg(stars),2) as avg_stars
FROM reviews
group by EXTRACT(month from submit_date),product_id
order by EXTRACT(month from submit_date), product_id

---Bai05---
SELECT 
sender_id, count(receiver_id) as message_count
FROM messages
where extract(month from sent_date) = 8 
and extract(year from sent_date)= 2022
group by sender_id
order by message_count DESC
limit 2

---Bai06--
select tweet_id from Tweets
where length(content)>15

---Bai07---
Select activity_date as day, 
count(distinct user_id) as active_users from Activity
where 
DATEDIFF('2019-07-27', activity_date ) <= 30
group by activity_date

----Bai08---
select count(id) from employees
where joining_date	between '2022-01-01' and '2022-07-31'

---Bai09--
select position('a' in first_name ) from worker
where first_name = 'Amitah'

---Bai10--
select 
substring (title,(length(winery)+2),4)
from winemag_p2
where country = 'Macedonia'
