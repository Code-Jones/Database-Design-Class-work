spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod4lab1.txt"
set echo on
set linesize 132
set pagesize 80

REM Q2
select title as "Book Title" 
from books;

select lastname || ', ' || firstname || ', ' ||  address || ', ' ||  
       city     || ', ' || zip as "Customer_Information" state 
from customers;


select title, retail, round((retail - cost)/ cost*100) || '%' AS "profit" 
from books;

column authorid format a15
select unique authorid  AS "unique authors" 
from bookauthor;

select unique (authorid) || ' ' || fname || ' ' || lname AS "unique authors" 
from bookauthor natural join author;


spool off