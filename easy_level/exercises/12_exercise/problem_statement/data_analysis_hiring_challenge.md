# Recruitment Candidate Shortlisting — SQL Interview Question

You are part of the recruitment team tasked with shortlisting candidates for a Data Analyst role. The job requires proficiency in **Python**, **Tableau**, and **PostgreSQL**.

Write an SQL query to identify candidates who meet all the skill requirements for the role. The results should display the unique IDs of these candidates, sorted in ascending order.

---

## 📋 Assumptions

- Each row in the `candidates` table represents a unique skill for a candidate.
- No candidate has duplicate entries for the same skill.

---

## 🧾 Table Schema

### `candidates`

| Column Name    | Data Type |
|----------------|-----------|
| `candidate_id` | integer   |
| `skill`        | varchar   |

---

## 📌 Example

### ✅ Input: `candidates`

| candidate_id | skill      |
|--------------|------------|
| 101          | Python     |
| 101          | Tableau    |
| 101          | PostgreSQL |
| 202          | R          |
| 202          | PowerBI    |
| 202          | SQL Server |
| 303          | Python     |
| 303          | Tableau    |

### ✅ Expected Output

| candidate_id |
|--------------|
| 101          |

> Note: Candidate 101 is the only one with all three required skills (Python, Tableau, PostgreSQL). Candidate 303 has only two of the three, and Candidate 202 has none of the required skills.