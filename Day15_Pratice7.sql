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
