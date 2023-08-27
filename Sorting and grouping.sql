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

## 2.
