--Bài01--
with a as (
select 
to_char(transaction_date,'yyyy') as year,product_id,sum(spend) as curr_year_spend 
from user_transactions 
group by year,product_id
order by product_id)
select 
a.year,a.product_id,a.curr_year_spend,
lag(curr_year_spend) over(partition by a.product_id order by a.year) as prev_year_spend,
round(100*(a.curr_year_spend - (lag(curr_year_spend) over(partition by a.product_id order by a.year)))/(lag(curr_year_spend) over(partition by a.product_id order by a.year)),2) as yoy_rate
from a 

---Bài02---
with a as (
select make_date(issue_year, issue_month,1) as issue_date , card_name, issued_amount
from monthly_cards_issued), 
b as (select *,  
rank() over(partition by a.card_name order by a.issue_date) as rank 
from a) 
select b.card_name, b.issued_amount from b where b.rank=1 
order by b.issued_amount desc 
  
---Bài03---
with a as (
SELECT 
user_id,spend,transaction_date,
row_number () over(partition by user_id order by transaction_date) as rank 
from transactions)
select a.user_id,a.spend,a.transaction_date
from a where a.rank = 3 

--Bài04--
with a as (
SELECT transaction_date,user_id, count(*) as purchase_count, 
row_number() over (partition by user_id order by transaction_date desc) as rank 
FROM user_transactions
group by transaction_date,user_id)
select a.transaction_date, a.user_id,a.purchase_count 
from a 
where rank = 1  
order by  a.transaction_date

---Bai05--
with a as (
SELECT *,
lag (transaction_timestamp) over (partition by merchant_id,credit_card_id,amount	order by transaction_timestamp) as pre_transaction_timestamp,
transaction_timestamp - lag (transaction_timestamp) over (partition by merchant_id,credit_card_id,amount	order by transaction_timestamp)
as diff_time 
from transactions)

select count(diff_time) as payment_count from a where extract(epoch from diff_time) <=600 

---Bai06---
with a as (
select category,product,sum(spend) as total_spend from product_spend
where extract(year from transaction_date) = 2022
group by category,product
order by category, sum(spend) desc), 
b as (select a.*, rank() over(partition by a.category order by a.total_spend desc) as rank 
from a) 
select b.category,b.product,b.total_spend from b 
where b.rank<=2

---Bai07---
with a as (
select category,product,sum(spend) as total_spend from product_spend
where extract(year from transaction_date) = 2022
group by category,product
order by category, sum(spend) desc), 
b as (select a.*, rank() over(partition by a.category order by a.total_spend desc) as rank 
from a) 
select b.category,b.product,b.total_spend from b 
where b.rank<=2 

---Bai08---
with a as (
SELECT *
FROM global_song_rank
join songs on global_song_rank.song_id=songs.song_id
join artists on artists.artist_id=songs.artist_id
order by artists.artist_id), 
b as (
select a.artist_name, count(*),
dense_rank() over (order by count(*) desc) as artist_rank
from a 
where a.rank<=10 
group by a.artist_name)
select b.artist_name,b.artist_rank from b  
where b.artist_rank <=5 


----Bai08---

