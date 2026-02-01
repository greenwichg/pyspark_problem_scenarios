# Insurance Customer Data Consolidation — PySpark Interview Question

An insurance agency maintains customer data in two separate tables, but now wants to consolidate them into one. Your task is to write a function that merges both input DataFrames and returns all rows.

There is no need to deduplicate — simply return a union of the two datasets.

---

## 📋 Input DataFrames

### `ic_data_1`

| Column Name   | Data Type |
|---------------|-----------|
| `customer_id` | Integer   |
| `first_name`  | String    |
| `last_name`   | String    |
| `age`         | Integer   |
| `policy_type` | String    |

### `ic_data_2`

| Column Name   | Data Type |
|---------------|-----------|
| `customer_id` | Integer   |
| `first_name`  | String    |
| `last_name`   | String    |
| `age`         | Integer   |
| `policy_type` | String    |

---

## 🧪 Example

### Input: `ic_data_1`

| customer_id | first_name | last_name | age | policy_type |
|-------------|------------|-----------|-----|-------------|
| 1           | Alice      | Smith     | 30  | auto        |
| 2           | Bob        | Johnson   | 40  | home        |
| 3           | Carol      | Williams  | 35  | life        |

### Input: `ic_data_2`

| customer_id | first_name | last_name | age | policy_type |
|-------------|------------|-----------|-----|-------------|
| 4           | Dave       | Brown     | 45  | auto        |
| 5           | Eve        | Jones     | 55  | health      |
| 6           | Frank      | Davis     | 60  | life        |

### ✅ Expected Output

| age | customer_id | first_name | last_name | policy_type |
|-----|-------------|------------|-----------|-------------|
| 30  | 1           | Alice      | Smith     | auto        |
| 35  | 3           | Carol      | Williams  | life        |
| 40  | 2           | Bob        | Johnson   | home        |
| 45  | 4           | Dave       | Brown     | auto        |
| 55  | 5           | Eve        | Jones     | health      |
| 60  | 6           | Frank      | Davis     | life        |

---

## 🔧 Requirements

- Return a DataFrame containing all rows from both input DataFrames.
- The final output should be sorted by `age` in ascending order.
- The column order in the output should be:
    - `age`
    - `customer_id`
    - `first_name`
    - `last_name`
    - `policy_type`

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

def etl(ic_data_1, ic_data_2):
    # Write your code here
    return df3 = ic_data_1.union(ic_data_2)
```