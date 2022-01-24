create table student
(
	rollno int PRIMARY KEY,
	name varchar2(50),
	class varchar2(50),
	birthdate date
);

INSERT INTO STUDENT VALUES(1,'A','CLASS A','23-JAN-2001');
INSERT INTO STUDENT VALUES(2,'B','CLASS B','01-MAY-1998');
INSERT INTO STUDENT VALUES(3,'C','CLASS B','05-OCT-2001');
INSERT INTO STUDENT VALUES(4,'D','CLASS A','11-NOV-1999');
INSERT INTO STUDENT VALUES(5,'E','CLASS A','21-DEC-2001');

create table course
(
	courseno int PRIMARY KEY,
	coursename varchar2(20),
	max_marks int,
	pass_marks int
);

insert into course values(&courseno,'&coursename',&max_marks,&pass_marks);
INSERT INTO COURSE VALUES(1,'MCA',100,35);
INSERT INTO COURSE VALUES(2,'NETWORKING',100,45);
INSERT INTO COURSE VALUES(3,'BCA',100,28);
INSERT INTO COURSE VALUES(4,'B.COM',100,28);
INSERT INTO COURSE VALUES(5,'M.COM',100,35);

create table sc
(
	rollno int REFERENCES student(rollno),
	courseno int REFERENCES course(courseno),
	marks int check(marks>0 and marks<100)
);

insert into sc values(&rollno,&courseno,&marks);
INSERT INTO SC VALUES(1,1,68);
INSERT INTO SC VALUES(2,2,75);
INSERT INTO SC VALUES(3,3,20);
INSERT INTO SC VALUES(4,4,40);
INSERT INTO SC VALUES(5,5,45);

-- 3. Add a constraint that the marks entered should strictly be between 0 and 100.
	alter table sc modify check(marks>0 && marks<100);

-- 4. While creating SC table, composite key constraint was forgotten. Add the composite keynow.
	alter table sc add primary key(rollno,courseno);

-- 5. Display details of student who takes ‘Database Management System’ course.
	select a.name,a.rollno,b.coursename,c.rollno from student a, sc c, course b
 	where  a.rollno=c.rollno and b.courseno=c.courseno and b.coursename='mca';

 	--OR--
 	select a.rollno,b.coursename,c.rollno
	from
	student a,
	course b,
	sc c
	where 
	b.coursename='mca' and 
	c.rollno = a.rollno 
	and b.courseno=c.courseno;
	--OR--


-- 6. Display the names of students who have scored more than 70% in Computer Networksand have not failed in any subject.
	select DISTINCT rollno from sc
	where  marks >=70
	and rollno not IN
	(select rollno from sc where marks <40);
	
	--OR--
	select DISTINCT st.*
	from sc s,course c,student st
	where
	s.marks>70 AND
	c.coursename='mca' 
	and 
	st.rollno = s.rollno
	AND
	s.rollno IN
	(select rollno from sc where rollno not in (
	select rollno from sc,course 
	where 
	marks<course.pass_marks));

-- 7. Display the average marks obtained by each student.
	select rollno,name from student;
	select rollno,marks from sc;
		
	select st.name,avg(marks) 
	from student st,sc s
	where s.rollno = st.rollno GROUP BY st.name;

-- 8. Select all courses where passing marks are more than 30% of average maximum mark.
	select * from course where 
	pass_marks>(select avg(max_marks)*0.38 from course);

-- 9. Display details of students who are born in 1980 or 1982.
	select * from student  where to_char(birthdate,'yyyy') in (2000,2002);

-- 10. Create a view that displays student courseno and its corresponding marks.
	create VIEW v1 as
	select a.courseno,b.coursename,a.marks from sc a,course b where a.courseno=b.courseno;	
