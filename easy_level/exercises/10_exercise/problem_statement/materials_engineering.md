# Materials Engineer Lab Experiments — PySpark Interview Question

You are working as a Materials Engineer and you are required to process two sets of data related to various experiments conducted in your lab.

Write a function that performs several join operations to bring more context to the experiment results. Specifically, join on the `material_id` field that is common between the two DataFrames.

> The join operation should be such that all records from both `df_experiments` and `df_materials` are included, regardless if they have a match on the other DataFrame (full outer join).

---

## 🧾 Input Schemas

### `df_experiments`

| Column Name          | Data Type | Description                                  |
|----------------------|-----------|----------------------------------------------|
| `experiment_id`      | integer   | Unique identifier for the experiment.        |
| `material_id`        | integer   | Identifier of the material used.             |
| `experiment_date`    | string    | Date when the experiment was conducted.      |
| `experiment_results` | float     | Result value of the experiment.              |

### `df_materials`

| Column Name     | Data Type | Description                       |
|-----------------|-----------|-----------------------------------|
| `material_id`   | integer   | Unique identifier for the material. |
| `material_name` | string    | Name of the material.             |
| `material_type` | string    | Type of the material.             |

---

## 📤 Output Schema

| Column Name          | Data Type | Description                                  |
|----------------------|-----------|----------------------------------------------|
| `experiment_id`      | integer   | Unique identifier for the experiment.        |
| `material_id`        | integer   | Identifier of the material used.             |
| `material_name`      | string    | Name of the material.                        |
| `material_type`      | string    | Type of the material.                        |
| `experiment_date`    | string    | Date when the experiment was conducted.      |
| `experiment_results` | float     | Result value of the experiment.              |

---

## 📌 Example

### Input: `df_experiments`

| experiment_id | material_id | experiment_date | experiment_results |
|---------------|-------------|-----------------|--------------------|
| 1             | 101         | 2023-07-01      | 7.6                |
| 2             | 102         | 2023-07-02      | 8.3                |
| 3             | 103         | 2023-07-03      | 6.9                |
| 4             | 101         | 2023-07-04      | 7.2                |

### Input: `df_materials`

| material_id | material_name | material_type |
|-------------|---------------|---------------|
| 101         | Material A    | Type X        |
| 102         | Material B    | Type Y        |
| 104         | Material C    | Type Z        |

### ✅ Expected Output

| experiment_date | experiment_id | experiment_results | material_id | material_name | material_type |
|-----------------|---------------|--------------------|-------------|---------------|---------------|
| 2023-07-01      | 1.0           | 7.6                | 101         | Material A    | Type X        |
| 2023-07-02      | 2.0           | 8.3                | 102         | Material B    | Type Y        |
| 2023-07-03      | 3.0           | 6.9                | 103         |               |               |
| 2023-07-04      | 4.0           | 7.2                | 101         | Material A    | Type X        |
|                 | nan           | nan                | 104         | Material C    | Type Z        |

> Note: `material_id` 103 has no match in `df_materials`, and `material_id` 104 has no match in `df_experiments` — both are retained due to the full outer join.

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

def etl(df_experiments, df_materials):
    # Write code here
    pass
```