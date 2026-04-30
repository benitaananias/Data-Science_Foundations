SQL Practice — QuickMart Sales Database

Purpose: To create and query a relational database for a supermarket (QuickMart) sales system using PostgreSQL.

What This Covers
- Database Creation: `CREATE DATABASE QuickMart`
- Table Design: Employees, Products, Customers, Sales with proper primary keys
- Data Insertion: Populated with realistic sample data
- Core Queries: SELECT, WHERE, ORDER BY, GROUP BY, JOIN, aggregate functions

Key Queries Included

1. *
2. Basic SELECTs
   - List all products with price > ₦50
   - Filter employees by department (Sales)

3. Aggregations
   - Total number of sales recorded
   - Average salary per department
   - Total quantity sold per product category

4. JOINS
   - Total quantity sold per category — joins `sales` and `products` tables

5. Data Ordering & Filtering
   - Products ordered by price (high to low)
   - Sales within January 2024 date range

Sample Data Context
- Currency: Prices in USD for simplicity, but structure works for NGN too
- Customers: Mix of Nigerian and US names/cities for practice diversity
- Products: Electronics, Home Appliances, Furniture, Accessories

How to Run
1. Run the `CREATE DATABASE` and `CREATE TABLE` statements first
2. Execute `INSERT` statements to populate data  
3. Run SELECT queries to test

Skills Demonstrated
Relational schema design, CRUD operations, filtering, grouping, joining tables.
