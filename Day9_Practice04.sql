--Bai01---
SELECT 
SUM(CASE 
  WHEN device_type = 'laptop' THEN 1 
  ELSE 0
END) AS laptop_views,
SUM(CASE 
  WHEN device_type IN ('tablet','phone') THEN 1 
  ELSE 0
END) AS mobile_views
FROM viewership;

----Bai02---
SELECT x,y,z,
CASE
    WHEN x+y>z and y+z>x and x+z>y THEN 'Yes'
    Else 'No'
END AS  triangle
From Triangle

---Bai03---
SELECT 
ROUND(CAST(100*SUM(
CASE
  WHEN call_category = 'n/a' or call_category is null then 1
  Else 0
End)/COUNT(*) AS DECIMAL),1) AS call_percentage
FROM callers

---Bai04---
SELECT name from Customer
where referee_id <> 2 or referee_id is null

---Bai05---
select
survived,
sum(case when pclass = 1 then 1 else 0 end) as  first_class,
sum(case when pclass = 2 then 1 else 0 end) as  second_classs,
sum(case when pclass = 3 then 1 else 0 end) as  third_class
from titanic
group by survived
