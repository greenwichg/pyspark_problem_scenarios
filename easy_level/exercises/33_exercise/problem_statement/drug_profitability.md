# Pharmaceutical Drug Profitability — SQL Interview Question

A pharmaceutical company wants to analyze the profitability of its drug sales. Each drug is produced by a single manufacturer.

Write a query to find the top 3 drugs that generated the highest profits and the corresponding profit amount. Assume there are no ties in profits. Display the results in descending order of profit.

---

## 📘 Definitions

- **COGS:** Cost of Goods Sold, representing the direct cost to produce a drug.
- **Total Profit:** Calculated as `Total Sales - Cost of Goods Sold`.

---

## 🗃️ Table: `dp_pharmacy_sales`

| Column Name    | Data Type | Description                                  |
|----------------|-----------|----------------------------------------------|
| `product_id`   | integer   | Unique identifier for the product.           |
| `units_sold`   | integer   | Number of units sold.                        |
| `total_sales`  | decimal   | Total revenue generated from the product.    |
| `cogs`         | decimal   | Cost of Goods Sold.                          |
| `manufacturer` | varchar   | Manufacturer of the drug.                    |
| `drug`         | varchar   | Name of the drug.                            |

---

## 📌 Example

### ✅ Input: `dp_pharmacy_sales`

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

## 🔍 Explanation

- **Zyprexa:** Profit = `293452.54 - 208876.01 = 84576.53`
- **Varicose Relief:** Profit = `500101.61 - 419174.97 = 80926.64`
- **Surmontil:** Profit = `600997.19 - 521182.16 = 79815.03`
- **Burkhart:** Profit = `1084258 - 1006447.73 = 77810.27` (excluded as it's 4th)

The top 3 drugs by profit are displayed in descending order.