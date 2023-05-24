# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Employee_8 
(
empId int, 
name varchar(255), 
supervisor int, 
salary int
);

Create table If Not Exists Bonus_8 
(
empId int, 
bonus int
);

Truncate table Employee_8;
INSERT INTO Employee_8 (empId, name, supervisor, salary) VALUES ('3', 'Brad', NULL, 4000);
INSERT INTO Employee_8 (empId, name, supervisor, salary) VALUES ('1', 'John', '3', '1000');
INSERT INTO Employee_8 (empId, name, supervisor, salary) VALUES ('2', 'Dan', '3', '2000');
INSERT INTO Employee_8 (empId, name, supervisor, salary) VALUES ('4', 'Thomas', '3', '4000');

Truncate table Bonus_8;

insert into Bonus_8 (empId, bonus) values ('2', '500');
insert into Bonus_8 (empId, bonus) values ('4', '2000');
/*
Q. Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.
The query result format is in the following example.

Input: 
Employee table:
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+
Bonus table:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
Output: 
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+
*/

SELECT * FROM Employee_8;
SELECT * FROM Bonus_8;

# TYPE 1 :- 

SELECT e.name, b.bonus
FROM Employee_8 AS e
LEFT JOIN Bonus_8 AS b
ON e.empId = b.empId
WHERE b.bonus<1000 OR b.bonus IS NULL;

# TYPE 2 :- 
SELECT e.name, b.bonus
FROM Employee_8 AS e
LEFT JOIN Bonus_8 AS b
ON e.empId = b.empId
#IFNULL(value, replacement)
WHERE IFNULL(bonus, 0)<1000;


