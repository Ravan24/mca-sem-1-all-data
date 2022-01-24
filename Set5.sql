Create Table Hostel
(Hno number (18) Primary Key,
Hname varchar(20) Not Null,
Hadder varchar(30) Not Null,
Total_capacity number (18) Not Null,
Warden varchar(20) Not Null
);

insert into Hostel values (1,'Marwadi ','rajkot',10,'Mr A');
insert into Hostel values (2,'bh gardi ','rajkot',15,'Mr B');
insert  into Hostel values (3,'R k institute ','rajkot',10,'Mr C');
insert  into Hostel values (4,'lj insitiute ','rajkot',10,'Mr D');
insert  into Hostel values (5,'gls  ','rajkot',10,'Mr E');

Create Table Room
(Hno number(18) References Hostel(Hno),
Rno number(18),
Rtype varchar(15) not null unique,
Location varchar(15) ,
No_of_student number(18),
Status varchar(15),
Primary Key(Rno,Rtype)
);

insert into room values (2,12,'Single-seated','rajkot',2,'available');
insert into room values (3,20,'Single-seated-Ac','rajkot',2,'1 set available');
insert into room values (3,15,'Double-seated','rajkot',4,'booked');
insert into room values (5,01,'Double-seatedAc','Ahemdabad',5,'available');
insert into room values (1,18,'Tripal-seated','rajkot',3,'booked');

	

Create Table Charges
(Hno number(18) References Hostel(Hno),
Rtype varchar(15) References Room(Rtype),
Charges number(18) Not Null
);

insert into Charges values (2,'Single-seated',500);
insert into Charges values (3,'Double-seated',1500);
insert into Charges values (3,'Single-seated',500);
insert into Charges values (5,'Double-seatedAc',2000);
insert into Charges values (1,'Single-seated',1000);
insert into Charges values (4,'Double-seated',2000);

Create Table Student1 
(Sid number(18) Primary Key, 
Sname varchar(10) Not Null, 
Mobile_no number(18) Not Null, 
Gender varchar(10) Not Null, 
Faculty varchar(15) Not Null, 
Dept varchar(10) Not Null, 
class number(18) Not Null,
Hno number(18) References Hostel(Hno) Not Null, 
Rno number(18) Not Null
);

insert into student1 values (1,'Arjun',1234567890,'male','Com.Science','mca',4,1,12);
insert into student1 values (2,'Vijay',1234567890,'female','commarce','bcom',2,3,15);
insert into student1 values (3,'tej',1234567890,'male','commarce','bba',14,3,15);
insert into student1 values (4,'ram',1234567890,'female','Com.Science','bca',20,5,12);
insert into student1 values (5,'Arjun',1234567890,'male','Com.Science','bsc it',18,1,15);

Create table fees
(Sid number(18) REFERENCES Student1(Sid),
Fdate date not null,
Famount number(18) not null
);
insert into fees values (1,'09-may-2017',10000);
insert into fees values (2,'10-nov-2017',9000);
insert into fees values (3,'02-oct-2017',8000);
insert into fees values (4,'03-nov-2017',7000);
insert into fees values (5,'15-sep-2017',7500);


--1.Display the total number of rooms that are presently vacant.
    SELECT * from ROOM WHERE STATUS='vacant';

--2.Display number of students of each faculty and department wise staying in each hostel.
    select Faculty,Dept,Hname,count(*)
    from student1,hostel
    where 
    hostel.hno=student1.hno GROUP by Faculty,Dept,Hname;

--3.Display hostels, which have at least one single-seated room.
    select * from hostel where Hno in (select Hno from room where Rtype='Single-seated');
    
--4.Display the warden name and hostel address of students of Computer Science department
    select hadder,warden from hostel
    where
    hno in (select hno from student1 where faculty='Com.Science');

--5.Display those hostel details where single seated or double-seated rooms are vacant
    select h.Hname,h.hno,r.Rtype,r.Status
    from Hostel h, Room r
    where h.hno=r.hno and 
    r.Status='available'And 
    Rtype='Single-seated' Or Rtype='double-seated';

--6.Display details of hostels occupied by medical students.
    select s.Sid,s.Sname,s.faculty,h.hno,h.Hname
    from Hostel h,student1 s
    where
    h.hno = s.hno and faculty='Com.Science' order by s.Sid;

--7. Display hostels, which are totally occupied to its fullest capacity
    select h.hno,h.hname,r.status
    from hostel h,room r
    where
    h.hno = r.hno and r.status='booked';/*Wrong OUTPUT*/

    select hno,count(Sid) from student1 GROUP by hno;
    select  hno,Total_capacity from hostel;

    select  hno,Total_capacity from hostel where(hno,Total_capacity) 
    in
    (select hno,count(Sid) from student1 GROUP by hno);

--8.List details about students who are staying in the double-seated rooms of Chanakya Hostel.
    select hno from hostel where hno in (select hno from room where Rtype='Double-seated');
    select * from student1 Where Rno in (select Rno from room Where Rtype='Double-seated');

    select h.hno,h.hname,r.rno,r.Rtype,s.sname
    from hostel h,room r,student1 s where
    h.hno = r.Hno and
    s.hno=h.hno and
    s.hno=r.hno
    and
    r.Rtype='Double-seated';

--9.Display the total number of students staying in each room type of each hostel.
    select s.sname,s.rno,s.hno
    from 
    student1 s,room r,hostel h
    where
    s.hno=r.hno and r.hno=h.hno;

--10.Display details about students who have paid fees in the month of Nov. 2017.
    select s.Sid,s.Sname,s.dept 
    from student1 s, fees f 
    where 
    s.Sid=f.Sid and to_char(f.fdate,'MON')='NOV';

    /*select to_char(fdate,'MON') from fees;
    to_char(F.Fdate,'Mon-yyyy')='NOV-2017';*/

/*11.For those hostels where total capacity is more than 300, display details of students
studying in Science faculty.*/
    update hostel set Total_capacity=200 where Total_capacity=10;

    select s.sid,s.sname,s.faculty,h.hname,h.total_Capacity
    from student1 s,hostel h
    where s.hno=h.hno
    and h.total_capacity>150 and s.faculty='Com.Science';

--12.Display hostel details where there are at least 10 vacant rooms
    select hno,hname from hostel where hno in
    (select hno from room group by hno having count(status)>=3);

    Select hhno,hname,warden from hostel 
    where hno 
    in (select hno from room group by hno having count(status)>=3);


--13.Display details of students who have still not paid fees
    select sid,sname,saddr from student1 where sid not in (select sid from fees);

--14.Display those hostels where single-seated room is the costliest
    select c.hno,h.hname,h.haddr from charges c,hostel h 
    where 
    charges=(select max(charges) from charges where rtype='s') 
    and 
    h.hno=c.hno;
--16. Write a PL/SQL block which will count total number of student’s gender wise.
--Male Students: 999 students
--Female Students: 999 student
DECLARE 
	TOT_m number(5);
	TOT_F number(5);
BEGIN
	select count(*) into TOT_m from student1 where gender='male';
	select count(*) into TOT_F from student1 where gender='female';
	dbms_output.put_line('total male'||TOT_m);
	dbms_output.put_line('total female'||TOT_F);
end;
/