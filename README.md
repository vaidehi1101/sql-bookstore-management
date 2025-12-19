# sql-bookstore-management
A SQL-based Bookstore Management System with schema, sample data, and example queries.
SQL Database Project — Bookstore Management System

Overview
This project demonstrates a Bookstore Management System built using SQL.
It showcases the design and creation of a relational database that stores information about customers, book categories, and books, including relationships and constraints.

Project Structure
File: sqlproject.sql
The SQL file includes:
- Database creation
- Table definitions with primary and foreign keys
- Sample data insertion
- Example SQL queries (basic and join queries)

Database Schema
Tables:

Customer
- c_id (Primary Key)
- name
- email
- phone_no
- address

Category
- ct_id (Primary Key)
- ct_name

Books
- b_id (Primary Key)
- title
- author
- price
- ct_id (Foreign Key → Category)

Orders
- o_id (Primary Key)
- c_id (Foreign Key → Customer)
- b_id (Foreign Key → Books)
- order_date
- quantity
- total_price

Features
- Relational database design with normalization
- Foreign key constraints to maintain referential integrity
- CRUD operations (Create, Read, Update, Delete)
- Join queries to combine data from multiple tables

How to Use
1. Open MySQL, SQL Server, or SQLite.
2. Run the commands in sqlproject.sql file.
3. Explore and modify queries as needed.

Example Query:
SELECT b.title, b.author, c.ct_name
FROM Books b
JOIN Category c ON b.ct_id = c.ct_id;

Example Queries Included
- Basic SELECT, INSERT, UPDATE, DELETE
- INNER JOIN, LEFT JOIN, GROUP BY queries
- Aggregate functions (SUM, AVG, COUNT)

Future Improvements
- Add stored procedures and triggers
- Implement indexing for performance
- Add views and user roles

Learning Objectives
- SQL database design
- Table relationships and keys
- Query optimization
- Data integrity enforcement

Author
Vaidehi Gurav


