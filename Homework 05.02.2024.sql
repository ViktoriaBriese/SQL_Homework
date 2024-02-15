use g171023;
create table employees (
employeeid int primary key auto_increment,
fname varchar(64) not null,
lastname varchar(64) not null,
email varchar(64) not null,
phone varchar(64) not null
);
alter table employees
add salary numeric(9, 2);

alter table employees
modify column salary int;

alter table employees
change fname first_name varchar(64);

alter table employees
drop column phone;

alter table employees
add department varchar(64) not null;

INSERT INTO employees (first_name, lastname, email, salary, department) 
VALUES 
('Jane', 'Smith', 'jane.smith@example.com', 6000, 'IT'),
('Mike', 'Johnson', 'mike.johnson@example.com',7000, 'Finance'),
('Anna', 'Williams', 'anna.williams@example.com', 5500, 'HR'),
('Peter', 'Brown', 'peter.brown@example.com', 6500, 'IT'),
('John', 'Doe', 'john.doe@example.com', 5000, 'HR'),
('Sarah', 'Taylor', 'sarah.taylor@example.com', 7500, 'Finance'),
('David', 'Miller', 'david.miller@example.com', 4500, 'HR');