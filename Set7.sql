create table CUSTOMER
(
    cno int PRIMARY KEY,
    cust_name VARCHAR2(10),
    cust_phone number(10) UNIQUE,
    location VARCHAR2(10),
    gender VARCHAR2(10) CHECK(gender in('male','female','MALE','FEMALE'))
);


insert into CUSTOMER values(1,'A',12345,'Jam','male');
insert into CUSTOMER values(2,'B',67890,'Jam','female');
insert into CUSTOMER values(3,'C',01234,'Raj','male');
insert into CUSTOMER values(4,'D',12348,'Jam','female');
insert into CUSTOMER values(5,'E',6789,'Raj','male');

update CUSTOMER set location="Rajkot" where CUST_ITEM="c";

create table ITEM
(
    itemno int PRIMARY KEY,
    itemname VARCHAR2(10) NOT NULL,
    color VARCHAR2(10),
    weight number(10),
    expire_date date,
    price number(5),
    shop_name VARCHAR2(10)
);

insert into ITEM values(1,'LAPTOP','BLACK',1,'26-AUG-2000',35000,'A SHOP');
insert into ITEM values(2,'SMARTPHONE','SILVER',0.50,'27-AUG-2000',25000,'A SHOP');
insert into ITEM values(3,'HEADPHONE','RED',0.70,'28-AUG-2000',150,'B SHOP');
insert into ITEM values(4,'MOUSE','WHITE',0.50,'28-AUG-2000',150,'C SHOP');
insert into ITEM values(5,'KEYBOARD','WHITE',1,'28-AUG-2000',400,'D SHOP');

create table CUST_ITEM
(
    cno int REFERENCES CUSTOMER(cno),
    itemno int REFERENCES ITEM(itemno),
    quantity_purchased number(10) CHECK(quantity_purchased>0),
    date_purchased date
);

insert into CUST_ITEM values(1,1,1,'26-AUG-1991');
insert into CUST_ITEM values(2,3,2,'27-AUG-1992');
insert into CUST_ITEM values(3,4,5,'28-AUG-1993');
insert into CUST_ITEM values(4,2,1,'28-AUG-1993');
insert into CUST_ITEM values(3,5,5,'28-AUG-1993');


SELECT * FROM CUSTOMER;
SELECT * FROM ITEM;
SELECT * FROM CUST_ITEM;


DELETE FROM CUSTOMER;
DELETE FROM ITEM;
DELETE FROM CUST_ITEM;

DROP TABLE CUSTOMER;
DROP TABLE ITEM;
DROP TABLE CUST_ITEM;

/*1. Delete the items whose price is more than 50000. .*/
delete from ITEM where price>25000;

/*2. Find the names of the customer who is located in same location as that of other
customer.*/
select location,count(*) from CUSTOMER group by location having count(*)>=2;
select location,cust_name from CUSTOMER group by location,cust_name order by location;


/*3. Display the names of items which is black, white & brown in color.*/
select itemname from item where color in('BLACK','BLUE','RED');

/*4. Display the names of all the items whose names lies between ‘p’ and‘s’.*/
select itemname from item where itemname BETWEEN 'H' and 'K';

/*5. Find the item which is having less weight.*/
SELECT WEIGHT FROM ITEM;
SELECT MIN(WEIGHT) FROM ITEM;

SELECT * FROM ITEM WHERE WEIGHT = (SELECT MIN(WEIGHT) FROM ITEM);
SELECT * FROM ITEM WHERE WEIGHT = (SELECT MAX(WEIGHT) FROM ITEM);

/*6. Add one month more to those items whose item no =40.*/
UPDATE ITEM SET EXPIRE_DATE=ADD_MONTHS(EXPIRE_DATE,1)  WHERE ITEMNO=1;

/*7. Count total number of items which is going to expire in next month*/
SELECT COUNT(*) FROM ITEM 
WHERE 
TO_CHAR(EXPIRE_DATE,'MON')=(SELECT TO_CHAR(ADD_MONTHS(SYSDATE,1),'MON') FROM DUAL);

/*8. List all customers whose phone number starts with ‘99’.*/
SELECT cust_phone FROM CUSTOMER;
UPDATE CUSTOMER SET cust_phone=999567 WHERE cust_name='C';

