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

## 2. Primary Department for Each Employee
Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.
Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
Return the result table in any order.
Employee:-
| employee_id | department_id | primary_flag |
| ----------- | ------------- | ------------ |
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |

              select employee_id, department_id from Employee
              group by employee_id having count (employee_id) =1
              union
              select employee_id, department_id from Employee where primary_flag = "Y";
Output:-
| employee_id | department_id |
| ----------- | ------------- |
| 1           | 1             |
| 3           | 3             |
| 2           | 1             |
| 4           | 3             |

## 3. Triangle Judgement
Report for every three line segments whether they can form a triangle.
Return the result table in any order.
Triangle:-
| x  | y  | z  |
| -- | -- | -- |
| 13 | 15 | 30 |
| 10 | 20 | 15 |

          select * , if(x+y>z and x+z>y and y+z>x , "Yes", "No") as triangle from Triangle;

Output:-
| x  | y  | z  | triangle |
| -- | -- | -- | -------- |
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |

## 4. Consecutive Numbers
Find all numbers that appear at least three times consecutively.
Return the result table in any order.
The result format is in the following example.
Logs:-
| id | num |
| -- | --- |
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |

In SQL, id is the primary key for this table.
id is an autoincrement column.
Explanation: 1 is the only number that appears consecutively for at least three times.

     select distinct (a.num) as ConsectiveNums
     from logs a, logs b, logs c
     where a.id = b.id+1 and b.id = c.id+1 and
     a.num=b.num and b.num=c.num;

Output:
| ConsecutiveNums |
| --------------- |
| 1               |
