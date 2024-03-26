use homework;
-- 1. Вывести максимальный и минимальный credit_limit.

select 
    min(CREDIT_LIMIT) as min_CREDIT_LIMIT,
    max(CREDIT_LIMIT) as max_CREDIT_LIMIT
from customers;

-- 2. Вывести покупателей у которых creditlimit выше среднего creditlimit.

select
	CUST_FIRST_NAME,
    CUST_LAST_NAME
from customers
where CREDIT_LIMIT > (select avg(CREDIT_LIMIT) from customers);

-- 3. Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.

select count(*)
from customers
where CUST_FIRST_NAME like 'D%' and CREDIT_LIMIT > 500;

-- 4. Найти среднее значение unit_price

select avg(UNIT_PRICE)
from order_items;

-- 5. Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.

select 
	t1.PRODUCT_NAME,
    t2.QUANTITY
from product_information t1
join order_items t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
where t2.QUANTITY < (select avg(QUANTITY) from order_items);

-- 6. Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).

select
	t1.CUST_FIRST_NAME,
    t1.CUST_LAST_NAME
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where ORDER_TOTAL = (select max(ORDER_TOTAL) from orders);

-- 7. Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.

select sum(ORDER_TOTAL) as total_order_amount
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t1.MARITAL_STATUS = 'married'
and t1.GENDER = 'M';
