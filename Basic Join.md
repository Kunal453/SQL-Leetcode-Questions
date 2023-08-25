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
