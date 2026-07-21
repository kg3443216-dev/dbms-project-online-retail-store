# 🛒 Online Retail Store Database Management System

A SQL-based Online Retail Store database project developed using **MySQL**. This project demonstrates database design, table relationships, CRUD operations, JOINs, aggregate functions, and reporting queries.

---

## 📌 Features

- Customer Management
- Product Management
- Order Management
- Payment Tracking
- Foreign Key Relationships
- Aggregate Reports
- Sales Analysis

---

## 🗄️ Database Schema

The project contains the following tables:

- Customers
- Products
- Orders
- Order_Details
- Payments

---

## 🛠 Technologies Used

- MySQL
- SQL
- MySQL Workbench

---

## Entity Relationship

Customers (1) ----< Orders (1) ----< Order_Details >---- (1) Products

                        |

                        |

                    Payments

---

## Tables

### Customers

| Column | Type |
|---------|------|
| customer_id | INT |
| name | VARCHAR(50) |
| email | VARCHAR(50) |
| phone | VARCHAR(15) |
| city | VARCHAR(50) |

---

### Products

| Column | Type |
|---------|------|
| product_id | INT |
| product_name | VARCHAR(100) |
| category | VARCHAR(50) |
| price | DECIMAL(10,2) |
| stock | INT |

---

### Orders

| Column | Type |
|---------|------|
| order_id | INT |
| customer_id | INT |
| order_date | DATE |
| total_amount | DECIMAL(10,2) |

---

### Order Details

| Column | Type |
|---------|------|
| order_detail_id | INT |
| order_id | INT |
| product_id | INT |
| quantity | INT |
| price | DECIMAL(10,2) |

---

### Payments

| Column | Type |
|---------|------|
| payment_id | INT |
| order_id | INT |
| payment_method | VARCHAR(20) |
| payment_status | VARCHAR(20) |
| payment_date | DATE |

---

## Sample SQL Queries

### Customer Orders

```sql
SELECT c.name,
       o.order_id,
       o.order_date,
       o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;
```

### Best Selling Products

```sql
SELECT p.product_name,
       SUM(od.quantity) AS TotalSold
FROM products p
JOIN order_details od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY TotalSold DESC;
```

### Total Sales

```sql
SELECT SUM(total_amount)
FROM orders;
```

### Pending Payments

```sql
SELECT *
FROM payments
WHERE payment_status='Pending';
```

### Customer Spending

```sql
SELECT c.name,
       SUM(o.total_amount) AS TotalSpent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.name
ORDER BY TotalSpent DESC;
```

---

## Learning Outcomes

- Database Design
- Primary Key
- Foreign Key
- SQL Constraints
- Joins
- Aggregate Functions
- GROUP BY
- ORDER BY
- Data Analysis Queries

---

## Author

**Khushi Gupta**
