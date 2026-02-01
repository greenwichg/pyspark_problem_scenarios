# Duplicate Job Listings — SQL Interview Question

Given a table containing job postings, write a query to retrieve the count of companies that have posted duplicate job listings.

> **Definition:** Duplicate job listings are defined as two or more job listings within the same company that share identical titles and descriptions.

---

## 🗃️ Table: `rjp_listings`

| Column Name  | Data Type | Description                                  |
|--------------|-----------|----------------------------------------------|
| `job_id`     | INTEGER   | Unique identifier of the job listing.        |
| `company_id` | INTEGER   | ID of the company that posted the listing.   |
| `title`      | VARCHAR   | Title of the job listing.                    |
| `description`| TEXT      | Description of the job listing.              |

---

## 📌 Example

### ✅ Input: `rjp_listings`

| job_id | company_id | title            | description                                |
|--------|------------|------------------|--------------------------------------------|
| 248    | 827        | Business Analyst | Business analyst evaluates past decisions |
| 149    | 845        | Business Analyst | Business analyst evaluates past decisions |
| 945    | 345        | Data Analyst     | Data analyst reviews data                  |
| 164    | 345        | Data Analyst     | Data analyst reviews data                  |
| 172    | 244        | Data Engineer    | Data engineer works in various settings    |

### ✅ Expected Output

| duplicate_companies |
|---------------------|
| 1                   |

> Note: Companies 827 and 845 both posted "Business Analyst" listings, but they are **different** companies — so that is not a duplicate. Company 345 posted two identical "Data Analyst" listings (same title and description), making it the only company with duplicates. Company 244 has only one listing.