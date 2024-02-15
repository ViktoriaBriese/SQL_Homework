use hr;
select *
from employees
order by last_name asc;

select *
from employees
order by salary desc;

select *
from employees
where department_id in (60, 90, 110)
order by last_name asc;

select *
from employees
where first_name like 'D%'
order by last_name asc
limit 3;

select *
from employees
order by salary asc
limit 1;