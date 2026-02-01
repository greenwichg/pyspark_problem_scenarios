# Mining Company Mineral Extraction — PySpark Interview Question

A mining company extracts rare minerals from various locations. It maintains two DataFrames to track its operations.

---

## 🧾 Input Schemas

### `mc_mines`

| Column Name | Data Type | Description                        |
|-------------|-----------|------------------------------------|
| `id`        | Integer   | Unique identifier of the mine.     |
| `name`      | String    | Name of the mine.                  |
| `location`  | String    | Place where the mine is located.   |

### `mc_extraction`

| Column Name | Data Type | Description                                                          |
|-------------|-----------|----------------------------------------------------------------------|
| `mine_id`   | Integer   | Unique identifier of the mine from where the mineral was extracted.  |
| `date`      | Date      | Extraction date.                                                     |
| `mineral`   | String    | Name of the extracted mineral.                                       |
| `quantity`  | Integer   | Quantity of the mineral extracted on that date in kilograms.         |

---

## 🎯 Your Task

Write a function that shows the total quantity of each mineral extracted per location.

- The `total_quantity` column should contain the sum of all quantities of a particular mineral extracted at a particular location.
- The rows should be sorted first by `location` (ascending) and then by `mineral` (ascending).

---

## 📤 Output Schema

| Column Name      | Data Type | Description                                                                       |
|------------------|-----------|-----------------------------------------------------------------------------------|
| `location`       | String    | Place where the mine is located.                                                  |
| `mineral`        | String    | Name of the extracted mineral.                                                    |
| `total_quantity` | Double    | Sum of all quantities of a particular mineral extracted at a particular location. |

---

## 📌 Example

### Input: `mc_mines`

| id | name       | location     |
|----|------------|--------------|
| 1  | Mine Alpha | Australia    |
| 2  | Mine Beta  | Canada       |
| 3  | Mine Gamma | South Africa |

### Input: `mc_extraction`

| mine_id | date       | mineral | quantity |
|---------|------------|---------|----------|
| 1       | 2023-06-30 | Gold    | 1000.0   |
| 2       | 2023-06-30 | Silver  | 1200.0   |
| 3       | 2023-06-30 | Diamond | 800.0    |
| 1       | 2023-06-29 | Gold    | 900.0    |
| 2       | 2023-06-29 | Silver  | 1300.0   |
| 3       | 2023-06-29 | Diamond | 750.0    |

### ✅ Expected Output

| location     | mineral | total_quantity |
|--------------|---------|----------------|
| Australia    | Gold    | 1900           |
| Canada       | Silver  | 2500           |
| South Africa | Diamond | 1550           |

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

def etl(mc_extraction, mc_mines):
    # Write code here
    pass
```