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
