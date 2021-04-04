spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod4lab6.txt"
set echo on
REM Q0:
set linesize 132
set pagesize 66

REM Q1: 

select 	firstname, lastname
from 	customers
where 	state = (select state
				from customers 
				where lastname = 'SMITH'
				and firstname = 'LEILA')
and 	firstname != 'LEILA';


REM Q2: 
/* your img showed no firstname 
but you asked for firstname in the question 
so i did both just incase */

select unique lastname, title, retail, (select avg(retail)
										from books) "Avg"
from books 	natural join orderitems
			natural join orders
			natural join customers
where 	retail > (	select avg(retail)
					from books)
order by lastname, title;

select unique lastname, firstname, title, retail, (select avg(retail)
										from books) "Avg"
from books 	natural join orderitems
			natural join orders
			natural join customers
where 	retail > (	select avg(retail)
					from books)
order by lastname, title;

REM Q4A:

select initcap(fname || ' ' || lname) "Author", initcap(title) "Last Book", pubdate "Date Pub"
from author join bookauthor using (authorid)
			join books using (isbn)
where (authorid, pubdate) in 	(select authorid, max(pubdate)
								from author join bookauthor using (authorid)
											join books using (isbn)
								group by authorid)			
order by lname, fname, title;


REM Q4B:

select initcap(fname || ' ' || lname) "Author", initcap(title) "Last Book", pubdate "Date Pub"
from author a, bookauthor ba, books b
where 	b.isbn = ba.isbn 
and 	ba.authorid = a.authorid 
and 	pubdate = (	select max(pubdate)
					from 	author a_i, bookauthor ba_i, books b_i
					where 	b_i.isbn = ba_i.isbn 
					and 	ba_i.authorid = a_i.authorid
					and 	a_i.authorid = a.authorid)		
order by lname, fname, title;

REM Q5:

select firstname, lastname, num
from (	select firstname, lastname, count(*) num
		from customers join orders using (customer#)
		group by firstname, lastname
		order by 3 desc, lastname, firstname)
offset 10 rows
fetch next 10 rows only;
spool off