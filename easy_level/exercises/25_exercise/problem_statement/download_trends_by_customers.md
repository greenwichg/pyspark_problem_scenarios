# Non-Paying vs Paying User Downloads — PySpark Interview Question

You are given a dataset that tracks daily downloads by users, categorized as either non-paying (free) or paying (premium). Your goal is to identify dates where non-paying users downloaded more than paying users, and report the total number of downloads for both user types on those dates.

---

## 🗃️ Input DataFrame: `adtc_customer`

| Column Name  | Data Type | Description                                        |
|--------------|-----------|----------------------------------------------------|
| `user_id`    | string    | Unique identifier of the user.                     |
| `user_type`  | string    | Type of user: either `"free"` or `"premium"`.      |
| `downloads`  | integer   | Number of downloads on the date.                   |
| `cdate`      | date      | Date of the activity.                              |

---

## 🎯 Output DataFrame

| Column Name             | Data Type |
|-------------------------|-----------|
| `cdate`                 | date      |
| `non_paying_downloads`  | integer   |
| `paying_downloads`      | integer   |

Return only those dates where total downloads from non-paying users exceeded those from paying users. The output must be sorted by `cdate` in **ascending order**.

---

## 📌 Example

### ✅ Input: `adtc_customer`

| user_id | user_type | downloads | cdate      |
|---------|-----------|-----------|------------|
| u1      | free      | 5         | 2024-01-01 |
| u2      | premium   | 3         | 2024-01-01 |
| u3      | free      | 2         | 2024-01-01 |
| u4      | premium   | 6         | 2024-01-02 |
| u5      | free      | 4         | 2024-01-02 |
| u6      | premium   | 2         | 2024-01-03 |
| u7      | free      | 5         | 2024-01-03 |

### ✅ Expected Output

| cdate      | non_paying_downloads | paying_downloads |
|------------|----------------------|------------------|
| 2024-01-01 | 7                    | 3                |
| 2024-01-03 | 5                    | 2                |

> Note: On 2024-01-01, free users downloaded 7 (5 + 2) vs premium users' 3 — non-paying wins. On 2024-01-02, free users downloaded 4 vs premium users' 6 — paying wins, so this date is excluded. On 2024-01-03, free users downloaded 5 vs premium users' 2 — non-paying wins.