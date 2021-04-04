
set echo
set linesize 132
set pagesize 66

Caetesian Join = CROSS Join
books --> 14 rows
publisher --> 5 rows
5*4 = 70 ROWS

-- Omitting the join conditions
select title, name
from books, publisher;
	
-- Using cross join keyword
select title, name
from books cross join publisher;

--Equality join (where + condition or join keywords)
SELECT title, pubid
from books;

select pubid, name
from publisher
where pubid = 4;

-- implement equality join = inner join using where
select title, name
from books, publisher
where books.pubid = publisher.pubid;

-- Whit Aliases
select title, b.pubid, name
from books b, publisher p
where b.pubid = p.pubid;

-- using join keywords

select title, pubid, name, retail
from books natural join publisher using (pubid)
where retail > 50;

select title, pubid, name, retail
from books join publisher using (pubid)
where retail > 50;

-- do have to use quailifier
select title, pubid, name, retail
from books b join publisher p on (b.pubid = p.pubid)
where retail > 50;

-- list all customers and books they ordered
select firstname, title
from customers c, orders o, orderitems oi, books b
where c.customer# = o.customer#
and o.order# = oi.order#
and oi.isbn = b.isbn;
-- same diferent method
select firstname, title
from customers natural join orders
				natural join orderitems
				natural join books;
				
select firstname, title
from customers natural join orders 
				natural join orderitems 
				natural join books;
				
select firstname, title
from customers 	join orders using (customer#)
				join orderitems using (order#)
				join books using (isbn);
				
select firstname, title
from customers c join orders o on (c.customer# = o.customer#)
				join orderitems io on (o.order# = io.order#)
				join books b on (io.isbn = b.isbn);
				
-- non equality join

select title, retail, minretail, maxretail, gift
from books, promotion
where retail between minretail and maxretail;


select title, retail, minretail, maxretail, gift
from books join promotion on (retail between minretail and maxretail);


-- 

select title, fname "Author", name " Publisher"
from publisher p, books b, author a 
where p.pubid = b.pubid;

select title, fname "Author", name " Publisher"
from publisher p, books b, bookauthor ba, author a 
where p.pubid = b.pubid
and b.isbn = ba.isbn
and ba.authorid = a.authorid;

select title, fname "Author", name " Publisher"
from 	publisher p, books b, bookauthor ba, author a, 
		customers c, orders o, orderitems oi 
where p.pubid = b.pubid
and b.isbn = ba.isbn
and ba.authorid = a.authorid
and c.customer# = o.customer#
and c.customer# = oi.order#
and oi.isbn = b.isbn;

-- display all publishers and their books orders.
-- include the publisher name, title and order #. order by name, title and order#.

select name, title, order#
from publisher 	join books using(pubid)
				join orderitems using(isbn)
				join orders using(order#);
				

select p.name, b.title, o.order#
from publisher p join books b on (p.pubid = b.pubid)
				join orderitems oi on (b.isbn = oi.isbn)
				join orders o on (o.order# = oi.order#);
		
--		
select customer#
from customers
where customer# between 1000 and 1005;

select customer#
from customers
where customer# between 1000 and 1005
union -- union all
select customer#
from customers
where customer# between 1000 and 1008;

select customer#
from customers
where customer# between 1000 and 1005
intersect -- minus -- 
select customer#
from customers
where customer# between 1000 and 1008;

select customer#
from customers
minus
select customer#
from orders;


select 'Author: ' || fname || ' ' || lname
from author
union
select 'Publisher: ' || contact
from publisher;

				

