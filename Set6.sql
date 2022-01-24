create table DOCTOR(
    dno number(10) PRIMARY KEY,
    dname VARCHAR2(20) NOT NULL,
    specializtion VARCHAR2(20) NOT NULL,
    clinic_addr VARCHAR2(20) NOT NULL
);

insert into DOCTOR values(1,'DR.SHAH','SURGION','RK ROAD');
insert into DOCTOR values(2,'DR.MEHTA','SURGION','NEHRU ROAD');
insert into DOCTOR values(3,'DR.VIRANI','SURGION','P.N ROAD');
insert into DOCTOR values(4,'DR.VORA','SURGION','M.N ROAD');
insert into DOCTOR values(5,'DR.RUPANI','SURGION','O.K ROAD');
insert into DOCTOR values(6,'DR.RUP','SURGIONS','J.K ROAD');

create table MEDICINE(
    mno number(10) PRIMARY KEY,
    mname VARCHAR2(20) NOT NULL,
    type VARCHAR2(20) NOT NULL,
    content VARCHAR2(20) NOT NULL,
    manufacturer VARCHAR2(20) NOT NULL
);

insert into MEDICINE values(1,'METACINE','FEVER','NOT BELOW 18','VIRANI');
insert into MEDICINE values(2,'O2','INFECTION','NOT BELOW 19','SHAH');
insert into MEDICINE values(3,'COMBIFLAME','THROUGHT','NOT BELOW 20','VORA');
insert into MEDICINE values(4,'O2H','INFECTION','NOT BELOW 21','MEHTA');
insert into MEDICINE  values(5,'STREPSEEL','COUGH','NOT BELOW 22','NEHRA');

create table DISEASE(
    disease_name VARCHAR2(10) PRIMARY KEY,
    symptom1 VARCHAR2(20) NOT NULL,
    symptom2 VARCHAR2(20) NOT NULL,
    symptom3 VARCHAR2(20) NOT NULL
);

insert into DISEASE values('CANCER','PAIN','COUGH','COLD');
insert into DISEASE values('COVID','COUGH','PAIN','COLD');
insert into DISEASE values('DANGUE','COLD','COUGH','PAIN');
insert into DISEASE values('N1H1','PAIN','COUGH','COLD');
insert into DISEASE values('POLIO','PAIN','COUGH','COLD');

create table TREATMENT(
    tno number(10) PRIMARY KEY,
    dno number(10) REFERENCES DOCTOR(dno),
    disease_name VARCHAR2(20) REFERENCES DISEASE(disease_name),
    mno number(20) REFERENCES MEDICINE(mno),
    dosage number(20),
    avg_cure_time number(10)
);


insert into TREATMENT values(1,1,'CANCER',1,100,1);
insert into TREATMENT values(2,2,'COVID',2,200,2);
insert into TREATMENT values(3,3,'DANGUE',3,300,3);
insert into TREATMENT values(4,4,'N1H1',4,400,4);
insert into TREATMENT values(5,5,'POLIO',5,500,5);



--1.Display records of each table in ascending order.
    select * from DOCTOR order by tno;
    select * from MEDICINE order by mno;
    select * from DISEASE order by disease_name;
    select * from TREATMENT order by tno;

--2.Count total number of doctors which has not given any treatment.
    select count(dno) from DOCTOR where dno NOT in(select dno from TREATMENT);

--3.Display all Chennai doctors who treat cancer.
    select * from DOCTOR 
    where clinic_addr='RK ROAD' and dno in(select dno from TREATMENT where disease_name='CANCER');


--4.Remove disease “polio” from disease table as well as treatment table.
    delete from DISEASE where disease_name='POLIO';
    delete from TREATMENT where disease_name='POLIO';


--5.Delete all those treatment related to liver of Dr.Shah
    delete from TREATMENT where disease_name='N1H1' and dno in(select dno from DOCTOR where dname='DR.VORA');


--6.Create index on dno, Disease name in the treatment table.
    create INDEX indx_dno_disease_name on TREATMENT(dno,disease_name);
    set autotrace on;
    set autotrace off;


--7.Display details of doctors who treat migraines.
    select * from DOCTOR where dno in(select dno from TREATMENT where disease_name='DANGUE');

/*8.What is the maximum dosage of “penicillin” prescribe by the doctor for the
treatment of any disease?*/
    select max(dosage) from TREATMENT 
    where 
    mno in(select mno from MEDICINE where mname='METACINE');


--9.Display total number of disease treated by every doctor.
    select d.dname, count(t.disease_name)
    from DOCTOR d, TREATMENT t
    where d.dno=t.dno 
    group by dname;


--10.Which doctor have no treatment for “depression”?
    select dno,dname from 
    DOCTOR where dno not in(select dno from TREATMENT where disease_name='DEPRESSION');
--12. Write a PL/SQL block to print the following report ( Symptoms wise print total number of medicine given )
	
DECLARE
	CURSOR c
	IS
	SELECT A.mno as medicine, count(B.symptom1) as Symptom1,
	COUNT(B.symptom2) as Symptom2,count(B.symptom3)as Symptom3,
	count(B.symptom1)+count(B.symptom2)+count(B.symptom3)as Total from TREATMENT A, DISEASE B
	where A.disease_name=B.disease_name GROUP by A.mno;
	BEGIN
		dbms_output.put_line('------------------------------------------------------------------------------------------');
		dbms_output.put_line(
		Rpad('DISEASE_name',15)||
		RPAD('Symptom1',15)||
		RPAD('Symptom2',15)||
		RPAD('Symptom3',15)||
		RPAD('TOTAL',15));
		dbms_output.put_line('______________________________________________________');
		for r in c LOOP
			dbms_output.put_line(
			RPAD(r.MEDICINE,15)||
			RPAD(r.symptom1,15)||
			RPAD(r.symptom2,15)||
			RPAD(r.symptom3,15)||
			RPAD(r.TOTAL,15));
		end loop;
		dbms_output.put_line('_________________________________________________________________________________________');
end;
/
	
