/*
What is MySQL? -> Open-source Relational Datbase Management System
Importance in Data Analytics? -> 
Installed MYSQL Server -> Installed MYSQL Workbench -> Connected MYSQL Workbench to server 
Is their any command to exit a db?
or we just switch between DBsin MySQL?
*/
show databases;
use bookzone;
show databases; 
show tables;
create database xyz;
use xyz;
drop database xyz;
show databases;
create database sales_db;
Use sales_db;
CREATE TABLE customers(
id int auto_increment primary key,
name varchar (100),
email varchar(100) unique,
created_at timestamp default current_timestamp);

describe customers;

Insert into customers(name, email) values
('Sandhya', 'sbhanda1@gmail.com'),
('Salina', 'sgaba1@gmail.com'),
('Sandesh', 'sbhandari1@gmail.com'),
('Nani', 'nbhanda1@gmail.com'),
('Lal', 'lbhanda1@gmail.com');

select * from customers;
Insert into customers(name, email) values
('Momo', 'momobhanda1@gmail.com');

select name, email from customers;
select id, name from customers;

select * from customers where name = 'momo';
select * from customers where created_at<'2025-01-31';

select * from customers order by id DESC;
select * from customers order by created_at DESC;

select * from customers limit 3;
select * from customers order by created_at DESC limit 3;

select * from customers;

select name as CustomerName, email as CustomerEmail, created_at as SignupTime from customers;

describe customers;

select count(*) from customers;
select count(*) as TotalRecords from customers;
select max(id) from customers;
select * from customers;

Create table sales(
id int auto_increment primary key,
customer_id int,
amount decimal(10,2),
sale_date timestamp default current_timestamp,
foreign key(customer_id) references customers(id));

describe sales;

insert into sales(customer_id, amount) values
(1, 200.05),
(2, 50000.01),
(4, 3000.09),
(6, 6000.05);

select * from sales;
select max(amount) from sales;
select avg(amount) from sales;
select sum(amount) from sales;

show tables; 

select customers.name, sales.amount from customers
inner join sales on customers.id = sales.customer_id;

select customers.name, sales.amount from customers
left join sales on customers.id = sales.customer_id;

select * from sales where amount = (select max(amount) from sales);

select * from customers;

update customers set name = "Daya" where id=6;
update customers set email = "Dbhanda1@gmail.com" where name= 'Daya';
update customers set email = "Dbhanda1@gmail.com" where id=6;

select * from customers;

select * from sales;

update sales set amount = amount*80 where customer_id = 1;

delete from sales where id =1;

select * from sales;

describe sales;
delete from sales;
truncate table sales;
drop table sales;

SET SQL_SAFE_UPDATES = 1;