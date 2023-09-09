## 1. Number of Unique Subjects Taught by Each Teacher
Write a solution to calculate the number of unique subjects each teacher teaches in the university.
Teacher:-
| teacher_id | subject_id | dept_id |
| ---------- | ---------- | ------- |
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |

              select teacher_id, count(distinct subject_id) as cnt from Teacher group by teacher_id;
Output:-
| teacher_id | cnt |
| ---------- | --- |
| 1          | 2   |
| 2          | 4   |

## 2.User Activity for the Past 30 Days I
Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
Activity:-
| user_id | session_id | activity_date | activity_type |
| ------- | ---------- | ------------- | ------------- |
| 1       | 1          | 2019-07-20    | open_session  |
| 1       | 1          | 2019-07-20    | scroll_down   |
| 1       | 1          | 2019-07-20    | end_session   |
| 2       | 4          | 2019-07-20    | open_session  |
| 2       | 4          | 2019-07-21    | send_message  |
| 2       | 4          | 2019-07-21    | end_session   |
| 3       | 2          | 2019-07-21    | open_session  |
| 3       | 2          | 2019-07-21    | send_message  |
| 3       | 2          | 2019-07-21    | end_session   |
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |

              select activity_date as day , count(distinct user_id) as active_users 
              from Activity 
              group by activity_date
              having activity_date>="2019-06-28" and activity_date<="2019-07-27"
Output:-
| day        | active_users |
| ---------- | ------------ |
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |

## 3. Product Sales Analysis III
Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
Sales:-
| sale_id | product_id | year | quantity | price |
| ------- | ---------- | ---- | -------- | ----- |
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |

Product:-
| product_id | product_name |
| ---------- | ------------ |
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |

              SELECT product_id, year AS first_year, quantity, price
              FROM Sales
              WHERE (product_id, year) in 
              (SELECT product_id, MIN(year) 
              FROM Sales GROUP BY product_id)

Output:-
| product_id | first_year | quantity | price |
| ---------- | ---------- | -------- | ----- |
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |

## 4 Classes More Than 5 Students
Write a solution to find all the classes that have at least five students.
Return the result table in any order.
Courses:-
| student | class    |
| ------- | -------- |
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |

                  select class from Courses group by class having count(student)>=5;
Output:-
| class |
| ----- |
| Math  |

## 5 Find Followers Count
Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order
Folloers:-
| user_id | follower_id |
| ------- | ----------- |
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |

                        select distinct user_id , count(distinct follower_id) as followers_count from
                        Followers
                        GROUP BY user_id
                        ORDER BY user_id;
Output:-
| user_id | followers_count |
| ------- | --------------- |
| 0       | 1               |
| 1       | 1               |
| 2       | 2               |


## 6 Biggest Single Number.
A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.
Mynumbers:-
| num |
| --- |
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |

              select max(num) as num from 
              (
                select num from Mynumbers group by num having count(num) = 1
              ) as num

Output:-
| num |
| --- |
| 6   |

## 7 Customers Who Bought All Products
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
Return the result table in any order.
Customer:-
| customer_id | product_key |
| ----------- | ----------- |
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |

Product:-
| product_key |
| ----------- |
| 5           |
| 6           |

            select customer_id from Customer group by customer_id 
            having count(distinct product_key) = (select count(*) from Product);

Output:-
| customer_id |
| ----------- |
| 1           |
| 3           |


