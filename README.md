# 📊 Task 6: Sales Trend Analysis Using Aggregations

## 🧑‍💼 Internship: Data Analyst  
This task is part of a data analyst internship program focused on analyzing sales trends using SQL aggregation techniques.

---

## 🎯 Objective
Analyze **monthly revenue** and **order volume** using SQL queries on a simulated e-commerce sales dataset.

---

## 🛠 Tools Used
- MySQL / PostgreSQL / SQLite
- SQL
- Text Editor (for writing queries)
- Dataset: `online_sales` table from `sales.csv`

---

## 🧾 Dataset Structure (`online_sales`)
| Column            | Description                     |
|------------------|---------------------------------|
| transaction_id    | Unique transaction ID           |
| date              | Date of the order               |
| product_category  | Category of the product         |
| product_name      | Name of the product             |
| units_sold        | Units sold                      |
| unit_price        | Price per unit                  |
| total_revenue     | Total revenue from the order    |
| region            | Geographic region               |
| payment_method    | Payment method used             |

---

## 📌 Tasks Performed
- Loaded dataset into MySQL database.
- Performed data aggregation using SQL queries:
  - Calculated monthly revenue.
  - Counted order volumes.
  - Identified top 3 months by revenue.
  - Analyzed revenue by product category, region, and payment method.

---

## 📄 Files Included
- `Task6DA.sql`: SQL script file containing all the queries used.
- `TASK 6 DA.pdf`: Problem statement and instructions.

---

## 🧪 Key SQL Concepts Demonstrated
- `GROUP BY` for monthly/yearly aggregation
- `SUM()`, `COUNT(DISTINCT ...)` for aggregation
- `ORDER BY` to sort results
- `LIMIT` to extract top-N results
- `DATE_FORMAT()` and `EXTRACT()` to handle date-based grouping


## ✅ Output (Sample Queries)
### Top 3 months by sales:
```sql
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(total_revenue) AS monthly_revenue
FROM 
    online_sales
GROUP BY 
    DATE_FORMAT(date, '%Y-%m')
ORDER BY 
    monthly_revenue DESC
LIMIT 3;
