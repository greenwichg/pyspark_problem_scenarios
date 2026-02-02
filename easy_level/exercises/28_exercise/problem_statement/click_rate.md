# Mobile App Click-Through Rate (CTR) — SQL Interview Question

Assume you have an event analytics table for a mobile app. Write a query to calculate the click-through rate (CTR) for each app in the year 2022. Round the CTR to two decimal places.

---

## 📊 CTR Calculation

**Percentage of click-through rate (CTR)** = `100.0 × Number of clicks / Number of impressions`

> **Important:** To avoid integer division, multiply the CTR by `100.0`, not `100`.

---

## 🗃️ Table Schema: `cr_events`

| Column Name  | Type      | Description                                          |
|--------------|-----------|------------------------------------------------------|
| `app_id`     | integer   | Unique identifier for the app.                       |
| `event_type` | varchar   | Type of event (e.g., "impression", "click").         |
| `timestamp`  | timestamp | Timestamp when the event occurred.                   |

---

## 📌 Example

### ✅ Input: `cr_events`

| app_id | event_type | timestamp           |
|--------|------------|---------------------|
| 123    | impression | 07/18/2022 11:36:12 |
| 123    | impression | 07/18/2022 11:37:12 |
| 123    | click      | 07/18/2022 11:37:42 |
| 234    | impression | 07/18/2022 14:15:12 |
| 234    | click      | 07/18/2022 14:16:12 |

### ✅ Expected Output

| app_id | ctr    |
|--------|--------|
| 123    | 50.00  |
| 234    | 100.00 |

---

## 📘 Explanation

- **App 123:** 1 click out of 2 impressions → CTR = `100.0 × 1 / 2 = 50.00%`
- **App 234:** 1 click out of 1 impression → CTR = `100.0 × 1 / 1 = 100.00%`