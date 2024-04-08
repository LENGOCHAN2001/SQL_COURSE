---Bai1---
with a as (
Select count(job_id) as no_of_job_id,company_id,title,description from job_listings
group by company_id,title,description)
select count(a.no_of_job_id) as duplicate_companies from a
where a.no_of_job_id>=2 

---Bai2----

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

