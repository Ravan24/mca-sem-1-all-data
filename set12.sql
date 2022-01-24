create table CUSTOMER(
cid number(10) PRIMARY KEY, 
fname varchar(30), 
lname varchar(30), 
city varchar(30), 
country varchar2(20), 
phone number(10)
);
-----------------------------------------
insert into CUSTOMER values(1,'shiva','shiv','jamnagar','india',1223231);
insert into CUSTOMER values(2,'priyank','patel','chichim','china',4223231);
insert into CUSTOMER values(3,'priyanka','mdsv','vilocity','abhudhabi',6223231);
insert into CUSTOMER values(4,'priya','maha','ramnagar','india',1823231);
insert into CUSTOMER values(5,'priyansu','heve','nobuto','japan',5223231);
insert into CUSTOMER values(6,'pritesh','murtj','nobutio','japan',5223231123);
-------------------------------------

CREATE table ORDER1 (
oid int, 
oDate date, 
oNumber number(10), 
cid number(10) REFERENCES CUSTOMER(cid), 
oTotalAmount number(10)
);
--------------------------------------------------------------
insert into ORDER1 values(1,'10-mar-2021',201,1,200000); 
 insert into ORDER1 values(2,'15-apr-2021',202,2,1200000); 
 insert into ORDER1 values(3,'15-may-2021',203,3,12000); 
 insert into ORDER1 values(4,'25-may-2021',204,4,112000); 
 insert into ORDER1 values(5,'25-dec-2021',205,5,1012000); 
 insert into ORDER1 values(6,'5-dec-2021',206,6,101200); 
  
 