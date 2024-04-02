---BUỔI 04---
COUNT(*) AS count_record,-- Đếm số lượng dòng
COUNT(customer_id) AS count_record_customer_id,-- đếm số lượng dòng ko null trong cột customer_id bị
COUNT(DISTINCT customer_id)  AS count_distinct_customer_id-- đếm số bản ghi khác nhau trong cột customer_id
FROM payment
WHERE payment_date BETWEEN '2020-01-01' AND '2020-02-01'
----CHALLENGE GROUP BY---hình như bài này bài giảng bị sai???
select * from film
select max(replacement_cost) as max_replacementcost,
min(replacement_cost) as min_replacementcost,
round(avg(replacement_cost),2) as average_replacementcost,
sum(replacement_cost) as sum_replacementcost
from film
-----HAVING----Hãy cho biết khách hàng có tổng số tiền đã trả > 100$ trong tháng 1-2020
select customer_id, sum(amount) as TongAmount_KH from Payment
where payment_date between '2020-01-01' and '2020-02-01'
Group by customer_id
having sum(amount)>10
order by customer_id
---Challenge HAVING--
/*challenge:Năm 2020, các ngày 28, 29, 30/4 là những ngày có doanh thu rất cao. Đó là lý do sếp muốn muốn xem dữ liệu vào những ngày đó.
Hãy tìm số tiền thanh toán trung bình được nhóm theo khách hàng và ngày thanh toán – chỉ xem xét những ngày mà khách hàng có nhiều hơn 1 khoản thanh toán 
Sắp xếp theo số tiền trung bình theo thứ tự giảm dần.*/
SELECT customer_id, DATE(payment_date),
AVG(amount) AS avg_amount
FROM payment
WHERE DATE(payment_date) IN ('2020-04-28','2020-04-29','2020-04-30')
GROUP BY customer_id,DATE(payment_date)
HAVING COUNT(payment_id) >1
ORDER BY AVG(amount) DESC

---BUOI7---
select 
CASE
	WHEN AMOUNT < 20000 THEN 'Low price ticket'
	WHEN AMOUNT BETWEEN 20000 AND 150000 THEN 'Mid price ticket'
	ELSE 'Hight price ticket'
end category,
count (ticket_no)
FROM BOOKINGS.TICKET_FLIGHTS
group by category
