## 1.  The Number of Employees Which Report to Each Employee
For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.
Employess:-
| employee_id | name    | reports_to | age |
| ----------- | ------- | ---------- | --- |
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |

                  SELECT 
                  e1.employee_id, e1.name,
                  COUNT(e1.employee_id) AS reports_count,
                  ROUND(AVG(e2.age), 0) AS average_age
                FROM 
                  Employees e1
                JOIN 
                  Employees e2
                ON 
                  e1.employee_id = e2.reports_to
                GROUP BY 
                  employee_id
                ORDER BY 
                  employee_id;

Output:-
| employee_id | name  | reports_count | average_age |
| ----------- | ----- | ------------- | ----------- |
| 9           | Hercy | 2             | 39          |
