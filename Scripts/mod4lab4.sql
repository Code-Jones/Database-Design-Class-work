--mod 4.4
spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod4lab4.txt"
REM Q1
set echo on
set linesize 132
set pagesize 66

REM Q2

column "Pub Date" format A20 
select initcap(lname) "Surname", initcap(title) "Book Title", (to_char(pubdate,'fmMonth dd, yyyy')) "Pub Date", nvl(retail - discount, retail) "Final Price"
from author, bookauthor, books
where 	author.authorid = bookauthor.authorid 
and 	bookauthor.isbn = books.isbn 
order by "Book Title";
clear columns

REM Q3
column "Review Date" format A20 
column "Date Published" format A20 
select unique initcap(title) "Book Title", pubdate "Date Published", add_months(pubdate, 6) "Review Date"
from books
order by "Book Title";
clear columns


REM Q4

select unique initcap(title) "Book Title", retail - nvl(discount, 0) "Price", cost "Cost", to_char(((retail - nvl(discount, 0)-cost)/cost)*100, '999.00') "% Profit"
from 	books
order by "% Profit" desc;


select unique initcap(title) "Book Title", retail - nvl(discount, 0) "Price", cost "Cost", to_char((((retail - nvl(discount, 0))-cost)/cost)*100, '999.00') "% Profit"
from 	books
order by "% Profit" desc;


REM Q5
column "Pricing Structure" format A35
select unique initcap(title) "Book Title", to_char(((retail - cost)/cost * 100), '999.00') "Margin", to_char(discount, '9.00') "Discount", 
case 
		when discount is not null then 'Discounted, will NOT be restocked'
		when ((retail - cost)/cost * 100) >= 60 then 'Very high profit'
		when ((retail - cost)/cost * 100) >= 30 then 'High profit'
		when ((retail - cost)/cost * 100) >= 0 then 'Loss leader'
	end "Pricing Structure"
from 	books
order by "Book Title";

spool off