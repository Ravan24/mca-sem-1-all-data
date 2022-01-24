
/*1. Create the Simple DEPARTMENT Table.*/
create table department
(Dept_no number(20),
 Dept_name varchar(30),
 Location varchar(30));

/*2. Display structure of department table.*/
desc department;

/*3. Insert below records into Department Table*/
insert into department values(10,'account','ny');
insert into DEPARTMENT values(20,'HR','NY');
insert into DEPARTMENT values(30,'Production','DL');
insert into DEPARTMENT values(40,'Sales','NY');
insert into DEPARTMENT values(50,'EDP','MU');
insert into DEPARTMENT values(60,'TRG','');
insert into DEPARTMENT values(100,'RND','AH');
insert into department values(&dept_no,&dept_name,&location);

/*4. Display all records of Department table*/
select * from department;

/*5. Display all department belonging to location 'NY'*/
select * from where location='ny';

/*6. Display details of Department 10*/
select * from department where dept_no=10;

/*7. List all department names starting with 'A'*/
select * from department where Dept_name like ('A%');

/*8. List all departments whose number is between 1 and 100 */
SELECT * from department where Dept_no BETWEEN 1 and 5;

/*9. Delete 'TRG' department */
delete from department Where Dept_name='trg'; 

/*10. Change department name 'EDP' to 'IT' */
update department set Dept_name='It' Where Dept_name='Edp';