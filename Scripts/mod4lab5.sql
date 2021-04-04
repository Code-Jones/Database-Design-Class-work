spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod4lab5.txt"
set echo on
REM Q1:
set linesize 132
set pagesize 66

REM Q2: // done

select firstname "First", lastname "Last", oi.order#, sum(paideach * quantity) "Order Ttl"
from customers c, orders o, orderitems oi
where 	c.customer# = o.customer#
and 	o.order# = oi.order#
group by oi.order#, firstname, lastname
order by 2,1;

REM Q3: // done

column "Avg Published Books/Author" format A26;
select to_char(avg(count(isbn)),9.99) "Avg Published Books/Author"
from bookauthor
group by authorid
order by 1;
clear columns;

REM Q4: // done

column "Average" format $99.99;
select category, count(title) "Num of Books", avg(retail) "Average"
from books
group by category
having count(title) >= 2
order by category;

REM Q5: // done 

select 	fname, lname, sum(quantity) "# of Books"
from author natural join bookauthor
            natural join books
			natural join orderitems
group by fname, lname
having sum(quantity)>=10
order by 2,1;


REM Q6: // done

select 	firstname, lastname, oi.order#, sum(paideach*quantity) "Value"
from 	orderitems oi, orders o, customers c
where 	oi.order# = o.order#
and 	o.customer# = c.customer#
group by rollup ((firstname, lastname), oi.order#)
order by 2, 1, 3;


spool off