SELECT cust_phone FROM CUSTOMER WHERE CUST_PHONE LIKE '99%';
/*9. Display total value (qty*price) for all items.*/

SELECT * FROM ITEM;

SELECT I.itemname,I.PRICE,CI.quantity_purchased,(quantity_purchased*price) AS TOTAL_AMOUNT 
FROM ITEM I,CUST_ITEM CI
WHERE I.itemno=CI.itemno;


/*10. List customer details who has purchased maximum number of items*/

select * from CUSTOMER where cno in(
select cno from CUST_ITEM  group by cno having count(cno)=
(select max(ic) from (select cno,count(cno) as ic from CUST_ITEM
group by cno)));

---------------------------------------------------------------------------

select * from CUSTOMER where cno in(select cno from
(select cno,count(cno) as ic from CUST_ITEM group by cno order by cno) where rownum=1);




/*11. Display total price item wise.*/

select ci.quantity_purchased,(quantity_purchased*price) as total, i.price, i.itemname
from CUST_ITEM ci, ITEM i
where i.itemno=ci.itemno; 

/*12. List name of items, customer details and qty purchased.*/

select c.cust_name, i.itemname, ci.quantity_purchased
from CUSTOMER c, ITEM i, CUST_ITEM ci
where c.cno=ci.cno and
i.itemno=ci.itemno;

--13. Write a PL/SQL procedure which will display records in the following format
DECLARE	
	CURSOR c1
	IS
	SELECT ITEM.itemno,itemname,expire_date,price,
	quantity_purchased,shop_name,
	price*quantity_purchased as AMT
	from ITEM,CUST_ITEM
	WHERE
	ITEM.itemno=CUST_ITEM.itemno
	AND
	shop_name='A SHOP';
	DT DATE;
	SP_NAME VARCHAR2(20);
	TOT_AMT NUMBER(10);
BEGIN
	SP_NAME:='A SHOP';
	TOT_AMT:=0;
	SELECT SYSDATE into DT from dual;
	dbms_output.put_line('-----------------------------------------------');
	dbms_output.put_line('today DATE :'||DT||' SHOP NAME:'||SP_NAME);
	dbms_output.put_line('------------------------------------------------');
	for r in c1 LOOP
		dbms_output.put_line(
		Rpad(to_char(r.itemno),5)||
		Rpad(r.itemname,15)||
		lpad(to_char(r.expire_date),12)||
		lpad(to_char(r.price),8)||
		lpad(to_char(r.quantity_purchased),8)||
		lpad(to_char(r.AMT),8));
		TOT_AMT:=TOT_AMT+r.AMT;
	end loop;
	dbms_output.put_line('-----------------------------------------------');
	dbms_output.put_line('grand total '||TOT_AMT);
	dbms_output.put_line('------------------------------------------------');
end;
/
---PROCEDURE
CREATE or REPLACE PROCEDURE p1
is	
	CURSOR c1
	IS
	SELECT ITEM.itemno,itemname,expire_date,price,
	quantity_purchased,shop_name,
	price*quantity_purchased as AMT
	from ITEM,CUST_ITEM
	WHERE
	ITEM.itemno=CUST_ITEM.itemno
	AND
	shop_name='A SHOP';
	DT DATE;
	SP_NAME VARCHAR2(20);
	TOT_AMT NUMBER(10);
BEGIN
	SP_NAME:='A SHOP';
	TOT_AMT:=0;
	SELECT SYSDATE into DT from dual;
	dbms_output.put_line('-----------------------------------------------');
	dbms_output.put_line('today DATE :'||DT||' SHOP NAME:'||SP_NAME);
	dbms_output.put_line('------------------------------------------------');
	for r in c1 LOOP
		dbms_output.put_line(
		Rpad(to_char(r.itemno),5)||
		Rpad(r.itemname,15)||
		lpad(to_char(r.expire_date),12)||
		lpad(to_char(r.price),8)||
		lpad(to_char(r.quantity_purchased),8)||
		lpad(to_char(r.AMT),8));
		TOT_AMT:=TOT_AMT+r.AMT;
	end loop;
	dbms_output.put_line('-----------------------------------------------');
	dbms_output.put_line('grand total '||TOT_AMT);
	dbms_output.put_line('------------------------------------------------');
end;
/
		
	

