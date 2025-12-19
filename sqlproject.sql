create database sqlproject;

use sqlproject;

create table Customer(
c_id int primary key,
name varchar(100) not null,
email varchar(100),
phone_no varchar(50),
address varchar(255));

create table Category(
ct_id int primary key,
ct_name varchar(100) not null);

create table Books(
b_id int primary key,
title varchar(150) not null,
author varchar(100),
price decimal(10,2),
stock int,
ct_id int,
foreign key (ct_id) references Category(ct_id));

create table Orders(
order_id int primary key,
c_id int,
order_date date,
total_amt int,
foreign key (c_id) references Customer(c_id));

create table OrderDetails (
    order_id INT,
    b_id INT,
    quantity INT,
    subtotal INT,
    PRIMARY KEY (order_id, b_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (b_id) REFERENCES Books(b_id));

INSERT INTO Customer VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Mumbai'),
(2, 'Priya Singh', 'priya@gmail.com', '9876501234', 'Delhi'),
(3, 'Amit Verma', 'amit@gmail.com', '9876512345', 'Pune'),
(4, 'Sneha Patel', 'sneha@gmail.com', '9876523456', 'Ahmedabad'),
(5, 'Rohit Mehta', 'rohit@gmail.com', '9876534567', 'Bangalore');

INSERT INTO Category VALUES
(1, 'Programming'),
(2, 'Data Science'),
(3, 'Databases'),
(4, 'Machine Learning'),
(5, 'Business Analytics');

INSERT INTO Books VALUES
(101, 'Python Basics', 'John Smith', 450.00, 20, 1),
(102, 'Advanced SQL', 'David Lee', 500.00, 15, 3),
(103, 'Data Analytics', 'Emma Brown', 650.00, 10, 2),
(104, 'Machine Learning 101', 'Andrew Ng', 750.00, 8, 4),
(105, 'Business Intelligence', 'Michael Porter', 600.00, 12, 5);

INSERT INTO Orders VALUES
(1001, 1, '2025-12-10', 950),
(1002, 2, '2025-12-11', 650),
(1003, 3, '2025-12-12', 750),
(1004, 4, '2025-12-13', 600),
(1005, 5, '2025-12-14', 450);

INSERT INTO OrderDetails VALUES
(1001, 101, 1, 450),
(1001, 102, 1, 500),
(1002, 103, 1, 650),
(1003, 104, 1, 750),
(1004, 105, 1, 600);

-- display all customers

select * from Customer;

-- show all book prices and titles

select title, price from Books;

-- list all orders with total amount 

select order_id, total_amt from Orders;

-- show all categories 

select * from Category;

-- Display customer names and emails

select name, email from Customer;

-- List book titles and prices

select title, price from Books;

-- Display orders with total amount

select order_id, total_amt from Orders;

-- Display books with stock more than 10

select title, stock from Books
WHERE stock > 10;

-- Display customers from Mumbai

select * from Customer
where  address = 'Mumbai';

-- Orders with customer names

select o.order_id, c.name, o.order_date, o.total_amt
from Orders o
join Customer c on o.c_id = c.c_id;

-- Books with category names

select b.title, b.author, c.ct_name
from Books b
join Category c on b.ct_id = c.ct_id;

-- Order details with book titles

select od.order_id, b.title, od.quantity, od.subtotal
from OrderDetails od
join Books b on od.b_id = b.b_id;

-- Customers and their orders (LEFT JOIN)

select c.name, o.order_id
from Customer c
left join Orders o on c.c_id = o.c_id;

-- Orders with total amount > 600 and customer name

select o.order_id, c.name, o.total_amt
from Orders o
join Customer c on o.c_id = c.c_id
where o.total_amt > 600;

-- Customers who placed orders

select distinct c.name
from Customer c
join Orders o on c.c_id = o.c_id;

-- Order amount calculated from OrderDetails

select od.order_id, sum(od.subtotal) as calculated_total
from OrderDetails od
group by od.order_id;


