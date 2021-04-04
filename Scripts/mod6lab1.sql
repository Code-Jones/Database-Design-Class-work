spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod6lab1.txt"

set echo on
set linesize 132
set pagesize 66

REM Q1: 

insert into customers (customer#, lastname, firstname, email, address, city, state, zip, referred, region)
values (2000, 'Matt', 'Jones', 'MattJ@gmail.com', '101 calgary', 'calgary', 'AB', 't2ct2', 1000, 'N');

REM Q2: 

insert into orders (order#, customer#, orderdate, shipdate, shipstreet, shipcity, shipstate, shipcost)
values (2000, 2000, sysdate, (sysdate + 4), '101 calgary', 'calgary', 'AB', 3 );

REM Q3:

commit;

REM Q4:

update books
set discount = retail * 0.1
where category = (select category from books where isbn = '4981341710');

REM Q5:

delete from author
where authorid not in (	select authorid
						from bookauthor);
											
select * from author;

rollback;

select * from author;

spool off;