spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod4lab3.txt"
REM Q1
set echo on
set linesize 132
set pagesize 66

REM Q2 part A

select c.firstname, c.lastname, o.order#, oi.item#, b.title, p.gift
from customers c, orderitems oi, books b, orders o,  promotion p
where 	c.customer# = o.customer#
and 	o.order# = oi.order#
and 	b.isbn = oi.isbn
and b.retail between p.minretail and p.maxretail
order by lastname, firstname;

REM Q2 part B

select c.firstname, c.lastname, o.order#, oi.item#, b.title
from customers c 	join orders o on (c.customer# = o.customer#)
					join orderitems oi on (o.order# = oi.order#)
					join books b on (b.isbn = oi.isbn)
order by lastname, firstname;

REM Q3 part A

select unique c.firstname || ' ' || c.lastname as "Customer Name", a.fname || ' ' || a.lname as "Author Name"
from customers c, orders o, orderitems oi, books b, bookauthor ba, author a
where 	c.customer# = o.customer#
and 	o.order# = oi.order#
and 	b.isbn = oi.isbn
and 	ba.isbn = b.isbn
and 	a.authorid = ba.authorid
order by "Customer Name", "Author Name";

REM Q3 part B

select unique firstname || ' ' || lastname as "Customer Name", fname || ' ' || lname as "Author Name"
from customers  	natural join orders 
					natural join orderitems 
					natural join books  
					natural join bookauthor  
					natural join author  
order by "Customer Name", "Author Name";

REM Q3 part C

select unique c.firstname || ' ' || c.lastname as "Customer Name", a.fname || ' ' || a.lname as "Author Name"
from customers c 	join orders o using (customer#)
					join orderitems oi using (order#)
					join books b using (isbn)
					join bookauthor ba using (isbn)
					join author a using (authorid)
order by "Customer Name", "Author Name";

REM Q3 part D

select unique c.firstname || ' ' || c.lastname as "Customer Name", a.fname || ' ' || a.lname as "Author Name"
from customers c 	join orders o on (c.customer# = o.customer#)
					join orderitems oi on (o.order# = oi.order#)
					join books b on (oi.isbn = b.isbn)
					join bookauthor ba on (b.isbn = ba.isbn)
					join author a on (ba.authorid = a.authorid)
order by "Customer Name", "Author Name";

REM Q4 

select a.fname, a.lname, b.title
from author a 	left outer join bookauthor using (authorid)
				left outer join books b using (isbn)
order by lname;

spool off;