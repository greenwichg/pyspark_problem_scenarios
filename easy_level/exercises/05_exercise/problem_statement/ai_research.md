# AI Research Papers & Authors — PySpark Interview Question

You are given two DataFrames:

- `research_papers` (from table `ai_research_papers`) — contains metadata about AI research papers
- `authors` (from table `ai_author`) — contains information about authors and their associated papers

---

## 🎯 Goal

Write a Spark function that:

1. **Joins** the two DataFrames to associate each author with their paper.
2. **Assigns** a row number to each author, restarting from 1 for every `paper_id`.
3. **Returns** the result with the following schema:

---

## 🧾 Input Schema

### Table: `ai_research_papers` → DataFrame: `research_papers`

| Column Name | Data Type | Description                  |
|-------------|-----------|------------------------------|
| `paper_id`  | string    | Unique ID for the paper      |
| `title`     | string    | Title of the research paper  |
| `year`      | integer   | Publication year             |

### Table: `ai_author` → DataFrame: `authors`

| Column Name | Data Type | Description                       |
|-------------|-----------|-----------------------------------|
| `paper_id`  | string    | ID of the research paper          |
| `author_id` | string    | Unique ID of the author           |
| `name`      | string    | Full name of the author           |

---

## 📤 Output Schema

| Column Name  | Data Type |
|--------------|-----------|
| `paper_id`   | string    |
| `author_id`  | string    |
| `name`       | string    |
| `row_number` | integer   |

---

## 📘 Sample Input

### DataFrame: `research_papers`

| paper_id | title                                  | year |
|----------|----------------------------------------|------|
| P1       | Deep Learning Techniques in AI         | 2019 |
| P2       | Reinforcement Learning for Robotics    | 2020 |
| P3       | Natural Language Processing Advances   | 2021 |

### DataFrame: `authors`

| paper_id | author_id | name            |
|----------|-----------|-----------------|
| P1       | A1        | Alice Smith     |
| P1       | A2        | Bob Johnson     |
| P2       | A3        | Carol Williams  |
| P2       | A4        | David Brown     |
| P2       | A5        | Eva Davis       |
| P3       | A6        | Frank Wilson    |
| P3       | A7        | Grace Lee       |

---

## ✅ Expected Output

| paper_id | author_id | name            | row_number |
|----------|-----------|-----------------|------------|
| P1       | A1        | Alice Smith     | 1          |
| P1       | A2        | Bob Johnson     | 2          |
| P2       | A3        | Carol Williams  | 1          |
| P2       | A4        | David Brown     | 2          |
| P2       | A5        | Eva Davis       | 3          |
| P3       | A6        | Frank Wilson    | 1          |
| P3       | A7        | Grace Lee       | 2          |

---

## 💡 Notes

- Use `row_number()` from `org.apache.spark.sql.expressions.Window`
- Partition by `paper_id` to reset the count for each paper
- No specific order for authors is required unless mentioned

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

def etl(authors, research_papers):
    # Write code here
    pass
```