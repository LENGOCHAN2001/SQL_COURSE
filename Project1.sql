select * from public.sales_dataset_rfm_prj;

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


ALTER TABLE sales_dataset_rfm_prj  ADD COLUMN orderdate_holder TIMESTAMP without time zone NULL;
UPDATE sales_dataset_rfm_prj SET orderdate_holder = orderdate::TIMESTAMP;
ALTER TABLE sales_dataset_rfm_prj ALTER COLUMN orderdate TYPE TIMESTAMP without time zone USING orderdate_holder;
ALTER TABLE sales_dataset_rfm_prj DROP COLUMN orderdate_holder;

select ORDERNUMBER, QUANTITYORDERED, PRICEEACH, ORDERLINENUMBER, SALES, ORDERDATE from sales_dataset_rfm_prj
where ORDERNUMBER is null 
or QUANTITYORDERED is null 
or PRICEEACH is null 
or ORDERLINENUMBER is null 
or SALES is null 
or ORDERDATE is null 
