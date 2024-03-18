create database homework;
use homework;

-- 1. Вывести имя, фамилию пользователей и даты их заказов(order_date).

select 
    t1.CUST_FIRST_NAME,
    t1.CUST_LAST_NAME,
    t2.ORDER_DATE
from customers t1
join orders t2 
on t1.CUSTOMER_ID = t2.CUSTOMER_ID;

-- 2. Вывести даты заказов продуктов и описание этих продуктов(product_description).

select 
	t1.ORDER_DATE,
    t3.PRODUCT_DESCRIPTION
from orders t1
join order_items t2
on t1.ORDER_ID = t2.ORDER_ID
join product_information t3
on t2.PRODUCT_ID = t3.PRODUCT_ID;

-- 3. Вывести имя, фамилию пользователей, даты заказов(orderdate), 
-- описание продуктов, которые они заказали и категории соответствующих продуктов (categoryname).

select 
	t1.CUST_FIRST_NAME,
    t1.CUST_LAST_NAME,
    t2.ORDER_DATE,
    t4.PRODUCT_DESCRIPTION,
    t5.CATEGORY_NAME
from customers t1
join orders t2 
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
join categories_tab t5
on t4.CATEGORY_ID = t5.CATEGORY_ID;

-- 4. Вывести названия(productname), описания категорий(categorydescription) 
-- и количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.

select
	t1.PRODUCT_NAME,
    t2.CATEGORY_DESCRIPTION,
    t3.QUANTITY
from product_information t1
join categories_tab t2
on t1.CATEGORY_ID = t2.CATEGORY_ID
join order_items t3
on t1.PRODUCT_ID = t3.PRODUCT_ID
where t1.MIN_PRICE > 300;

-- 5. Вывести имя, фамилию покупателей, которые купили принтеры.

select 
	t1.CUST_FIRST_NAME,
    t1.CUST_LAST_NAME
from customers t1
join orders t2 
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
where t4.PRODUCT_DESCRIPTION like '%printer%';


-- 6. Вывести имя, фамилию всех женатых мужчин покупателей, 
-- которые покупали продукты со стоимостью (list_price) больше 550.

select
	CUST_FIRST_NAME,
    CUST_LAST_NAME
from customers t1
join orders t2 
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
join order_items t3
on t2.ORDER_ID = t3.ORDER_ID
join product_information t4
on t3.PRODUCT_ID = t4.PRODUCT_ID
where t1.MARITAL_STATUS = 'married'
	and t1.GENDER = 'M'
    and t4.LIST_PRICE > 550;
    

-- 7. Вывести названия(product_name) тех продуктов, 
-- у которых стоимость больше, чем у продукта 'LaserPro 600/6/BW’.
            
select 
    product_name
from product_information
where list_price > (
        select 
            list_price
        from product_information
        where product_name = 'LaserPro 600/6/BW'
    );
