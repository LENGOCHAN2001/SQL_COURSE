---Bai01--
select distinct city from station
where id%2=0

---Bai02---
select count(city)-count(distinct city) from station

---Bai04--
SELECT round(cast(sum(item_count*order_occurrences)/sum(order_occurrences)
as decimal),1) as mean
FROM items_per_order

---Bai05---
SELECT round(cast(sum(item_count*order_occurrences)/sum(order_occurrences)
as decimal),1) as mean
FROM items_per_order

---Bai06--
SELECT user_id,
Date(max(post_date))- date(min(post_date)) as days_between FROM posts
where post_date >='2021-01-01' and post_date <='2021-12-31'
group by user_id
having count(post_id)>=2
  
---Bai07---
Select card_name, max(issued_amount)-min(issued_amount) as difference 
from monthly_cards_issued
group by card_name 
order by max(issued_amount)-min(issued_amount) desc 
  
---Bai08---
SELECT manufacturer, count(product_id) as drug_count, sum(cogs - (total_sales)) as total_loss
FROM pharmacy_sales
where cogs > total_sales
group by manufacturer
order by total_loss desc 
  
---Bai09--
Select * from Cinema
where id%2=1 and description<>'boring'
order by rating desc 
  
--Bai10--
Select teacher_id, count(distinct  subject_id) as cnt from Teacher
group by teacher_id

---Bai11---
select user_id, count(follower_id) as followers_count from Followers
group by user_id
order by user_id asc 
---Bai12---
