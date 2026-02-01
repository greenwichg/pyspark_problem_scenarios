# Product Average Star Rating by Month — SQL Interview Question

Given a `mr_reviews` table, write a query to calculate the average star rating for each product, grouped by month. The output should display the month as a numerical value (`mth`), the product ID (`product`), and the average star rating rounded to two decimal places (`avg_stars`). The results should be sorted first by month (`mth`) and then by product ID (`product`).

---

## 🗃️ Table: `mr_reviews`

| Column Name   | Data Type | Description                                  |
|---------------|-----------|----------------------------------------------|
| `review_id`   | INTEGER   | Unique identifier for the review.            |
| `user_id`     | INTEGER   | ID of the user who submitted the review.     |
| `submit_date` | TIMESTAMP | Timestamp when the review was submitted.     |
| `product_id`  | INTEGER   | ID of the product being reviewed.            |
| `stars`       | INTEGER   | Star rating given by the user.               |
| `month`       | INTEGER   | Month extracted from the submit date.        |

---

## 📌 Example

### ✅ Input: `mr_reviews`

| review_id | user_id | submit_date         | product_id | stars | month |
|-----------|---------|---------------------|------------|-------|-------|
| 6171      | 123     | 2022-06-08 00:00:00 | 50001      | 4     | 6     |
| 7802      | 265     | 2022-06-10 00:00:00 | 69852      | 4     | 6     |
| 5293      | 362     | 2022-06-18 00:00:00 | 50001      | 3     | 6     |
| 6352      | 192     | 2022-07-26 00:00:00 | 69852      | 3     | 7     |
| 4517      | 981     | 2022-07-05 00:00:00 | 69852      | 2     | 7     |

### ✅ Expected Output

| mth | product | avg_stars |
|-----|---------|-----------|
| 6   | 50001   | 3.5       |
| 6   | 69852   | 4.0       |
| 7   | 69852   | 2.5       |

> Note: Product 50001 only appears in month 6 (avg of 4 and 3 = 3.5). Product 69852 appears in both months — month 6 has a single review of 4 stars, and month 7 averages ratings of 3 and 2 to give 2.5.