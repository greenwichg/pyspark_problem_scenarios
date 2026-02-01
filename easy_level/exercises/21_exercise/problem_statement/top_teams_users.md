# Top Message Senders in August 2022 — SQL Interview Question

You are given a table of messages exchanged on a messaging platform. Your task is to identify the top 2 users who sent the highest number of messages in August 2022.

---

## 🧠 Objective

Write a SQL query to:

1. Count the total number of messages sent by each user in **August 2022**.
2. Return the **top 2** users based on the highest message count.
3. Display the results in **descending order** of message count.

---

## 📌 Assumptions

- No two users have the same number of messages sent in August 2022 (i.e., no tie-breakers needed).
- The `sent_date` column is of timestamp or datetime format.

---

## 🛢️ Table: `ttu_messages`

| Column Name   | Data Type | Description                                  |
|---------------|-----------|----------------------------------------------|
| `message_id`  | integer   | Unique identifier of the message.            |
| `sender_id`   | integer   | ID of the user who sent the message.         |
| `receiver_id` | integer   | ID of the user who received it.              |
| `content`     | text      | Message body.                                |
| `sent_date`   | datetime  | Timestamp when the message was sent.         |

---

## 📌 Example

### ✅ Input: `ttu_messages`

| message_id | sender_id | receiver_id | content                | sent_date           |
|------------|-----------|-------------|------------------------|---------------------|
| 901        | 3601      | 4500        | You up?                | 2022-08-03 00:00:00 |
| 902        | 4500      | 3601        | Only if you're buying  | 2022-08-03 00:00:00 |
| 743        | 3601      | 8752        | Let's take this offline| 2022-06-14 00:00:00 |
| 922        | 3601      | 4500        | Get on the call        | 2022-08-10 00:00:00 |

### ✅ Expected Output

| sender_id | message_count |
|-----------|---------------|
| 3601      | 2             |
| 4500      | 1             |

---

## 🔍 Explanation

- Messages are filtered to only those sent in **August 2022**.
- User `3601` sent 2 messages during this period (message 743 from June is excluded).
- User `4500` sent 1 message.
- These are the top 2 users by message count, in descending order.

---

## ✅ Output Requirements

Return a result with:

- `sender_id`: ID of the user who sent the message.
- `message_count`: Total messages sent in August 2022.