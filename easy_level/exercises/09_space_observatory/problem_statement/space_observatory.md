# Space Observatory — PySpark Interview Question

You are an Astronomer in a Space Observatory. You are given two DataFrames `df_star` and `df_planet`.

Write a function that performs multiple self joins to return the following output schema.

---

## 🧾 Input Schemas

### `df_star`

| Column Name | Data Type | Description                                      |
|-------------|-----------|--------------------------------------------------|
| `id`        | integer   | Unique identifier for the star.                  |
| `name`      | string    | Name of the star.                                |
| `color`     | string    | Color of the star.                               |
| `type`      | string    | Type of the star (e.g., Dwarf, Giant, SuperGiant). |
| `distance`  | float     | Distance of the star from earth in light years.  |

### `df_planet`

| Column Name | Data Type | Description                                                        |
|-------------|-----------|--------------------------------------------------------------------|
| `id`        | integer   | Unique identifier for the planet.                                  |
| `name`      | string    | Name of the planet.                                                |
| `star_id`   | integer   | Identifier of the star that the planet orbits around.              |
| `type`      | string    | Type of the planet (e.g., Gas Giant, Terrestrial).                 |
| `distance`  | float     | Distance of the planet from its star in Astronomical Units (AU).   |

---

## 📤 Output Schema

| Column Name            | Data Type | Description                                                      |
|------------------------|-----------|------------------------------------------------------------------|
| `star_name`            | string    | Name of the star.                                                |
| `star_color`           | string    | Color of the star.                                               |
| `star_type`            | string    | Type of the star.                                                |
| `planet_name`          | string    | Name of the planet.                                              |
| `planet_type`          | string    | Type of the planet.                                              |
| `distance_star_earth`  | float     | Distance of the star from earth in light years.                  |
| `distance_planet_star` | float     | Distance of the planet from its star in Astronomical Units (AU). |

---

## 📌 Example

### Input: `df_star`

| id | name   | color  | type               | distance |
|----|--------|--------|--------------------|----------|
| 1  | Sun    | Yellow | Dwarf              | 0.0      |
| 2  | Sirius | Blue   | Main Sequence Star | 8.6      |
| 3  | Vega   | Blue   | Main Sequence Star | 25.0     |

### Input: `df_planet`

| id | name     | star_id | type        | distance |
|----|----------|---------|-------------|----------|
| 1  | Mercury  | 1       | Terrestrial | 0.39     |
| 2  | Venus    | 1       | Terrestrial | 0.72     |
| 3  | Mars     | 1       | Terrestrial | 1.52     |
| 4  | Sirius B | 2       | Gas Giant   | 20.0     |
| 5  | Vega b   | 3       | Gas Giant   | 25.0     |

### ✅ Expected Output

| distance_planet_star | distance_star_earth | planet_name | planet_type | star_color | star_name | star_type          |
|----------------------|---------------------|-------------|-------------|------------|-----------|--------------------|
| 0.39                 | 0.0                 | Mercury     | Terrestrial | Yellow     | Sun       | Dwarf              |
| 0.72                 | 0.0                 | Venus       | Terrestrial | Yellow     | Sun       | Dwarf              |
| 1.52                 | 0.0                 | Mars        | Terrestrial | Yellow     | Sun       | Dwarf              |
| 20.0                 | 8.6                 | Sirius B    | Gas Giant   | Blue       | Sirius    | Main Sequence Star |
| 25.0                 | 25.0                | Vega b      | Gas Giant   | Blue       | Vega      | Main Sequence Star |

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

def etl(df_planet, df_star):
    # Write code here
    pass
```