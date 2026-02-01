# Tesla Production Bottlenecks — SQL Interview Question

Tesla is investigating production bottlenecks and needs your help to extract the relevant data.

Your task is to identify which parts have started the assembly process but are not yet finished.

---

## 🧠 Assumptions

- The `ia_parts` table contains all components currently in production, each moving through multiple `assembly_stage`s.
- A part is considered **unfinished** if it does not have a `completion_date` for a specific assembly stage.
- The goal is to list all such incomplete assembly stages for each component.

---

## 🗃️ Table: `ia_parts`

| Column Name      | Data Type | Description                                    |
|------------------|-----------|------------------------------------------------|
| `component`      | VARCHAR   | Name of the car part.                          |
| `completion_date`| TIMESTAMP | Timestamp when that stage was completed.       |
| `assembly_stage` | INTEGER   | Current stage number of the assembly process.  |

---

## 📌 Example

### ✅ Input: `ia_parts`

| component | completion_date     | assembly_stage |
|-----------|---------------------|----------------|
| engine    | 2023-03-10 12:00:00 | 1              |
| engine    | 2023-03-11 12:00:00 | 2              |
| chassis   | 2023-03-10 12:00:00 | 1              |
| chassis   |                     | 2              |
| chassis   |                     | 3              |
| dashboard | 2023-03-10 12:00:00 | 1              |
| dashboard | 2023-03-11 12:00:00 | 2              |
| dashboard |                     | 3              |

### ✅ Expected Output

| component | assembly_stage |
|-----------|----------------|
| chassis   | 2              |
| chassis   | 3              |
| dashboard | 3              |

> Note: `engine` is fully completed across all its stages. `chassis` stages 2 and 3 and `dashboard` stage 3 have no `completion_date`, meaning they are still in progress.