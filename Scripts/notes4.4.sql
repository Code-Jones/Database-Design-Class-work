--notes 4.4

--single line functions

REM Q: for each book order (title and order#)

select order#, title, pubdate,
		round(months_between(orderdate, pubdate)/12) "Years"
from books natural join orderitems natural join orders;

select to_date('March 17, 2020', 'month dd, yyyy')
from dual;

select order#, shipdate
from orders
where shipdate > to_date('April 4, 2009', 'month dd, yyyy');

select pubdate, to_char(pubdate, 'month dd, yyyy'), to_char(retail, '$%.99') "Retail Price"
from books;


