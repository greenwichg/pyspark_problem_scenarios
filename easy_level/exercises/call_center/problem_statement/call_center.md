# Telecommunications Calls — PySpark Interview Question

You are given two DataFrames, `calls_df` and `customers_df`, which contain information about calls made by customers of a telecommunications company and information about the customers, respectively.

---

## 📘 Input Schemas

### `calls_df`

| Column     | Type    | Description                                          |
|------------|---------|------------------------------------------------------|
| `call_id`  | integer | Unique identifier of each call.                      |
| `cust_id`  | integer | Unique identifier of the customer who made the call. |
| `date`     | string  | Date when the call was made (`yyyy-MM-dd`).          |
| `duration` | integer | Duration of the call in seconds.                     |

### `customers_df`

| Column       | Type    | Description                                              |
|--------------|---------|----------------------------------------------------------|
| `cust_id`    | integer | Unique identifier of each customer.                      |
| `name`       | string  | Name of the customer.                                    |
| `state`      | string  | State where the customer lives.                          |
| `tenure`     | integer | Number of months the customer has been with the company. |
| `occupation` | string  | Occupation of the customer.                              |

---

## 🎯 Your Task

Write a function that returns the number of distinct customers who made calls on each date, along with the total duration of calls made on each date.

---

## 📤 Output Schema

| Column           | Type    | Description                                                  |
|------------------|---------|--------------------------------------------------------------|
| `date`           | string  | Date when the calls were made (`yyyy-MM-dd`).                |
| `num_customers`  | integer | Number of distinct customers who made calls on that date.    |
| `total_duration` | integer | Total duration of calls made on that date in seconds.        |

> You may assume that the upstream DataFrames are not empty.

---

## 📌 Example

### ✅ Input `calls_df`

| call_id | cust_id | date       | duration |
|---------|---------|------------|----------|
| 1       | 1       | 2022-01-01 | 100      |
| 2       | 2       | 2022-01-01 | 200      |
| 3       | 1       | 2022-01-02 | 150      |
| 4       | 3       | 2022-01-02 | 300      |
| 5       | 2       | 2022-01-03 | 50       |

### ✅ Input `customers_df`

| cust_id | name    | state | tenure | occupation |
|---------|---------|-------|--------|------------|
| 1       | Alice   | NY    | 10     | doctor     |
| 2       | Bob     | CA    | 12     | lawyer     |
| 3       | Charlie | TX    | 6      | engineer   |

### ✅ Expected Output

| date       | num_customers | total_duration |
|------------|---------------|----------------|
| 2022-01-01 | 2             | 300            |
| 2022-01-02 | 2             | 450            |
| 2022-01-03 | 1             | 50             |

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

def etl(calls_df, customers_df):
    # Write code here
    pass
```