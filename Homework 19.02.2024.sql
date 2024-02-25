-- 1. Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%,
-- для HR 20% и для IT 35%. 
-- Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS.

select *,
	CASE 
        WHEN department = 'sales' THEN salary * 1.2
        WHEN department = 'finance' THEN salary * 1.15
        WHEN department = 'shipping' THEN salary * 1.1
        WHEN department = 'marketing' THEN salary * 1.25
        WHEN department = 'HR' THEN salary * 1.2
        WHEN department = 'IT' THEN salary * 1.35
        ELSE salary 
    END as new_salary
    from employees;
    
 -- 2. Создать поле new_salary типа numeric(7, 2)   
 
  alter table employees
    add new_salary numeric(7, 2);
    
-- 3.   Заполнить поле: повысить зарплаты для отдела sales на 20%, 
-- для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%. 

 set sql_safe_updates = 0;
    
    update employees
    set new_salary =
    CASE 
        WHEN department = 'sales' THEN salary * 1.2
        WHEN department = 'finance' THEN salary * 1.15
        WHEN department = 'shipping' THEN salary * 1.1
        WHEN department = 'marketing' THEN salary * 1.25
        WHEN department = 'HR' THEN salary * 1.2
        WHEN department = 'IT' THEN salary * 1.35
        ELSE salary 
    END;
    
-- 4.   Вывести из таблицы employees firstname как , lastname как surname и новое поле fullname, 
-- которое состоит из имен и фамилий сотрудников.

select first_name as username, last_name as surname, 
	concat(first_name, ' ', last_name) as fullname
from employees;

-- 5. Вывести новое поле commission, которое будет null, если зарплата сотрудника меньше 3000, 
-- будет 10, если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, 
-- если зарплата больше/равно 9000.

SELECT
    *,
    CASE 
        WHEN salary < 3000 THEN NULL
        WHEN salary < 6000 THEN 10
        WHEN salary < 9000 THEN 15
        ELSE 20
    END AS commission
FROM employees;

-- 6. Создать новое поле commission и соответственно заполнить.  

alter table employees
add  commission int;
 
update employees
set commission =
	CASE 
        WHEN salary < 3000 THEN NULL
        WHEN salary < 6000 THEN 10
        WHEN salary < 9000 THEN 15
        ELSE 20
    END;
    
-- 7. Создать поле finalsalary и заполнить формулой salary + salary * commission / 10. 
-- Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary.

alter table employees
add  finalsalary int;

update employees
set finalsalary =
    CASE 
        WHEN commission IS NULL THEN salary
        ELSE salary + salary * commission / 10
    END;

-- 8. Вывести поле email в нижнем регистре. 

SELECT
    LOWER(email) as email
FROM employees;

-- 9. Создать новое поле chk_email типа varchar(128).

alter table employees
add  chk_email varchar(128);  

-- 10. Заполнить поле chkemail. Если длина email меньше 3, значением chkemail будет 'Введите больше символов', 
-- если длина email больше/равно 3 и меньше 7,  значением chkemail будет 'Кол/во символов совпадает', 
-- если длина email больше/равно 7,  значением chkemail будет 'Введите меньше символов'.

update employees
set chk_email =
	CASE 
        WHEN LENGTH(email) < 3 THEN 'Введите больше символов'
        WHEN LENGTH(email) >= 3 AND LENGTH(email) < 7 THEN 'Кол/во символов совпадает'
        ELSE 'Введите меньше символов'
    END;