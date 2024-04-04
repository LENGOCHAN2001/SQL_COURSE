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
