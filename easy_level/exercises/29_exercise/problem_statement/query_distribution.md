# Employee Query Histogram — SQL Interview Question

You are tasked with analyzing the activity of employees within a database management system by examining the SQL queries they have executed. The goal is to generate data for a histogram that displays:

1. The number of unique queries executed by each employee during the third quarter of 2023 (from July 1 to September 30).
2. The count of employees who did not execute any queries during this period.

---

## 🎯 Final Output Requirements

The final output should include:

- A histogram where each category corresponds to a specific number of unique queries.
- The count of employees who executed that number of unique queries.

---

## 🗃️ Table Schemas

### `qd_queries`

| Column Name        | Data Type | Description                                  |
|--------------------|-----------|----------------------------------------------|
| `employee_id`      | integer   | ID of the employee who executed the query.   |
| `query_id`         | integer   | Unique identifier for the query.             |
| `query_starttime`  | timestamp | Timestamp when the query started execution.  |
| `execution_time`   | integer   | Execution time of the query (in milliseconds).|

### `qd_employees`

| Column Name    | Data Type | Description                      |
|----------------|-----------|----------------------------------|
| `employee_id`  | integer   | Unique identifier for the employee. |
| `full_name`    | varchar   | Full name of the employee.       |
| `gender`       | varchar   | Gender of the employee.          |

---

## 📌 Example

### ✅ Input: `qd_queries`

| employee_id | query_id | query_starttime     | execution_time |
|-------------|----------|---------------------|----------------|
| 226         | 856987   | 07/01/2023 01:04:43 | 2698           |
| 132         | 286115   | 07/01/2023 03:25:12 | 2705           |
| 221         | 33683    | 07/01/2023 04:34:38 | 91             |
| 240         | 17745    | 07/01/2023 14:33:47 | 2093           |
| 110         | 413477   | 07/02/2023 10:55:14 | 470            |

### ✅ Input: `qd_employees`

| employee_id | full_name         | gender |
|-------------|-------------------|--------|
| 1           | Judas Beardon     | Male   |
| 2           | Lainey Franciotti | Female |
| 3           | Ashbey Strahan    | Male   |
| 226         | Employee A        | Male   |
| 132         | Employee B        | Female |
| 221         | Employee C        | Male   |
| 240         | Employee D        | Male   |
| 110         | Employee E        | Female |

### ✅ Expected Output

| unique_queries | employee_count |
|----------------|----------------|
| 0              | 3              |
| 1              | 2              |
| 2              | 1              |
| 3              | 1              |

---

## 📘 Explanation

- **0 unique queries:** Employees 1, 2, and 3 did not execute any queries during Q3 2023 → 3 employees
- **1 unique query:** Employees who executed exactly 1 unique query → 2 employees
- **2 unique queries:** Employees who executed exactly 2 unique queries → 1 employee
- **3 unique queries:** Employees who executed exactly 3 unique queries → 1 employee

> Note: The histogram buckets each employee by their count of unique queries executed during the third quarter of 2023, then counts how many employees fall into each bucket.