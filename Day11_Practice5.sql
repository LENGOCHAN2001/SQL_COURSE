---Bai01--

---Bai02---
SELECT 
round(cast(sum(
CASE
  when signup_action = 'Confirmed' then 1
  else 0
end) as decimal)/count(*),2)
as confirm_rate
FROM texts;
