## 1. Replace Employee ID With The Unique Identifier
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
Return the result table in any order.
| id | name     |
| -- | -------- |
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |

| id | unique_id |
| -- | --------- |
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |

      select e.name, eu.unique_id from Employees e left join EmployeeUNI eu on e.id = eu.id;

Output:-
| name     | unique_id |
| -------- | --------- |
| Alice    | null      |
| Bob      | null      |
| Meir     | 2         |
| Winston  | 3         |
| Jonathan | 1         |

## 2.  Product Sales Analysis I
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
Return the resulting table in any order.

Sales
| sale_id | product_id | year | quantity | price |
| ------- | ---------- | ---- | -------- | ----- |
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |

Product
| product_id | product_name |
| ---------- | ------------ |
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |

          select s.year, s.price, p.product_name from Sales as s left join Product as p on s.product_id = p.product_id ;

output:-
| year | price | product_name |
| ---- | ----- | ------------ |
| 2008 | 5000  | Nokia        |
| 2009 | 5000  | Nokia        |
| 2011 | 9000  | Apple        |

## 3. Customer Who Visited but Did Not Make Any Transactions
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Visitors
| visit_id | customer_id |
| -------- | ----------- |
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |

Transactions
| transaction_id | visit_id | amount |
| -------------- | -------- | ------ |
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |

            select customer_id,  count(v.visit_id) as  count_no_trans from Visits as v left join Transactions as t on v.Visit_id = t.Visit_id              where transaction_id is null  group by customer_id;
output:-
| customer_id | count_no_trans |
| ----------- | -------------- |
| 30          | 1              |
| 96          | 1              |
| 54          | 2              |

## 4. Rising Temperature
Find all dates' Id with higher temperatures compared to its previous dates (yesterday).
| id | recordDate | temperature |
| -- | ---------- | ----------- |
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |

            select w1.id from Weather as w1, Weather as w2 where datediff(w1.recordDate,w2.recordDate)=1 and w1.temperature > w2.temperature;
            
Output:-
| id |
| -- |
| 2  |
| 4  |

## 5. Average Time of Process per Machine
There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
| machine_id | process_id | activity_type | timestamp |
| ---------- | ---------- | ------------- | --------- |
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.52      |
| 0          | 1          | start         | 3.14      |
| 0          | 1          | end           | 4.12      |
| 1          | 0          | start         | 0.55      |
| 1          | 0          | end           | 1.55      |
| 1          | 1          | start         | 0.43      |
| 1          | 1          | end           | 1.42      |
| 2          | 0          | start         | 4.1       |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.5       |
| 2          | 1          | end           | 5         |

            select a.machine_id , round(avg(b.timestamp-a.timestamp),3) as processing_time  from Activity a join Activity b on a.machine_id =             b.machine_id and a.process_id=b.process_id and a.timestamp<b.timestamp group by machine_id;
Output:-

| machine_id | processing_time |
| ---------- | --------------- |
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |

## 6. Employee Bonus
Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.
Employee:-
| empId | name   | supervisor | salary |
| ----- | ------ | ---------- | ------ |
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |

Bonus:-
| empId | bonus |
| ----- | ----- |
| 2     | 500   |
| 4     | 2000  |

            select  e.name , b.bonus from Employee as e left join Bonus as b on e.empId = b.empId where b.bonus<1000 or b.bonus is null;
Output:-
| name | bonus |
| ---- | ----- |
| Brad | null  |
| John | null  |
| Dan  | 500   |

## 6. Students and Examinations
Write a solution to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
Students :-
| student_id | student_name |
| ---------- | ------------ |
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |

Subjects:-
| subject_name |
| ------------ |
| Math         |
| Physics      |
| Programming  |

