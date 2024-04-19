select * from public.sales_dataset_rfm_prj;
--Câu1---
ALTER TABLE sales_dataset_rfm_prj 
ALTER COLUMN ordernumber TYPE integer USING (trim(ordernumber)::integer)

ALTER TABLE sales_dataset_rfm_prj 
ALTER COLUMN quantityordered TYPE integer USING (trim(quantityordered)::integer)

ALTER TABLE sales_dataset_rfm_prj 
ALTER COLUMN priceeach TYPE NUMERIC USING (trim(priceeach)::NUMERIC)

ALTER TABLE sales_dataset_rfm_prj 
ALTER COLUMN orderlinenumber TYPE integer USING (trim(orderlinenumber)::integer)

ALTER TABLE sales_dataset_rfm_prj 
ALTER COLUMN sales TYPE decimal USING (trim(sales)::decimal)

ALTER TABLE sales_dataset_rfm_prj 
ALTER COLUMN msrp TYPE integer USING (trim(msrp)::integer)


ALTER TABLE sales_dataset_rfm_prj  ADD COLUMN orderdate_holder TIMESTAMP without time zone NULL;
UPDATE sales_dataset_rfm_prj SET orderdate_holder = orderdate::TIMESTAMP;
ALTER TABLE sales_dataset_rfm_prj ALTER COLUMN orderdate TYPE TIMESTAMP without time zone USING orderdate_holder;
ALTER TABLE sales_dataset_rfm_prj DROP COLUMN orderdate_holder;

-- Câu2--
select ORDERNUMBER, QUANTITYORDERED, PRICEEACH, ORDERLINENUMBER, SALES, ORDERDATE from sales_dataset_rfm_prj
where ORDERNUMBER is null 
or QUANTITYORDERED is null 
or PRICEEACH is null 
or ORDERLINENUMBER is null 
or SALES is null 
or ORDERDATE is null 

---Câu3--
ALTER TABLE sales_dataset_rfm_prj
ADD COLUMN First_name VARCHAR(50),
ADD COLUMN Last_name VARCHAR(50);

UPDATE sales_dataset_rfm_prj
SET last_name = upper(left(contactfullname,1))|| substring(contactfullname FROM 2 FOR position('-' IN contactfullname)-2);

UPDATE sales_dataset_rfm_prj
SET first_name = upper(substring(contactfullname,position('-' IN contactfullname)+1,1))||
substring(contactfullname from position('-' IN contactfullname)+2 for length(contactfullname))

--Câu4--Thêm cột QTR_ID, MONTH_ID, YEAR_ID lần lượt là Qúy, tháng, năm 
--được lấy ra từ ORDERDATE ---

ALTER TABLE sales_dataset_rfm_prj
ADD COLUMN QTR_ID integer,
ADD COLUMN MONTH_ID integer,
ADD COLUMN YEAR_ID integer;

UPDATE sales_dataset_rfm_prj
SET  QTR_ID = extract(quarter from orderdate);
UPDATE sales_dataset_rfm_prj
SET  MONTH_ID = extract(month from orderdate);
UPDATE sales_dataset_rfm_prj
SET  YEAR_ID = extract(year from orderdate);

--Câu 5 Hãy tìm outlier (nếu có) cho cột QUANTITYORDERED 
--và hãy chọn cách xử lý cho bản ghi đó (2 cách) 
---Cách 1 sử dụng Box-plot--
WITH a AS (
select 
percentile_cont(0.25) within group (order by quantityordered) as Q1,
percentile_cont(0.75) within group (order by quantityordered) as Q3,
percentile_cont(0.75) within group (order by quantityordered) - percentile_cont(0.25) within group (order by quantityordered) as IQR
from sales_dataset_rfm_prj),
b as(
select a.Q1 -1.5*a.IQR as min_value,
a.Q3+1.5*a.IQR as max_value from a)

select ordernumber, quantityordered from sales_dataset_rfm_prj
where quantityordered < (select min_value from b)
or quantityordered> (select max_value from b)

----Cách 2 sử dụng Z-score--
with a as (
select ordernumber,quantityordered, 
(select avg(quantityordered) from sales_dataset_rfm_prj) as avg,
(select stddev(quantityordered) from sales_dataset_rfm_prj) as std
from sales_dataset_rfm_prj),
twt_outlier as (
select ordernumber,quantityordered, (quantityordered-avg)/std as z_score from a
where abs((quantityordered-avg)/std) > 3)

UPDATE sales_dataset_rfm_prj
SET quantityordered = (select avg(quantityordered) from sales_dataset_rfm_prj)
WHERE quantityordered IN (select quantityordered in twt_outlier)



