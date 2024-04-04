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