Examinations:-
| student_id | subject_name |
| ---------- | ------------ |
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |

                  select s.student_id, s.student_name, sb.subject_name, count(e.subject_name) as attended_exams  from 
                  Students as s join Subjects as sb left join  Examinations as e on
                  s.student_id = e.student_id and sb.subject_name=e.subject_name 
                  group by s.student_id, sb.subject_name  
                  order by s.student_id, sb.subject_name;
Output:-
| student_id | student_name | subject_name | attended_exams |
| ---------- | ------------ | ------------ | -------------- |
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |

## 7. Managers with at Least 5 Direct Reports
Write a solution to find managers with at least five direct reports.
Employee:-
| id  | name  | department | managerId |
| --- | ----- | ---------- | --------- |
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |

            select m.name from Employee as e inner join Employee as m on e.id= m.managerId 
            group by e.managerId having count(e.id)>=5; 
Output:-
| name |
| ---- |
| John |

## 8. Confirmation Rate
The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.
Write an SQL query to find the confirmation rate of each user.

Signups:-
| user_id | time_stamp          |
| ------- | ------------------- |
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |

Confirmations:-
| user_id | time_stamp          | action    |
| ------- | ------------------- | --------- |
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |

            select s.user_id, round(sum(case when action = 'confirmed' then 1 else o end) /count(1),2) as confirmation_rate 
            from Signups as s left join Confirmations as c on s.user_id = c.user_id group by user_id;
Output:-
| user_id | confirmation_rate |
| ------- | ----------------- |
| 3       | 0                 |
| 7       | 1                 |
| 2       | 0.5               |
| 6       | 0                 |

## 9. Not Boring Movies
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
Cinema:-
| id | movie      | description | rating |
| -- | ---------- | ----------- | ------ |
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

            select  id, movie, description, rating from Cinema where id%2!= 0 and description != 'boring' order by rating desc;
Output:-
| id | movie      | description | rating |
| -- | ---------- | ----------- | ------ |
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

## 10. Average Selling Price
Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.
Prices:-
| product_id | start_date | end_date   | price |
| ---------- | ---------- | ---------- | ----- |
| 1          | 2019-02-17 | 2019-02-28 | 5     |
| 1          | 2019-03-01 | 2019-03-22 | 20    |
| 2          | 2019-02-01 | 2019-02-20 | 15    |
| 2          | 2019-02-21 | 2019-03-31 | 30    |

UnitsSold:-
| product_id | purchase_date | units |
| ---------- | ------------- | ----- |
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |

            select p.product_id , round(sum(p.price*u.units)/sum(u.units),2) as average_price from Prices as p left join UnitsSold as u on                p.product_id=u.product_id and u.purchase_date between p.start_date and p.end_date group by p.product_id;

Output:-
| product_id | average_price |
| ---------- | ------------- |
| 1          | 6.96          |
| 2          | 16.96         |

## 11. Project Employees I
Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
Project:-
| project_id | employee_id |
| ---------- | ----------- |
| 1          | 1           |
| 1          | 2           |
| 1          | 3           |
| 2          | 1           |
| 2          | 4           |

Employee:-
| employee_id | name   | experience_years |
| ----------- | ------ | ---------------- |
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |

            select p.project_id , round(avg(e.experience_years),2) as average_years from Project as p left join Employee as e on              
            p.employee_id = e.employee_id group by p.project_id;

Output:-
| project_id | average_years |
| ---------- | ------------- |
| 1          | 2             |
| 2          | 2.5           |

## 12. Percentage of Users Attended a Contest
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
Users:-
| user_id | user_name |
| ------- | --------- |
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |

Register:-
| contest_id | user_id |
| ---------- | ------- |
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |

            select contest_id , round(count(distinct user_id)*100/(select count(user_id) from Users),2) as percentage from Register 
            group by contest_id order by percentage desc, contest_id;

Output:-
| contest_id | percentage |
| ---------- | ---------- |
| 208        | 100        |
| 209        | 100        |
| 210        | 100        |
| 215        | 66.67      |
| 207        | 33.33      |

## 13. 
