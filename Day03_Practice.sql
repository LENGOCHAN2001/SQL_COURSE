---BAI01---
Select NAME from CITY
where POPULATION >=120000 AND COUNTRYCODE = 'USA';

---BAI02---
Select * from CITY
WHERE COUNTRYCODE = 'JPN';

---BT03---
SELECT CITY, STATE FROM STATION;

---BT04---
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE 'a%' or CITY like 'e%' or CITY like 'i%' or CITY like 'o%' or CITY like 'u%'
  
---BT05---
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%a' or CITY like '%e' or CITY like '%i' or CITY like '%o' or CITY like '%u';

---BT06---
SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT like 'u%'
  
---BT07---
SELECT name FROM Employee
ORDER BY name;

---BT08---
select name from Employee
where salary > 2000 and months < 10
order by employee_id asc;

---BT09---
SELECT product_id from Products
WHERE low_fats = 'Y' AND recyclable ='Y'
  
---BT10---
SELECT name from Customer
where referee_id <> 2 or referee_id is null
  
---BT11--
SELECT name, population,area FROM World
WHERE area >=3000000 OR population >=25000000
  
---BT12---
SELECT DISTINCT author_id as id FROM Views 
WHERE author_id = viewer_id
ORDER BY author_id;

---BT13--
SELECT part,assembly_step FROM parts_assembly
WHERE finish_date IS NULL
  
---BT14---
select * from lyft_drivers
WHERE yearly_salary <=30000 OR yearly_salary >=70000
  
---BT15---
select * from uber_advertising
WHERE year = 2019 AND money_spent >=100000
