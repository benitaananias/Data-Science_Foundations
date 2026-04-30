CREATE DATABASE QuickMart;

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    stock_quantity INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    age INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    employee_id INT,
    quantity INT,
    sale_date DATE
);


INSERT INTO Employees(EmployeeId,Name, Department,Salary,HireDate)
VALUES 
(1, 'Alice Johnson', 'Sales', 55000, '2022-01-15'),
(2, 'Bob Smith', 'IT', 65000, '2021-06-20'),
(3, 'Charlie Brown', 'Sales', 52000, '2023-03-10'),
(4, 'Diana Prince', 'HR', 60000, '2020-11-05'),
(5, 'Edward Norton', 'Marketing', 58000, '2022-08-12'),
(6, 'Fiona Glenanne', 'Sales', 54000, '2023-01-25'),
(7, 'George Miller', 'IT', 67000, '2021-02-14'),
(8, 'Hannah Abbott', 'Marketing', 59000, '2022-12-01'),
(9, 'Ian Wright', 'Sales', 53000, '2023-05-18'),
(10, 'Julia Roberts', 'Finance', 72000, '2019-09-30');


INSERT INTO products VALUES 
(1, 'Laptop', 'Electronics', 1200, 50),
(2, 'Smartphone', 'Electronics', 800, 100),
(3, 'Coffee Maker', 'Home Appliances', 85, 30),
(4, 'Desk Chair', 'Furniture', 150, 20),
(5, 'Blender', 'Home Appliances', 45, 40),
(6, 'Headphones', 'Electronics', 120, 75),
(7, 'Monitor', 'Electronics', 300, 25),
(8, 'Bookshelf', 'Furniture', 90, 15),
(9, 'Toaster', 'Home Appliances', 25, 50),
(10, 'Water Bottle', 'Accessories', 15, 200),
(11, 'Keyboard', 'Electronics', 60, 60),
(12, 'Backpack', 'Accessories', 55, 80),
(13, 'Gaming Mouse', 'Electronics', 40, 90),
(14, 'Floor Lamp', 'Furniture', 70, 12),
(15, 'Air Fryer', 'Home Appliances', 110, 18);


INSERT INTO customers VALUES 
(1, 'Oluwadata James', 'New York', 28),
(2, 'Kelvin Kofoworola', 'Los Angeles', 34),
(3, 'Mike Damilola', 'Chicago', 26),
(4, 'Rachel Zane', 'New York', 29),
(5, 'Harvey Bukola', 'New York', 45),
(6, 'Donna Paulsen', 'Chicago', 38),
(7, 'Louis Litt', 'Boston', 42),
(8, 'Jessica Pearson', 'Chicago', 50),
(9, 'Peter Parker', 'Queens', 21),
(10, 'Bruce Johnson Lola', 'Gotham', 35),
(11, 'Clark Kent', 'Metropolis', 32),
(12, 'Diana Prince', 'Themyscira', 30);






INSERT INTO sales VALUES 
(1, 1, 1, 1, 1, '2024-01-05'), (2, 5, 2, 3, 2, '2024-01-06'),
(3, 10, 3, 6, 1, '2024-01-07'), (4, 2, 4, 1, 1, '2024-01-08'),
(5, 12, 5, 9, 3, '2024-01-09'), (6, 3, 6, 3, 1, '2024-01-10'),
(7, 15, 7, 6, 1, '2024-01-11'), (8, 6, 8, 1, 2, '2024-01-12'),
(9, 1, 9, 3, 1, '2024-01-13'), (10, 11, 10, 6, 1, '2024-01-14'),
(11, 13, 11, 9, 2, '2024-01-15'), (12, 4, 12, 1, 1, '2024-01-16'),
(13, 7, 1, 3, 1, '2024-01-17'), (14, 8, 2, 6, 1, '2024-01-18'),
(15, 9, 3, 9, 4, '2024-01-19'), (16, 2, 4, 1, 1, '2024-01-20'),
(17, 14, 5, 3, 1, '2024-01-21'), (18, 5, 6, 6, 2, '2024-01-22'),
(19, 10, 7, 9, 5, '2024-01-23'), (20, 1, 8, 1, 1, '2024-01-24');






-- Display all records from each table
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM sales;


--Select product_name and price
SELECT product_name, price 
FROM products;


--Select unique category 
SELECT dIstinct category 
FROM products;




-- Products priced over 50
SELECT * FROM products 
WHERE price > 50;


-- Employees in the Sales department
SELECT * FROM employees 
WHERE department = 'Sales';


-- Sales within a specific date range (January 2024)
SELECT * FROM sales 
WHERE sale_date BETWEEN '2024-01-01' AND '2024-01-15';


-- Products by price (High to Low)
SELECT * FROM products 
ORDER BY price DESC;


--Customers by age (Youngest to Oldest)
SELECT * FROM customers 
ORDER BY age;


-- Total number of sales recorded
SELECT COUNT(*) AS total_sales 
FROM sales;


-- Average price of all products
SELECT AVG(price) AS average_product_price 
FROM products;


-- Sales handled by each employee
SELECT employee_id, COUNT(sale_id) AS sales_count 
FROM sales 
GROUP BY employee_id;


-- Average salary per department
SELECT department, AVG(salary) AS avg_dept_salary 
FROM employees 
GROUP BY department;


-- Total quantity of products sold per category
SELECT p.category, SUM(s.quantity) AS total_quantity_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;
