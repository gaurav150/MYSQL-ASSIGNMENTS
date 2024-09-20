-- Stored Procedure
SHOW DATABASES;

USE company;
SHOW TABLES;
SELECT * FROM emp;
SELECT * FROM dept;

-- 1)Create a procedure which takes employee number as parameter and delete the employee record. display the empname whose record has been deleted.
DELIMITER //

CREATE PROCEDURE DELETION(IN n INT)
BEGIN
    DECLARE emp_name VARCHAR(100);
    
    -- Check if the employee exists and retrieve the name
    SELECT ename INTO emp_name FROM emp WHERE empno = n;

  
        DELETE FROM emp WHERE empno = n;
        SELECT CONCAT('Employee ', emp_name, ' has been deleted.') AS message;
    
        SELECT 'Employee not found.' AS message;
   
END //

DELIMITER ;

-- 2)Create a procedure which takes department name as paramater and displays all the employee records from the perticuler department and  number of employee in that department. 


DELIMITER //
CREATE PROCEDURE DISPLAY_DEPT(IN n VARCHAR(100))
BEGIN
   
    
     SELECT e.* 
    FROM emp AS e
    JOIN dept AS d ON e.deptno = d.deptno    
    WHERE d.dname = n;
    
    SELECT COUNT(e.ename) AS number_of_employees
    FROM emp AS e
    JOIN dept AS d
    ON e.deptno = d.deptno 
    WHERE d.dname = n;
   
END //

-- 3)Write procedure to display the  department with more than five employees.

DELIMITER //
CREATE PROCEDURE FIVE_EMP(n VARCHAR(100))
BEGIN
       
      
    SELECT COUNT(e.ename) AS employee_count,d.dname
    FROM emp AS e
    JOIN dept AS d
    ON e.deptno = d.deptno 
    GROUP BY  d.dname
    HAVING employee_count > 5;
   
END //
-- 4)Create a procedure for adding a row in emp table. Display number of rows added. 
DELIMITER //
CREATE PROCEDURE ADD_EMP(IN a decimal(4,0), b VARCHAR(10),  c varchar(9), d decimal(4,0), e date, f decimal(7,2), g decimal(7,2), h decimal(2,0))
BEGIN
	DESCRIBE emp;
    INSERT INTO emp VALUES(a,b,c,d,e,f,g,h);
      
     SELECT COUNT(empno) , (COUNT(empno) + 1) AS TOTAL_NUMBER_OF_ROWS
		FROM emp;

   
   
END //
-- 5)Write a procedure to display a particular employee details like employee id, name, hire date  and the incentive amount they achieved according to their working experiences, 

DELIMITER //
CREATE PROCEDURE DISPLAY_EMPLOYEE_DETAILS()
BEGIN
	
      
     SELECT empno AS employee_id , ename AS name_of_employee, hiredate AS HIRING_DATE , sal AS INCENTIVE_AMOUNT
		FROM emp;

   
   
END //

