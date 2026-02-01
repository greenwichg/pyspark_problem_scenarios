# Viewership by Device Type — SQL Interview Question

Given a table `da_viewership` that tracks user viewership data, write a query to calculate:

1. The total number of views from laptops, labeled as `laptop_views`.
2. The total number of views from mobile devices, where mobile devices are defined as the combined views from **tablets** and **phones**, labeled as `mobile_views`.

---

## 🗃️ Table: `da_viewership`

| Column Name   | Data Type | Description                                  |
|---------------|-----------|----------------------------------------------|
| `user_id`     | INTEGER   | ID of the user.                              |
| `device_type` | VARCHAR   | Type of device used (laptop, tablet, phone). |
| `view_time`   | TIMESTAMP | Timestamp when the view occurred.            |

---

## 📌 Example

### ✅ Input: `da_viewership`

| user_id | device_type | view_time           |
|---------|-------------|---------------------|
| 123     | tablet      | 01/02/2022 00:00:00 |
| 125     | laptop      | 01/07/2022 00:00:00 |
| 128     | laptop      | 02/09/2022 00:00:00 |
| 129     | phone       | 02/09/2022 00:00:00 |
| 145     | tablet      | 02/24/2022 00:00:00 |

### ✅ Expected Output

| laptop_views | mobile_views |
|--------------|--------------|
| 2            | 3            |

> Note: There are 2 laptop views (users 125 and 128). Mobile views combine tablets and phones — 2 tablets (users 123 and 145) + 1 phone (user 129) = 3 mobile views.