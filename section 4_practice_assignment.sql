-- Index and temporary tables 
-- 1. Create emp_index on table emp on the field birthdate. 

CREATE INDEX emp_index
	ON emp(birthdate);

-- 2. Create unique index dept_index on table dept on the field deptname.
CREATE UNIQUE INDEX dept_index
	ON dept(deptname);
    
-- 3. Create students table, with filed id, name, age, gender, index on id  
CREATE TABLE student(
id INT,
name VARCHAR(100),
age INT,
gender VARCHAR(5),
INDEX index_id(id),
PRIMARY KEY(id));

-- 4. Drop index of table emp 

DROP INDEX idx_empcode ON emp;

-- 5. Find all the index of table dept 

SHOW INDEX FROM dept;
-- 6. Create a temporary table student with field with filed id, name, age, gender 
CREATE TEMPORARY TABLE student(
id INT,
name VARCHAR(100),
age INT,
gender VARCHAR(5)
);

-- 7. Logout from session and login again to check if temporary table exists. 
-- 8. Create a temporary table test 
CREATE TEMPORARY TABLE test(
test_id INT,
test_name VARCHAR(55));
-- 9. Drop temporary table test

DROP TEMPORARY TABLE test;


