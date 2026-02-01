# Messaging Platform Top Contributors — SQL Interview Question

Write a query to determine the top 2 contributors who sent the highest number of messages within a messaging platform in **August 2022**. Display the user IDs of these contributors along with the total count of messages they sent during this period. Ensure the results are sorted in **descending order** based on the number of messages sent.

---

## 📋 Assumption

No two users have the same number of messages for August 2022.

---

## 🧾 Table Schema

### `messages`

| Column Name   | Data Type | Description                                  |
|---------------|-----------|----------------------------------------------|
| `message_id`  | Integer   | Unique identifier for the message.           |
| `sender_id`   | Integer   | ID of the user who sent the message.         |
| `receiver_id` | Integer   | ID of the user who received the message.     |
| `content`     | String    | Text content of the message.                 |
| `sent_date`   | Datetime  | Timestamp when the message was sent.         |

---

## 📌 Example

### ✅ Input: `messages`

| message_id | sender_id | receiver_id | content               | sent_date           |
|------------|-----------|-------------|-----------------------|---------------------|
| 901        | 101       | 202         | Hello there!          | 2022-08-03 10:00:00 |
| 902        | 202       | 101         | Hi, what's up?        | 2022-08-03 10:15:00 |
| 903        | 101       | 303         | Meeting rescheduled.  | 2022-08-05 14:30:00 |
| 904        | 101       | 202         | Can we sync later?    | 2022-08-07 09:00:00 |

### ✅ Expected Output

| sender_id | message_count |
|-----------|---------------|
| 101       | 3             |
| 202       | 1             |

> Note: Sender 101 sent 3 messages in August 2022, and Sender 202 sent 1 message. These are the top 2 contributors, returned in descending order by message count.