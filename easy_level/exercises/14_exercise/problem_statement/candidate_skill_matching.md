# Data Science Candidate Shortlisting — SQL Interview Question

You are given a table or DataFrame named `csm_candidate_skills` that contains information about candidates and their skills. Your task is to identify candidates who are most suitable for a Data Science job, specifically those who possess all of the following required skills:

- **Python**
- **Tableau**
- **PostgreSQL**

---

## 🧾 Table / DataFrame: `csm_candidate_skills`

| Column Name    | Type    | Description                          |
|----------------|---------|--------------------------------------|
| `candidate_id` | INTEGER | Unique ID for each candidate.        |
| `skill`        | VARCHAR | A skill that the candidate has.      |

---

## 📋 Assumptions

- Each row represents one skill per candidate.
- The table contains no duplicate rows.

---

## 📌 Example

### ✅ Input: `csm_candidate_skills`

| candidate_id | skill      |
|--------------|------------|
| 123          | Python     |
| 123          | Tableau    |
| 123          | PostgreSQL |
| 234          | R          |
| 234          | PowerBI    |
| 234          | SQL Server |
| 345          | Python     |
| 345          | Tableau    |

### ✅ Expected Output

| candidate_id |
|--------------|
| 123          |

---

## 🧾 Explanation

- Candidate `123` is included because they have all 3 required skills.
- Candidate `345` is missing PostgreSQL, so they are excluded.
- Candidate `234` does not have any of the required skills.