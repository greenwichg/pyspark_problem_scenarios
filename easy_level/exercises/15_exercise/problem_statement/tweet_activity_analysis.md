# Twitter Tweet Histogram — SQL Interview Question

You're working with a dataset that contains information about tweets posted on Twitter. Your task is to generate a histogram that shows how many tweets users posted in the year 2022.

---

## 🧠 Objective

- Filter tweets from the year **2022**.
- Count how many tweets each user posted during that year.
- Group users based on their tweet counts (i.e., bucket them by the number of tweets).
- Return the number of users in each tweet count bucket.

---

## 🗃️ Table: `taa_twitter_activity`

| Column Name  | Type      | Description                        |
|--------------|-----------|------------------------------------|
| `tweet_id`   | INTEGER   | Unique tweet identifier.           |
| `user_id`    | INTEGER   | ID of the user who tweeted.        |
| `msg`        | STRING    | Content of the tweet.              |
| `tweet_date` | TIMESTAMP | When the tweet was posted.         |

---

## 📌 Example

### ✅ Input: `taa_twitter_activity`

| tweet_id | user_id | msg                                                    | tweet_date              |
|----------|---------|--------------------------------------------------------|-------------------------|
| 214252   | 111     | Am considering taking Tesla private at $420. Funding secured. | 2021-12-30 00:00:00 |
| 739252   | 111     | Despite the constant negative press covfefe            | 2022-01-01 00:00:00     |
| 846402   | 111     | Following @NickSinghTech on Twitter changed my life!   | 2022-02-14 00:00:00     |
| 241425   | 254     | If the salary is so competitive why won't you tell me what it is? | 2022-03-01 00:00:00 |

### ✅ Expected Output

| tweet_bucket | users_count |
|--------------|-------------|
| 1            | 1           |
| 2            | 1           |

---

## 📘 Explanation

- User `111` posted **2** tweets in 2022 (the tweet from 2021-12-30 is excluded as it falls outside 2022).
- User `254` posted **1** tweet in 2022.
- The output groups users by tweet count and shows how many users fall into each bucket.