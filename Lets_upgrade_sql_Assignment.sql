create database product_data;

use product_data;

create table products 
(product_id INT NOT NULL,
product_name varchar(50) not null,
category varchar(50) not null,
price float not null,
primary key(product_id));

INSERT INTO products (product_id, product_name, category, price) values 
(1, 'T-Shirt', 'Clothing', 10.99),
(2, 'Socks', 'Clothing', 4.99),
(3, 'Hat', 'Accessories', 12.99),
(4, 'Shoes', 'Footwear', 59.99),
(5, 'Backpack', 'Accessories', 29.99),
(6, 'Pants', 'Clothing', 24.99);

SELECT DISTINCT category FROM products