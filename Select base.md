## 1. Recyclable and Low Fat Products
Input:-
| product_id | low_fats | recyclable |
| ---------- | -------- | ---------- |
| 0          | Y        | N          |
| 1          | Y        | Y          |
| 2          | N        | Y          |
| 3          | Y        | Y          |
| 4          | N        | N          |

Output:-

| product_id |
| ---------- |
| 1          |
| 3          |

product_id is the primary key (column with unique values) for this table.
low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
 

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

        select product_id from where low_fats = "Y" and recyclable = "Y";

## 2. Find Customer Referee
Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
input:-
| id | name | referee_id |
| -- | ---- | ---------- |
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |

       select name from customer where referee_id != 2 or referee_id is null;

output:-

| name |
| ---- |
| Will |
| Jane |
| Bill |
| Zack |

## 3. 
