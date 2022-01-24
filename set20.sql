--1. Find out the names of all the tables, views and constraints associated with current 
--tables in the system.
select OBJECT_name from user_objects
where OBJECT_type='TABLE' or OBJECT_type='VIEW'; 
--
select * from user_cons_colomns where table_name=CUSTOMER11;

--2. Write a query to add 15 days to the current date.
select SYSDATE+15 from dual;

--3. Write a query to Add and subtract 5 months from the current month
select ADD_MONTHS(sysdate,-5) from dual;

--4.4. Find out the ASCII equivalent of character ‘M’
select ascii('M') from dual;

--5. Find out the character equivalent of ASCII 67, 65 and 84.
SELECT chr(67),chr(65),chr(84) from dual;

--6. Write a query to find the last day of the month.
SELECT LAST_DAY(sysdate)from dual;

--7. Find out how many days are left in the current month.
SELECT LAST_DAY(sysdate)-SYSDATE"days left" from dual;

--8. Write a query to calculate the Date difference between current date and 20/05/2015.
select sysdate-TO_DATE('20/05/2015','dd-mm-yy') from dual;

--9. Write a query to Calculate the number of months between current date and 03/03/2016.
select MONTHS_BETWEEN(sysdate,to_date('30/03/2016','dd-mm-yy'))"month" from dual;

--10. Find out the second occurrence of ‘or’ from third position in the string ‘corporate floor
select instr('corporate Floor','or',1,2)from dual;

--11. Find out log to the base 3 of 81
select log(3,81)"log base 3 and 81"from dual;

--12. Convert the string ‘gujarat technological university’ so that first character of each work is in capital
select INITCAP('gujarat technological university')from dual;

--13. Convert the string ‘jack and jue’ Into ‘black and blue’
select REPLACE('jack and jue','j','bl')"chang" from dual;

--14. Round off the date 27-July-2016 to the current year.
select trunc(to_date('27-july-2016','dd-mon-yy'),'year')"current year" from dual;
select round(to_date('27-july-2016','dd-mon-yy'),'year')"current year" from dual;

--15. Find out the user name and user id off currently logged on user.
select username from v$session;

