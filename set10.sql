CREATE TABLE CATEGORY(
    CAT_CODE NUMBER primary key, 
    CATDESC VARCHAR2(25) CHECK(CATDESC in('DELUXE', 'SUPERDELUXE', 'SUPERFAST','NORMAL'))
    );

INSERT INTO CATEGORY VALUES(1,'DELUXE');
INSERT INTO CATEGORY VALUES(2,'SUPERDELUXE');
INSERT INTO CATEGORY VALUES(3,'SUPERFAST');
INSERT INTO CATEGORY VALUES(4,'NORMAL');



  CREATE TABLE  ROUTEMASTER(
    ROUTENO NUMBER primary KEY, 
    ORIGIN VARCHAR2(25) NOT NULL, 
    DESTINATION VARCHAR2(25) NOT NULL, 
    FARE NUMBER, 
    DISTANCE NUMBER,
    CAPACITY NUMBER CHECK(CAPACITY>0 AND CAPACITY<=60), 
    DAY DATE, 
    CAT_CODE NUMBER REFERENCES CATEGORY(CAT_CODE),
    CHECK(DESTINATION!=ORIGIN)
  );


INSERT INTO ROUTEMASTER VALUES(1,'JAM','RJK',100,90,40,'26-NOV-21',4);
INSERT INTO ROUTEMASTER VALUES(2,'JAM','SURAT',500,534,40,'26-NOV-21',4);
INSERT INTO ROUTEMASTER VALUES(3,'JAM','SURAT',700,534,40,'26-NOV-21',1);
INSERT INTO ROUTEMASTER VALUES(4,'JAM','SURAT',900,534,40,'26-NOV-21',2);
INSERT INTO ROUTEMASTER VALUES(5,'JAM','SURAT',1200,534,40,'26-NOV-21',3);


CREATE TABLE  TICKETHEADER(
    TICKETNO NUMBER primary KEY, 
    DATEOFISSUE DATE, 
    DATEOFTRAVEL DATE, 
    BOARDPLACE VARCHAR2(20), 
    ROUTENO NUMBER REFERENCES ROUTEMASTER(ROUTENO)
    );

INSERT INTO TICKETHEADER VALUES(1,'25-NOV-21','26-NOV-21','aaa',1);
INSERT INTO TICKETHEADER VALUES(2,'25-NOV-21','26-NOV-21','aaa',2);
INSERT INTO TICKETHEADER VALUES(3,'25-NOV-21','26-NOV-21','aaa',3);
INSERT INTO TICKETHEADER VALUES(4,'25-NOV-21','26-NOV-21','aaa',4);
INSERT INTO TICKETHEADER VALUES(5,'25-NOV-21','26-NOV-21','aaa',5);
INSERT INTO TICKETHEADER VALUES(6,'25-NOV-21','26-NOV-21','aaa',1);
INSERT INTO TICKETHEADER VALUES(7,'25-NOV-21','26-DEC-21','aaa',1);


CREATE TABLE TICKET_DETAILS(
    TICKETNO NUMBER REFERENCES TICKETHEADER(TICKETNO), 
    NAME VARCHAR2(20), 
    SEX VARCHAR2(1) CHECK(SEX IN('F','M')), 
    AGE NUMBER CHECK(AGE>0), 
    FARE NUMBER,

    );    

INSERT INTO TICKET_DETAILS VALUES(1,'aaa','F',24,100);  
INSERT INTO TICKET_DETAILS VALUES(1,'bbb','M',25,100);   
INSERT INTO TICKET_DETAILS VALUES(2,'cc','M',34,500);
INSERT INTO TICKET_DETAILS VALUES(3,'ddd','M',40,700);
INSERT INTO TICKET_DETAILS VALUES(4,'eee','F',26,900);
INSERT INTO TICKET_DETAILS VALUES(5,'fff','F',27,1200);
INSERT INTO TICKET_DETAILS VALUES(6,'ggg','F',27,1200);
INSERT INTO TICKET_DETAILS VALUES(7,'h','F',27,1200);


-- 1. Display the total number of people traveled on each ticket group by ticket no 23.
select * from TICKET_DETAILS where TICKETNO=1;

-- 2. Give the total collection of fare for each route.
SELECT sum(td.fare),r.ROUTENO 
from TICKET_DETAILS td,TICKETHEADER th,ROUTEMASTER r  
where 
r.ROUTENO=th.ROUTENO 
and 
th.TICKETNO=td.TICKETNO 
GROUP by  r.ROUTENO;


-- 3. Give the number of months between issue date and travel date of each ticket issued.

sELECT TICKETNO,to_char(DATEOFTRAVEL,'MM')-to_char(DATEOFISSUE,'MM') as Gape 
from TICKETHEADER; 


-- 4. Count number of person boarding from the same place and same route.
-- Select rows from a Table

select th.BOARDPLACE,th.ROUTENO,count(td.TICKETNO)
from
TICKETHEADER th,
TICKET_DETAILS td
where
th.TICKETNO=td.TICKETNO
group by th.BOARDPLACE,th.ROUTENO
having count(td.TICKETNO)>1;


-- 5. Display count of person who has traveled in each category. 
select c.catdesc,count(td.ticketno)
from CATEGORY c,TICKET_DETAILS td, ROUTEMASTER rm, TICKETHEADER th
where c.CAT_CODE=rm.CAT_CODE and
th.ticketno=td.ticketno and
rm.routeno=th.routeno
group by catdesc;

--7. Write a Procedure which will print tour details, a driver is going to take it. ( pass 
--route_no as parameter)
--Route No: ____________ Vehicle number: __________________
CREATE or REPLACE PROCEDURE print_tour_details(rno ROUTEMASTER.ROUTENO%type)
IS
	cursor c1
	is select ROUTEMASTER.ROUTENO,ORIGIN,
	DESTINATION,DATEOFTRAVEL,DAY,CAPACITY
	FROM
	ROUTEMASTER,TICKETHEADER
	WHERE
	ROUTEMASTER.ROUTENO=TICKETHEADER.ROUTENO and 
	ROUTEMASTER.ROUTENO=rno;
BEGIN
	dbms_output.put_line('route NO:'||rno||'VEhical number 123');
	dbms_output.put_line(RPAD('-',75,'-'));
	dbms_output.put_line(
	RPAD('ORIGIN',15)||
	rpad('DESTINATION',15)||
	rpad('DATEOFTRAVEL',15)||
	rpad('DAY',15)||
	rpad('CAPACITY',15)
	);
	dbms_output.put_line('TRANSPORT DETAIL');
	for r in c1 LOOP
		dbms_output.put_line(
		RPAD(r.ORIGIN,15)||
		rpad(r.DESTINATION,15)||
		rpad(r.DATEOFTRAVEL,15)||
		rpad(r.DAY,15)||
		rpad(r.CAPACITY,15)
		);
	end loop;
	dbms_output.put_line(rpad('-',75,'-'));
end;
/

