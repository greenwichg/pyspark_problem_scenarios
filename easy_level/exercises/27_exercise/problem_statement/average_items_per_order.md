# Average Items Per Order — SQL Interview Question

You want to determine the average number of items per order on an e-commerce platform. The calculation should be rounded to one decimal place. The dataset includes the count of items in each order (`item_count`) and the corresponding number of orders for each item count (`order_occurrences`).

---

## 🗃️ Table Schema: `items_per_order`

| Column Name         | Type    | Description                                          |
|---------------------|---------|------------------------------------------------------|
| `item_count`        | integer | Number of items in an order.                         |
| `order_occurrences` | integer | Number of orders with that specific item count.      |

---

## 📌 Example

### ✅ Input: `items_per_order`

| item_count | order_occurrences |
|------------|-------------------|
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |
| 4          | 1000              |

### ✅ Expected Output

| mean |
|------|
| 2.7  |

---

## 📘 Explanation

### 1. Calculate Total Items:

- Multiply `item_count` by `order_occurrences` for each row and sum the results.
- Total items = `(1 × 500) + (2 × 1000) + (3 × 800) + (4 × 1000) = 8900`

### 2. Calculate Total Orders:

- Sum the `order_occurrences` values across all rows.
- Total orders = `500 + 1000 + 800 + 1000 = 3300`

### 3. Calculate Mean:

- Divide the total items by the total orders.
- Mean = `8900 ÷ 3300 = 2.7`

### 4. Rounding:

- Round the result to 1 decimal place for the final output.