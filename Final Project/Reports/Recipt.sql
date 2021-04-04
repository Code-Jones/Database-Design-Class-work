set feedback  off
SET LINESIZE  70
SET PAGESIZE  70
SET ECHO     off
SET UNDERLINE on



ttitle center 'Total Customer Rentals' skip 3

BREAK ON "Customer Name" SKIP 1 on "Title" 

COMPUTE SUM LABEL "Cust Total" of "Rental Price" skip 1 on "Customer Name" 

Column "Customer Name" FORMAT A25;
Column "Title" FORMAT A30;
column "Rental Price" format $990.99;

spool "C:\cprg250\project\spool\Recipt.txt"; 

select initcap(fname || ' ' || lname) "Customer Name", initcap(show_title) "Rented Titles", rental_price "Rental Price"
from customer 	join rental using (customer_id)
				join title using (title_id)
group by show_title, fname, lname, rental_price
order by lname, fname;

select initcap(fname || ' ' || lname) "Customer Name", (-1*rental_price) "Refund"
from customer c join refund r on (c.customer_id = r.customer_id)
				join rental ren on (r.rental_id = ren.rental_id);
				
spool off;
ttitle off;
btitle off;
repheader off;
repfooter off;
clear columns;
clear compute;
clear break;