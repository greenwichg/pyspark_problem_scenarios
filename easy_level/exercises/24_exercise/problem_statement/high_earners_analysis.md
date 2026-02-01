# Employees Earning More Than Their Managers — SQL Interview Question

Companies often analyze employee salaries to ensure fair pay practices. One useful analysis involves identifying employees who earn more than their direct managers. Your task is to find these employees.

Write a query to identify all employees earning more than their managers. The result should include the employee's ID and name.

---

## 🗃️ Table: `hea_employee`

| Column Name    | Data Type | Description                                          |
|----------------|-----------|------------------------------------------------------|
| `employee_id`  | INTEGER   | Unique identifier for the employee.                  |
| `name`         | VARCHAR   | Name of the employee.                                |
| `salary`       | INTEGER   | Salary of the employee.                              |
| `department_id`| INTEGER   | ID of the department the employee belongs to.        |
| `manager_id`   | INTEGER   | ID of the employee's direct manager (NULL if none).  |

---

## 📌 Example

### ✅ Input: `hea_employee`

| employee_id | name             | salary | department_id | manager_id |
|-------------|------------------|--------|---------------|------------|
| 1           | Emma Thompson    | 3800   | 1             | 6          |
| 2           | Daniel Rodriguez | 2230   | 1             | 7          |
| 3           | Olivia Smith     | 7000   | 1             | 8          |
| 4           | Noah Johnson     | 6800   | 2             | 9          |
| 5           | Sophia Martinez  | 1750   | 1             | 11         |
| 6           | Liam Brown       | 13000  | 3             | NULL       |
| 7           | Ava Garcia       | 12500  | 3             | NULL       |
| 8           | William Davis    | 6800   | 2             | NULL       |

### ✅ Expected Output

| employee_id | employee_name |
|-------------|---------------|
| 3           | Olivia Smith  |

> Note: Olivia Smith (salary 7000) earns more than her manager William Davis (employee 8, salary 6800). Employees 6 and 7 have no manager (NULL), so they are excluded. Employee 4 (Noah Johnson) has `manager_id` 9, which does not exist in the table, so no comparison can be made.