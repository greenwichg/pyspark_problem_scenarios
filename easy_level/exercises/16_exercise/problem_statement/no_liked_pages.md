# Facebook Pages With No Likes — SQL Interview Question

You are given two tables with data related to Facebook Pages and the users who liked them. Write a SQL query to find the IDs of all Facebook pages that have not received any likes. The output should be sorted in **ascending order** by page ID.

---

## 🧾 Table Schemas

### `nlp_pages`

| Column Name | Data Type | Description                      |
|-------------|-----------|----------------------------------|
| `page_id`   | integer   | Unique identifier for the page.  |
| `page_name` | varchar   | Name of the Facebook page.       |

### `nlp_page_likes`

| Column Name  | Data Type | Description                                  |
|--------------|-----------|----------------------------------------------|
| `user_id`    | integer   | ID of the user who liked the page.           |
| `page_id`    | integer   | ID of the Facebook page that was liked.      |
| `liked_date` | datetime  | Timestamp when the page was liked.           |

---

## 📌 Example

### ✅ Input: `nlp_pages`

| page_id | page_name             |
|---------|-----------------------|
| 20001   | SQL Masters           |
| 20045   | Brain Boosters        |
| 20701   | Insights for Analysts |

### ✅ Input: `nlp_page_likes`

| user_id | page_id | liked_date          |
|---------|---------|---------------------|
| 111     | 20001   | 2022-04-08 00:00:00 |
| 121     | 20045   | 2022-03-12 00:00:00 |
| 156     | 20001   | 2022-07-25 00:00:00 |

### ✅ Expected Output

| page_id |
|---------|
| 20701   |

> Note: Pages 20001 and 20045 have at least one like each. Page 20701 ("Insights for Analysts") has no entries in `nlp_page_likes`, so it is the only page returned.