# Thermodynamics Ideal Gas Law — PySpark Interview Question

You are given two DataFrames `df_temperature` and `df_pressure` related to some thermodynamics experiments.

Write a function that combines these DataFrames and creates the `Result` column using the formula for the Ideal Gas Law:

> **Pressure × Temperature = Result**

For each `ExperimentID`, multiply the `Pressure` and `Temperature` to calculate `Result`.

---

## 🧾 Input Schemas

### `df_temperature`

| Column Name    | Data Type | Description                                |
|----------------|-----------|--------------------------------------------|
| `ExperimentID` | integer   | Unique identifier for the experiment.      |
| `Temperature`  | double    | Temperature value for the experiment.      |

### `df_pressure`

| Column Name    | Data Type | Description                                |
|----------------|-----------|--------------------------------------------|
| `ExperimentID` | integer   | Unique identifier for the experiment.      |
| `Pressure`     | double    | Pressure value for the experiment.         |

---

## 📤 Output Schema

| Column Name    | Data Type | Description                                              |
|----------------|-----------|----------------------------------------------------------|
| `ExperimentID` | integer   | Unique identifier for the experiment.                    |
| `Result`       | double    | Product of Pressure and Temperature (Ideal Gas Law).     |

---

## 📌 Constraints

- If an `ExperimentID` is present in one DataFrame but not in the other, **ignore** it. Only return `ExperimentID`s that exist in **both** DataFrames.
- The `ExperimentID` will be unique in each DataFrame.
- The `Temperature` and `Pressure` values are positive and can be assumed to be in appropriate units for the Ideal Gas Law.
- The `ExperimentID` in the output DataFrame should be sorted in **ascending order**.

---

## 📌 Example

### Input: `df_temperature`

| ExperimentID | Temperature |
|--------------|-------------|
| 1.0          | 273.15      |
| 2.0          | 293.15      |
| 3.0          | 313.15      |

### Input: `df_pressure`

| ExperimentID | Pressure |
|--------------|----------|
| 1.0          | 1.0      |
| 3.0          | 2.0      |
| 4.0          | 1.5      |

### ✅ Expected Output

| ExperimentID | Result |
|--------------|--------|
| 1.0          | 273.15 |
| 3.0          | 626.3  |

> Note: `ExperimentID` 2 and 4 are excluded — 2 has no matching pressure, and 4 has no matching temperature.

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

def etl(df_pressure, df_temperature):
    # Write code here
    pass
```