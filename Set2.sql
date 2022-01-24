/*EMPLOYEE (emp_id, emp_name, birth_date, gender, dept_no, address, designation, salary,
experience, email)

DEPARTMENT (dept_no, dept_name, location)*/
/*table 1 employee*/

create table employee(
emp_id number(20) primary key,
emp_name varchar(50),
birth_date DATE,
gender varchar(10),
dept_no number(20) references departmet2(dept_no),
address varchar(20),
designation varchar(20),
salary number(20),
experience number(20),
email varchar(20));


INSERT INTO EMPLOYEE VALUES(1,'A','01-JAN-2001','MALE',1,'JAMNAGAR','HOD',10000,5,'A@GMAIL.COM');
INSERT INTO EMPLOYEE VALUES(2,'B','15-JUN-1999','FEMALE',2,'JAMNAGAR','HOD',15000,3,'B@GMAIL.COM');
INSERT INTO EMPLOYEE VALUES(3,'C','20-MAY-2001','MALE',3,'JAMNAGAR','ACCOUNTANT',5000,1,'C@GMAIL.COM');
INSERT INTO EMPLOYEE VALUES(4,'D','23-FEB-2001','FEMALE',5,'JAMNAGAR','LAB.ASSISTANT',18000,2,'D@GMAIL.COM');
INSERT INTO EMPLOYEE VALUES(5,'E','25-OCT-2001','MALE',1,'JAMNAGAR','LAB.ASSISTANT',15000,0,'E@GMAIL.COM');
-----------------------------------------------------------

create table departmet2(
dept_no number(10) primary key,
dept_name varchar(20) UNIQUE,
location varchar(20));

	INSERT INTO departmet2 VALUES(1,'MCA','FF');
	INSERT INTO departmet2 VALUES(2,'IT','FF');
	INSERT INTO departmet2 VALUES(3,'ACCOUNT','SF');
	INSERT INTO departmet2 VALUES(4,'STUDENT','SF');
	INSERT INTO departmet2 VALUES(5,'BCA','TH');

--7.Describe the structure of table1 created
	desc employee;
	desc departmet2;
	
--8.List all records of each table in ascending order.
	select * from employee ORDER by emp_id;
	select * from departmet2 ORDER by dept_no;
	
--9.Delete the department whose loction is Ahmedabad.
	delete from departmet2 where location='ah';

-- 10. Display female employee list
	select emp_name from employee where gender = 'female';

-- 11. Display Departname wise employee Names
	select e.emp_name,d.dept_name,e.dept_no
	from employee e,departmet2 D
	where e.dept_no = d.dept_no order by d.dept_name;

-- 12. Find the names of the employee who has salary less than 5000 and greater than 2000.
	Select emp_name,salary from employee
	where 
	salary BETWEEN 2000 and 5000;

-- 13. Display the names and the designation of all female employee in descending order.
	select emp_name,designation,gender 
	from
	employee where gender='female' order BY emp_name;

-- 14. Display the names of all the employees who names starts with ‘A’ ends with ‘A’.
	select emp_name from employee where emp_name like 'M%A';

-- 15. Find the name of employee and salary for those who had obtain minimum salary.
	select emp_name,salary from employee;
	select emp_name,salary from employee where salary=(
	select min(salary) from employee);
	select count(*) from employee;

-- 16. Add 10% raise in salary of all employees whose department is ‘IT’.
	select salary,dept_no from employee where dept_no=(
	select dept_no from departmet2 where dept_name='it');
	
	SELECT salary,salary * 0.10,
	(salary+(salary * 0.10)) new_salary,dept_no
	from employee
	where dept_no=(
	select dept_no from departmet2 where dept_name='it'
	);
	
	update employee set salary=salary+(salary * 0.10) 
	where 
	dept_no=(select dept_no from departmet2 where dept_name='it');

-- 17. Count total number of employees of ‘IT’ department.
	select count(*) from employee 
	where 
	dept_no=(select dept_no from departmet2 where dept_name='it');

-- 18. List all employees who born in the current month.
	select * from employee where birth_date like '%-OCT-%';
	
	select emp_name,birth_date from employee 
	where 
	TO_CHAR(birth_date,'MON')=(select TO_CHAR(SYSDATE,'MON') from dual);
	select SYSDATE from dual;
	select TO_CHAR(SYSDATE,'MON') from dual;

-- 19. Print the record of employee and dept table as “Employee works in department‘MBA’.
	select e.emp_name ||' Work in '|| d.dept_name ||
	'DEPARTMENT' 
	from employee e,departmet2 d 
	where 
	e.dept_no = d.dept_no;

-- 20. List names of employees who are fresher’s (less than 1 year of experience).
	select emp_name,EXPERIANCE from employee where EXPERIANCE<=1;

-- 21. List department wise names of employees who has more than 5 years of experience.
	select e.emp_name,e.EXPERIANCE,d.dept_name
	FROM
	employee e,departmet2 d
	where 
	e.EXPERIANCE>=2 AND
	d.dept_no = e.dept_no
	order by d.dept_name,e.EXPERIANCE;

-- 22. Crete Sequence to generate department ID
	create SEQUENCE seq start with 1
	INCREMENT by 1 MINVALUE 0 MAXVALUE 15 CYCLE; 

	select seq.nextval from dual;
	select seq.currval from dual;
	
	alter SEQUENCE seq INCREMENT by 1;

-- 23. List department having no employees
	select d.dept_no,e.dept_no from departmet2 d ,employee e 
	where d.dept_no = e.dept_no;
	
	SELECT dept_name from departmet2
	where 
	dept_no in (SELECT dept_no from employee);


