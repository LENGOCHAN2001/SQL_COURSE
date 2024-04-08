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
