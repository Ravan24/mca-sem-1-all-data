create table  employee2
(emp_id int PRIMARY KEY,
emp_name VARCHAR(15) NOT NULL,
birth_date DATE NOT NULL,
gender VARCHAR(10) NOT NULL,
dept_no int REFERENCES depart(dept_no),
address VARCHAR(25),
designation VARCHAR(10) not NULL,
salary NUMBER(18) not NULL,
experiance int not NULL,
email VARCHAR(20) UNIQUE 
);

insert into employee2 VALUES(&emp_id,'&emp_name','&birth_date','&gender',&dept_no,'&address','&designation',&salary,&experiance,'&email'
);

insert into employee2 VALUES(1,'admin','20-may-2001','male',1,'jamnagar','hr',10000,2,'admin@gmail.com');
insert into employee2 VALUES(2,'abc','1-june-1995','female',2,'jamnagar','jr.hr',20000,3,'abc@gmail.com');
insert into employee2 VALUES(3,'xyz','10-may-2001','male',4,'jamnagar','sr.hr',15000,4,'xyz@gmail.com');
insert into employee2 VALUES(4,'lmn','20-may-2001','male',5,'jamnagar','developer',17000,5,'lmn@gmail.com');
insert into employee2 VALUES(5,'A','20-dec-2002','male',6,'jamnagar','developer',17000,5,'a@gmail.com');

/*-----------------------------------*/
create table depart 
(dept_no int PRIMARY KEY,
dept_name varchar(15) not null,
total_employee int check (total_employee BETWEEN 0 AND 50),
location varchar(20) not NULL
);

insert into depart VALUES(&dept_no,'&dept_name',&total_employee,'&location');

insert into depart VALUES(1,'Mca',10,'ff');
insert into depart VALUES(2,'Mba',4,'ff');
insert into depart VALUES(4,'Mcom',5,'sf');
insert into depart VALUES(5,'Bcom',8,'sf');
insert into depart VALUES(6,'bba',10,'tf');

/*-------------------------------------------*/
create table project 
(proj_id int PRIMARY KEY,
type_of_project VARCHAR(20) NOT NULL,
status VARCHAR(10) not null,
start_date date not null,
emp_id int REFERENCES employee2(emp_id)
);

insert into project values(1,'Web project','running','11-june-2021',4);
insert into project values(2,'Adnriod project','running','11-june-2020',2);
insert into project values(3,'erp project','complete','12-june-2020',2);
insert into project values(4,'Web project','running','13-june-2021',1);
insert into project values(5,'Web project','Pending','14-june-2021',5);
/*----------------------------------------------*/\


select * from employee2;
select * from depart;
select * from project;

--1.Delete the department whose total number of employees less than 1
    DELETE FROM depart WHERE total_employees < 1;

--2.Display the names and the designation of all female employee in descending order.
    SELECT emp_name,designation FROM employee where gender='female' order by emp_name;

--3.Display the names of all the employees who names starts with ‘A’ ends with ‘A’.
    select * from employee2 where emp_name like 'A%A';

--4.Find the name of employee and salary for those who had obtain minimum salary.
    select emp_name,salary from employee2 Where salary=(select min(salary) from employee);

--5.Add 10% raise in salary of all employees whose department is ‘CIVIL’.
    select emp_name,salary,salary*0.10,(salary-(salary*0.10))new_salary from employee2
	where
    dept_no=(select dept_no from depart where dept_name='Mca');
 
--6.Count total number of employees of ‘MCA’ department
    select count(emp_id) from employee2 where dept_no =(
    select dept_no from depart where dept_name='Mca');

--7.List all employees who born in the current month.
    select * from employee2 where birth_date =(select to_char(sysdate,'mm') from dual); 
    select to_char(sysdate,'mm') from dual;

    select * from employee2
    where birth_date like ‘%-jan-%’;

--8.Print the record of employee and dept table as “Employee works in department ‘CE’.
    select * from employee2;
    select * from depart;
    select * from depart where dept_name='ce';

    select * from employee2 where dept_no = (
    select dept_no from depart where dept_name='Mba');

--9.List names of employees who are fresher’s(less than 1 year of experience).
    select emp_name from employee2 where EXPERIANCE<1;

--10.List department wise names of employees who has more than 5 years of experience
    Select dept_no,dept_name 
    from depart 
    where dept_no=(select dept_no from employee2 where EXPERIANCE>2) 
    and order by dept_name;
    
    --OR--
    
    select e.emp_id,e.emp_name,e.EXPERIANCE,d.dept_name
    from employee2 e,depart d
    where e.dept_no=d.dept_no and e.EXPERIANCE>5 order by d.dept_name;
--11. Write a function which will display total number of projects based on status (pass status as parameter).

SELECT total_number_of_projects('running') from dual;

declare 
	n number(5);
BEGIN
	n:=total_number_of_projects('running');
	dbms_output.put_line('total_number_of_projects'||n);
end;
/	
	
--12.12. Write a procedure that will display list of projects which is going to start today.
CREATE or replace PROCEDURE display_projects_start_today
IS
	CURSOR c1
	is SELECT proj_id,type_of_project,status from project
	where start_date='11-JUN-2020';
	
BEGIN
	for r in c1 LOOP
		dbms_output.put_line(r.proj_id||'....'||r.type_of_project||'....'||r.status);
	end LOOP;
end;
/
----------
exec display_projects_start_today
-----------------------	