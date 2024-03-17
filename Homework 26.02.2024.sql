use hr;
-- 1.  Напишите запрос, который выводит идентификатор сотрудника, 
-- его имя и фамилию, а также категорию зарплаты на основе следующих условий:

-- Если зарплата меньше 5000, категория "Низкая".
-- Если зарплата от 5000 до 10000, категория "Средняя".
-- Если зарплата больше 10000, категория "Высокая".

 select 
	employee_id, first_name, last_name,
	case
		when salary < 500 then 'Низкая'
        when salary >= 5000 and salary <= 10000 then 'Средняя'
        else 'Высокая'
	end as salary_category
from employees;



-- 2. Определение размера премии сотрудникам:
-- Напишите запрос, который выводит идентификатор сотрудника, 
-- его имя и фамилию, а также размер премии на основе следующих условий:


-- Если зарплата меньше 5000, премия составляет 10% от зарплаты.
-- Если зарплата от 5000 до 10000, премия составляет 15% от зарплаты.
-- Если зарплата больше 10000, премия составляет 20% от зарплаты.

select 
    employee_id,
    first_name,
    last_name,
    case 
        when salary < 5000 then salary * 0.1
        when salary >= 5000 and salary <= 10000 then salary * 0.15
        else salary * 0.2
    end as bonus_amount
from employees;

-- 3. Получить список стран с указанием их региона и обозначением страны "EU" для стран 
-- Европейского союза, "Non-EU" для остальных стран.

select
    country_name,
    region_id,
    case 
        when  region_id = '1' then 'EU'
        else 'Non-EU'
	end as country_category
from countries;

-- 4. Получить список стран с указанием количества символов в их названиях.

select 
    country_name,
    length(country_name) as name_length
from countries;

-- 5.Получить список стран и их первые три символа в названии

select
	country_name,
    left(country_name, 3) as first_tree
from countries;

-- 6. Получить список сотрудников с заменой их email на "Confidential", 
-- если он содержит слово "sqltutorial".

select
	employee_id,
	first_name,
    last_name,
    case
		when email like '%sqltutorial%' then 'Confidential'
        else email
	end as email
from employees;

-- 7. Получить список сотрудников и указать их email в нижнем регистре.

select 
    employee_id,
    first_name,
    last_name,
    lower(email) as email
from employees;

-- 8. Получить список сотрудников(firstname, lastname) с указанием их должности(job_title).

select
	t1.first_name,
    t1.last_name,
    t2.job_title
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id;

-- 9. Получить список отделов(department_name) и их названий с указанием местоположения(city).

select
	t1.department_name,
	t2.city
from departments t1
inner join locations t2
on t1.location_id = t2.location_id;

-- 10. Получить список отделов(departmentname) и их менеджеров(firstname, last_name).

select
    d.department_name,
    m.first_name as manager_first_name,
    m.last_name as manager_last_name
from departments d
left join employees m
on d.manager_id = m.employee_id;


-- 11. Получить список сотрудников(firstname, lastname) с указанием их департамента(department_name), 
-- отсортированный по департаменту.

select 
    t1.first_name,
    t1.last_name,
    t2.department_name
from employees t1
inner join departments t2 
on t1.department_id = t2.department_id
order by t2.department_name;

-- 12. Получить список сотрудников(firstname, lastname)  и их менеджеров(firstname, lastname).

select 
    e.first_name as employee_first_name,
    e.last_name as employee_last_name,
    m.first_name as manager_first_name,
    m.last_name as manager_last_name
from employees e
left join employees m 
on e.manager_id = m.employee_id;

-- 13. Получить список стран, где местоположение находится в США.

select
    t1.country_name
from countries t1
join regions t2
on t1.region_id = t2.region_id
where t2.region_name = 'Americas';

 






