# Employee Payroll Calculation — PySpark Interview Question

You work in the payroll department and are asked to process the company's payroll data. You are given two DataFrames: `employees` and `payroll`. `employees` contains employee information, and `payroll` contains the payroll data.

Write a function that returns the calculated pay for each employee.

---

## 🧾 Input Schemas

### `rp_employees`

| Column Name   | Data Type |
|---------------|-----------|
| `employee_id` | Integer   |
| `name`        | String    |
| `age`         | Integer   |
| `position`    | String    |

### `rp_payroll`

| Column Name    | Data Type |
|----------------|-----------|
| `employee_id`  | Integer   |
| `hours_worked` | Float     |
| `hourly_rate`  | Float     |

---

## 📤 Output Schema

| Column Name   | Data Type |
|---------------|-----------|
| `employee_id` | Integer   |
| `name`        | String    |
| `position`    | String    |
| `pay`         | Float     |

---

## 💰 Pay Calculation Rules

- If an employee works **less than or equal to 40 hours**, their pay is equal to the product of the hours worked and the hourly rate.
- If an employee works **more than 40 hours**, they are paid the regular hourly rate for the first 40 hours and **1.5x** the hourly rate for any hours worked above 40.

---

## 📌 Example

### Input: `rp_employees`

| employee_id | name  | age | position          |
|-------------|-------|-----|-------------------|
| 1           | Alice | 25  | Software Engineer |
| 2           | Bob   | 30  | Data Analyst      |
| 3           | Carol | 28  | Product Manager   |
| 4           | Dave  | 24  | Software Engineer |

### Input: `rp_payroll`

| employee_id | hours_worked | hourly_rate |
|-------------|--------------|-------------|
| 1           | 45.0         | 30.0        |
| 2           | 38.0         | 25.0        |
| 3           | 41.5         | 35.0        |
| 4           | 40.0         | 28.0        |

### ✅ Expected Output

| employee_id | name  | pay     | position          |
|-------------|-------|---------|-------------------|
| 1           | Alice | 1425.00 | Software Engineer |
| 2           | Bob   | 950.00  | Data Analyst      |
| 3           | Carol | 1478.75 | Product Manager   |
| 4           | Dave  | 1120.00 | Software Engineer |

---

## 💻 Starter Code

```python
from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(rp_employees, rp_payroll):
    # Write code here
    pass
```