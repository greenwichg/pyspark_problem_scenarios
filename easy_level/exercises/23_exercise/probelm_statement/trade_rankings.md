# Top Cities by Completed Trade Orders — SQL Interview Question

You are provided with two tables, `tr_trades` and `tr_users`, containing data about trade orders and user details. Write a query to determine the top three cities with the highest number of completed trade orders. The output should include the city name and the corresponding total number of completed trade orders, sorted in **descending order** by the total count.

---

## 🗃️ Table Schemas

### `tr_trades`

| Column Name | Data Type | Description                                  |
|-------------|-----------|----------------------------------------------|
| `order_id`  | INTEGER   | Unique identifier of the trade order.        |
| `user_id`   | INTEGER   | ID of the user who placed the order.         |
| `quantity`  | INTEGER   | Quantity of the trade.                       |
| `status`    | VARCHAR   | Status of the order (e.g., Completed, Cancelled). |
| `date`      | DATETIME  | Timestamp when the order was placed.         |
| `price`     | FLOAT     | Price of the trade.                          |

### `tr_users`

| Column Name   | Data Type | Description                                  |
|---------------|-----------|----------------------------------------------|
| `user_id`     | INTEGER   | Unique identifier of the user.               |
| `city`        | VARCHAR   | City where the user is located.              |
| `email`       | VARCHAR   | Email address of the user.                   |
| `signup_date` | DATETIME  | Timestamp when the user signed up.           |

---

## 📌 Example

### ✅ Input: `tr_trades`

| order_id | user_id | quantity | status    | date                | price |
|----------|---------|----------|-----------|---------------------|-------|
| 100101   | 111     | 10       | Cancelled | 08/17/2022 12:00:00 | 9.80  |
| 100102   | 111     | 10       | Completed | 08/17/2022 12:00:00 | 10.00 |
| 100259   | 148     | 35       | Completed | 08/25/2022 12:00:00 | 5.10  |
| 100264   | 148     | 40       | Completed | 08/26/2022 12:00:00 | 4.80  |
| 100305   | 300     | 15       | Completed | 09/05/2022 12:00:00 | 10.00 |
| 100400   | 178     | 32       | Completed | 09/17/2022 12:00:00 | 12.00 |
| 100565   | 265     | 2        | Completed | 09/27/2022 12:00:00 | 8.70  |

### ✅ Input: `tr_users`

| user_id | city          | email                         | signup_date           |
|---------|---------------|-------------------------------|-----------------------|
| 111     | San Francisco | rrok10@gmail.com              | 08/03/2021 12:00:00   |
| 148     | Boston        | sailor9820@gmail.com          | 08/20/2021 12:00:00   |
| 178     | San Francisco | harrypotterfan182@gmail.com   | 01/05/2022 12:00:00   |
| 265     | Denver        | shadower_@hotmail.com         | 02/26/2022 12:00:00   |
| 300     | San Francisco | houstoncowboy1122@hotmail.com | 06/30/2022 12:00:00   |

### ✅ Expected Output

| city          | total_orders |
|---------------|--------------|
| San Francisco | 3            |
| Boston        | 2            |
| Denver        | 1            |

> Note: Order 100101 is excluded because its status is "Cancelled". San Francisco has 3 completed orders from users 111, 178, and 300. Boston has 2 completed orders from user 148. Denver has 1 completed order from user 265.