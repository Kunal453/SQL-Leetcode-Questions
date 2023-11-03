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

## 2. Exchange Seats
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.
Table:- Seats

| id | student |
| -- | ------- |
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |

            ELECT ROW_NUMBER() OVER() id, student
            FROM seat
            ORDER BY IF(MOD(id, 2) = 0, id-1, id+1)
Output:- 
| id | student |
| -- | ------- |
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |

## 3. Movie Rating.
Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
Table:- Movies
| movie_id | title    |
| -------- | -------- |
| 1        | Avengers |
| 2        | Frozen 2 |
| 3        | Joker    |

Table:- Users
| user_id | name   |
| ------- | ------ |
| 1       | Daniel |
| 2       | Monica |
| 3       | Maria  |
| 4       | James  |

Table:- MovieRating
| movie_id | user_id | rating | created_at |
| -------- | ------- | ------ | ---------- |
| 1        | 1       | 3      | 2020-01-12 |
| 1        | 2       | 4      | 2020-02-11 |
| 1        | 3       | 2      | 2020-02-12 |
| 1        | 4       | 1      | 2020-01-01 |
| 2        | 1       | 5      | 2020-02-17 |
| 2        | 2       | 2      | 2020-02-01 |
| 2        | 3       | 2      | 2020-03-01 |
| 3        | 1       | 3      | 2020-02-22 |
| 3        | 2       | 4      | 2020-02-25 |

                                
                            SELECT user_name as results FROM
                            (
                                SELECT b.name as user_name,COUNT(*) as counts FROM MovieRating as a
                                JOIN Users as b
                                ON a.user_id=b.user_id
                                GROUP BY a.user_id
                                ORDER BY counts DESC,user_name ASC LIMIT 1
                            ) first_query
                            UNION ALL
                            SELECT movie_name as results FROM
                            (
                                SELECT d.title as movie_name,AVG(c.rating) as grade FROM MovieRating as c
                                JOIN Movies as d
                                ON c.movie_id=d.movie_id
                                WHERE SUBSTR(c.created_at,1,7)="2020-02"
                                GROUP BY c.movie_id
                                ORDER BY grade DESC,movie_name ASC LIMIT 1
                            ) second_query;

Output:- 
    | results  |
    | -------- |
    | Daniel   |
    | Frozen 2 |
