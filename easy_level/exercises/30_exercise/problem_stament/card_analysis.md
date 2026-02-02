# Credit Card Issuance Disparity — SQL Interview Question

Your team is analyzing the performance of various credit cards over the months to assess the disparity in issuance. Write a query that identifies each credit card and calculates the difference in the number of issued cards between the month with the highest issuance and the lowest issuance. Display the results in descending order of the difference.

---

## 🗃️ Table Schema: `ca_monthly_cards_issued`

| Column Name     | Data Type | Description                                  |
|-----------------|-----------|----------------------------------------------|
| `card_name`     | varchar   | Name of the credit card.                     |
| `issued_amount` | integer   | Number of cards issued in that month.        |
| `issue_month`   | integer   | Month when the cards were issued.            |
| `issue_year`    | integer   | Year when the cards were issued.             |

---

## 📌 Example

### ✅ Input: `ca_monthly_cards_issued`

| card_name     | issued_amount | issue_month | issue_year |
|---------------|---------------|-------------|------------|
| Gold Card     | 30000         | 1           | 2023       |
| Gold Card     | 40000         | 2           | 2023       |
| Gold Card     | 35000         | 3           | 2023       |
| Gold Card     | 45000         | 4           | 2023       |
| Platinum Card | 80000         | 1           | 2023       |
| Platinum Card | 85000         | 2           | 2023       |
| Platinum Card | 82000         | 3           | 2023       |

### ✅ Expected Output

| card_name     | difference |
|---------------|------------|
| Gold Card     | 15000      |
| Platinum Card | 5000       |

---

## 📘 Explanation

- **Gold Card:** Maximum issuance = 45,000 (month 4), Minimum issuance = 30,000 (month 1) → Difference = `45,000 - 30,000 = 15,000`
- **Platinum Card:** Maximum issuance = 85,000 (month 2), Minimum issuance = 80,000 (month 1) → Difference = `85,000 - 80,000 = 5,000`

Results are sorted in descending order by the difference.