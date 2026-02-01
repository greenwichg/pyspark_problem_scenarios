# Social Media Post — SQL Interview Question

You are given a table named `correct_social_media_post` that contains posts from various social media platforms. Each post includes metadata like likes, shares, and the post content.

---

## 🎯 Your Task

Write a SQL query that performs the following operations:

1. **Replace** every case-sensitive occurrence of `"Python"` with `"PySpark"` in the `text` column.
2. **Return** all columns but in the following specific order:
    - `comments`
    - `date`
    - `id`
    - `likes`
    - `platform`
    - `shares`
    - `text`
3. **Sort** the final output by `comments` in ascending order.

---

## 📘 Input Table — `correct_social_media_post`

| id | text                                          | date       | likes | comments | shares | platform  |
|----|-----------------------------------------------|------------|-------|----------|--------|-----------|
| 1  | This is a Python post.                        | 2022-03-01 | 10    | 3        | 2      | Twitter   |
| 2  | Another post about Python.                    | 2022-03-02 | 20    | 5        | 3      | Instagram |
| 3  | Python is great for data analysis.            | 2022-03-03 | 30    | 2        | 4      | Facebook  |
| 4  | I am learning Python for machine learning.   | 2022-03-04 | 40    | 7        | 5      | Twitter   |
| 5  | Python vs. R for data science.                | 2022-03-05 | 50    | 9        | 6      | Instagram |
| 6  | Python web development is awesome.            | 2022-03-06 | 60    | 1        | 1      | Facebook  |
| 7  | Python for finance.                           | 2022-03-07 | 70    | 4        | 3      | Twitter   |
| 8  | Python libraries for data visualization.      | 2022-03-08 | 80    | 6        | 2      | Instagram |
| 9  | Why Python is the best programming language.  | 2022-03-09 | 90    | 3        | 1      | Facebook  |
| 10 | Python for data engineering.                  | 2022-03-10 | 100   | 8        | 7      | Twitter   |

---

## 📤 Expected Output

| comments | date       | id | likes | platform  | shares | text                                            |
|----------|------------|----|-------|-----------|--------|-------------------------------------------------|
| 1        | 2022-03-06 | 6  | 60    | Facebook  | 1      | PySpark web development is awesome.             |
| 2        | 2022-03-03 | 3  | 30    | Facebook  | 4      | PySpark is great for data analysis.             |
| 3        | 2022-03-01 | 1  | 10    | Twitter   | 2      | This is a PySpark post.                         |
| 3        | 2022-03-09 | 9  | 90    | Facebook  | 1      | Why PySpark is the best programming language.   |
| 4        | 2022-03-07 | 7  | 70    | Twitter   | 3      | PySpark for finance.                            |
| 5        | 2022-03-02 | 2  | 20    | Instagram | 3      | Another post about PySpark.                     |
| 6        | 2022-03-08 | 8  | 80    | Instagram | 2      | PySpark libraries for data visualization.       |
| 7        | 2022-03-04 | 4  | 40    | Twitter   | 5      | I am learning PySpark for machine learning.     |
| 8        | 2022-03-10 | 10 | 100   | Twitter   | 7      | PySpark for data engineering.                   |
| 9        | 2022-03-05 | 5  | 50    | Instagram | 6      | PySpark vs. R for data science.                 |

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

def etl(social_media):
    # Write code here
    pass
```