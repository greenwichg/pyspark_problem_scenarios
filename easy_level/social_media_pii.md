# Social Media User Data — PySpark Interview Question

A social media company maintains a user information table that includes email addresses and phone numbers. You are tasked with writing a function that processes this data for privacy and analytics.

---

## 🧩 Your Task

Write a function that performs the following transformations on the input DataFrame:

1. **Extract Email Domain:** From the `email` field, extract the domain name (text after `@`).
2. **Anonymize Phone Numbers:** Mask the first six digits of the `phone` number with asterisks (`*`) and retain only the last 4 digits.

The output should include the following columns:

- `anon_phone`: Anonymized phone number (e.g., `***1234`)
- `email_domain`: Extracted domain name (e.g., `example.com`)
- `user_id`: Original user ID

Finally, sort the result by `phone` number in ascending order (before masking).

---

## 🧾 Input Schema

**DataFrame Name:** `input_df`

| Column Name | Data Type |
|-------------|-----------|
| `user_id`   | String    |
| `email`     | String    |
| `phone`     | Integer   |

---

## 📤 Output Schema

| Column Name    | Data Type |
|----------------|-----------|
| `anon_phone`   | String    |
| `email_domain` | String    |
| `user_id`      | Integer   |

---

## 📌 Example

### ✅ Input `input_df`

| user_id | email             | phone      |
|---------|-------------------|------------|
| 1       | alice@example.com | 5551234567 |
| 2       | bob@domain.net    | 5559876543 |
| 3       | carol@email.org   | 5551239876 |
| 4       | dave@site.com     | 5554567890 |
| 5       | eve@platform.io   | 5559871234 |

### ✅ Expected Output

| anon_phone         | email_domain | user_id |
|--------------------|--------------|---------|
| `***1234`    | platform.io  | 5       |
| `***4567`    | example.com  | 1       |
| `***6543`    | domain.net   | 2       |
| `***7890`    | site.com     | 4       |
| `***9876`    | email.org    | 3       |

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

def etl(input_df):
    # Write code here
    pass
```