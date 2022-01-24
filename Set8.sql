/*
SCREEN (SCREEN_ID, LOCATION, SEATING_CAP)
MOVIE (MOVIE_ID, MOVIE_NAME, DATE_OF_RELEASE)
CURRENT (SCREEN_ID, MOVIE_ID, DATE_OF_ARRIVAL,
DATE_OF_CLOSURE)

Value of screen_id must start with letters ‘S’.
Attribute location can be any one of ‘FF’, ‘SF’, or ‘TF’.
*/

create table screen 
(screen_id varchar2(5) check (screen_id like 'S%'),
location varchar2(8) check( location in ('ff','sf','tf')),
seating_cap number(10),
PRIMARY KEY(screen_id)
);

insert into screen values('S1','ff',50);
insert into screen values('S2','ff',75);
insert into screen values('S3','sf',100);
insert into screen values('S4','sf',75);
insert into screen values('S5','tf',150);

create table movie
(movie_id int ,
movie_name varchar2(20),
date_of_release date,
PRIMARY key(movie_id)
);

7 star wars III   18-FEB-05
6 star wars       28-FEB-05

insert into movie values(6,'star wars III','18-FEB-2005');

update MOVIE set date_of_release='18-FEB-2005' where movie_id=6;

insert into movie values(1,'Star War 3','1-aug-2005');
insert into movie values(2,'Spider Man','1-nov-2004');
insert into movie values(3,'money hiest','15-jan-2009');
insert into movie values(4,'Avengers 3','15-june-2015');
insert into movie values(5,'Dark Knighits','10-may-2012');


create table 
(screen_id varchar2(5) references screen(screen_id),
movie_id int references movie(movie_id),
date_of_arrival date ,
date_of_closure date
);

insert into currentmovie values('S1',1,'1-aug-2005','10-aug-2005');
insert into currentmovie values('S2',2,'1-nov-2004','10-nov-2004');
insert into currentmovie values('S3',1,'1-aug-2005','12-aug-2005');
insert into currentmovie values('S4',3,'15-jan-2009','25-jan-2009');
insert into currentmovie values('S5',4,'10-may-2012','18-may-2012');


--1.Get the name of movie which has run the longest in the multiplex so far
	select a.movie_name from movie a,currentmovie c 
	where (c.date_of_closure - c.date_of_arrival) =
	(select max(c.date_of_closure - c.date_of_arrival) from currentmovie) and a.movie_id=c.movie_id;


--2.Get the average duration of a movie on screen number ‘S4’.
	select screen_id, 
	avg(date_of_closure-date_of_arrival) avg_duration 
	from currentmovie 
	where screen_id='S3' group by screen_id;


--3.Get the details of movie that closed on date 24-november-2004.
	select m.movie_id,m.movie_name,m.date_of_release,c.date_of_closure 
	from movie m,currentmovie c 
	where m.movie_id=c.movie_id and c.date_of_closure='18-MAY-2012';


/*4.Movie ‘star wars III ‘was released in the 7th week of 2005. Find out the date of its
release considering that a movie releases only on Friday.*/
	select movie_id from
	MOVIE where
	trim(to_char(date_of_release,'DAY'))='FRIDAY' and
	to_char(DATE_OF_RELEASE,'YY') = 2005 and
	to_char(DATE_OF_RELEASE,'IW') = 7;

	select to_char(sysdate,'IW') from dual;

	select to_char (sysdate,'YY') from dual;

--5.Get the full outer join of the relations screen and current.
	select s.*, c.*
	from SCREEN s FULL OUTER JOIN currentmovie c on
	s.screen_id=c.screen_id;

	--Or 

	select * from screen s, currentmovie c where s.screen_id(+)=c.screen_id(+);
--
CREATE or REPLACE FUNCTION display_movie_days
RETURN NUMBER
IS
	TOT1 number(5);
BEGIN
	select (date_of_closure-date_of_arrival)INTO
	TOT1 from currentmovie
	where movie_id=(SELECT movie_id from movie where movie_name='Spider Man');
	RETURN(TOT1);
end;
/
--
create or replace PROCEDURE
	


