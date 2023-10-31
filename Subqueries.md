## 1. Employees whose manager lrft the company

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
Return the result table ordered by employee_id.
    
Table:- Employees

| employee_id | name      | manager_id | salary |
| ----------- | --------- | ---------- | ------ |
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |

Explanation:- The employees with a salary less than $30000 are 1 (Kalel) and 11 (Joziah).
              Kalel's manager is employee 11, who is still in the company (Joziah).
              Joziah's manager is employee 6, who left the company because there is no row for employee 6 as it was deleted.

                          select e.employee_id from Employees e where e.salary < 30000  and e.manager_id not in 
                          ( select m.employee_id from Employees  m ) group by e.employee_id order by e.employee_id; 
Output:-
| employee_id |
| ----------- |
| 11          |
