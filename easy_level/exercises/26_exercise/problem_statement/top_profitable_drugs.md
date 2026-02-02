# Pharmacy Sales Top Profitable Drugs — SQL Interview Question

A healthcare company wants to analyze its pharmacy sales to identify the most profitable drugs. Each drug is exclusively produced by one manufacturer.

Write a query to retrieve the top 3 most profitable drugs along with their respective profits. The results should be sorted in descending order of profit. Assume there are no ties in profit values.

---

## 💰 Profit Calculation

**Profit** = `Total Sales` - `Cost of Goods Sold (COGS)`

---

## 🗃️ Table Schema: `pharmacy_sales`

| Column Name    | Type    | Description                                  |
|----------------|---------|----------------------------------------------|
| `product_id`   | integer | Unique identifier for the product.           |
| `units_sold`   | integer | Number of units sold.                        |
| `total_sales`  | decimal | Total sales revenue for the product.         |
| `cogs`         | decimal | Cost of Goods Sold.                          |
| `manufacturer` | varchar | Name of the manufacturer.                    |
| `drug`         | varchar | Name of the drug.                            |

---

## 📌 Example

### ✅ Input: `pharmacy_sales`

| product_id | units_sold | total_sales | cogs       | manufacturer | drug            |
|------------|------------|-------------|------------|--------------|-----------------|
| 9          | 37410      | 293452.54   | 208876.01  | Eli Lilly    | Zyprexa         |
| 34         | 94698      | 600997.19   | 521182.16  | AstraZeneca  | Surmontil       |
| 61         | 77023      | 500101.61   | 419174.97  | Biogen       | Varicose Relief |
| 136        | 144814     | 1084258     | 1006447.73 | Biogen       | Burkhart        |

### ✅ Expected Output

| drug            | total_profit |
|-----------------|--------------|
| Zyprexa         | 84576.53     |
| Varicose Relief | 80926.64     |
| Surmontil       | 79815.03     |

---

## 📘 Explanation

### Profit Calculation:

- For **Zyprexa**, Profit = `293452.54 - 208876.01 = 84576.53`
- For **Varicose Relief**, Profit = `500101.61 - 419174.97 = 80926.64`
- For **Surmontil**, Profit = `600997.19 - 521182.16 = 79815.03`

### Ranking:

- Drugs are ranked by their profits in descending order.
- The top 3 profitable drugs are displayed in the output.

> Note: Burkhart is excluded from the output because its profit (`1084258 - 1006447.73 = 77810.27`) is lower than the top 3.