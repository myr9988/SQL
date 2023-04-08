create database customer_data;

use customer_data;

create table customers
(customer_id int not null,
customer_name varchar(50) not null,
country varchar (50) not null,
age int not null);

INSERT INTO customers (customer_id, customer_name, country, age) values 
(1, 'John Smith', 'USA', 30),
(2, 'Jane Doe', 'Canada', 42),
(3, 'Alex Kim', 'USA', 20),
(4, 'Emily Chen', 'China', 28),
(5, 'Tom Johnson', 'USA', 37),
(6, 'Lisa Lee', 'Korea', 24);

SELECT * FROM customers WHERE country = 'USA' AND age > 25