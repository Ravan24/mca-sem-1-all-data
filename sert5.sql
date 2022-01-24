create table HOSTEL (
HNO number PRIMARY KEY, 
HNAME varchar2(20) NOT NULL ,
HADDR varchar2(20)NOT NULL ,
TOTAL_CAPACITY varchar2(30),
WARDEN varchar(20)
);
---------------------------------------------------------------------------
INSERT into HOSTEL VALUES(1,'abc','ramij',100,'karu');
INSERT into HOSTEL VALUES(2,'efg','raj',10,'kariyo');
INSERT into HOSTEL VALUES(3,'hij','amit',300,'rutvik');
INSERT into HOSTEL VALUES(4,'mbc','khisor',700,'kalidas');
INSERT into HOSTEL VALUES(5,'jjc','ramdas',100,'Kaliya');
-------------------------------------------------------------------------------
CREATE table ROOM (
 HNO number REFERENCES HOSTEL(HNO),
 RNO NUMBER ,
 RTYPE VARCHAR2(20),
 LOCATION VARCHAR2(20),
 NO_OF_STUDENTS NUMBER, 
 STATUS VARCHAR2(20),
 PRIMARY KEY (RNO,HNO)
 );
-----------------------------------------------------------------------------
INSERT into ROOM VALUES(1,6,'ac','rajestan',4000,'full');
INSERT into ROOM VALUES(2,7,'non-ac','khalistan',5000,'full');
INSERT into ROOM VALUES(3,8,'ac','pakistan',10,'empty');
INSERT into ROOM VALUES(4,9,'non-ac','kajakiestan',20000,'full');
INSERT into ROOM VALUES(5,10,'non-ac','abhaganistan',40000,'full');
----------------------------------------------------------------------------------
CREATE table CHARGES (
HNO NUMBER REFERENCES HOSTEL(HNO),
RTYPE VARCHAR2(20),
CHARGES NUMBER 
);
----------------------------------------------------------------------------
INSERT into CHARGES values(1,'ac',10000);
INSERT into CHARGES values(2,'non-ac',5000);
INSERT into CHARGES values(3,'ac',1000);
INSERT into CHARGES values(4,'non-ac',1200);
INSERT into CHARGES values(5,'ac',40000);
-----------------------------------------------------------------------------
 create table STUDENT1 (
SID NUMBER PRIMARY KEY,
SNAME VARCHAR2(20),
MOBILENO NUMBER(10),
GENDER VARCHAR2(30),
FACULTY VARCHAR2(40),
DEPT VARCHAR2(40),
CLASES varchar2(30), 
HNO NUMBER REFERENCES HOSTEL(HNO),
RNO NUMBER 
);
---------------------------------------------------------------------------
INSERT INTO STUDENT1 VALUES(10,'priyank',7046079871,'male','br','mca','a',1,6);
INSERT INTO STUDENT1 VALUES(11,'priyanka',7046479871,'female','brj','mba','b',2,7);
INSERT INTO STUDENT1 VALUES(12,'priya',7446079871,'female','bbr','mcaa','c',3,8);
INSERT INTO STUDENT1 VALUES(13,'priyanshu',7066079871,'male','brm','bca','d',4,10);
INSERT INTO STUDENT1 VALUES(10,'dimple',7046079871,'female','bbr','bca','e',5,9);
-----------------------------------------------------------------------------
create table FEES (
SID NUMBER REFERENCES STUDENT1(SID) ,
FDATE DATE,
FAMOUNT NUMBER NOT NULL
);
-----------------------------------------------------------------------------

