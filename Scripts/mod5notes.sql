REM mod 5 notes


set echo off
set feedback off
set linesize 66
set pagesize 25
set underline off

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod5notes.txt"

accept price number prompt 'Enter a min number '

column isbn format 9999999999 heading 'ISBN|***********';
column "Title" format A30 heading 'Title|**********';
column cost format $99.99 heading 'Cost|**********';
column retail format $99.99 heading 'Retail|Price|**********';

select isbn, initcap(title) "Title", cost, retail
from books
order by title;

spool off

clear column

REM ---------------------------------------------------

set echo off
set feedback off
set linesize 66
set pagesize 25
set underline off

column isbn format 9999999999 heading 'ISBN|***********';
column "Title" format A30 heading 'Title|**********';

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod5notes.txt"

ttitle center 'Books in Inventory' skip 1 -
	left _date right 'Page: ' format 9 SQL.PNO

btitle left 'Generated by: ' format A10 SQL.USER skip 2 -
	center 'For internal use only'

select isbn, initcap(title) "Title"
from books
order by title;

spool off;


REM ---------------------------------------------------

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod5notes.txt"

TTITLE CENTER 'Customer Orders Report' SKIP 2
BTITLE OFF
BREAK ON customer# SKIP 1 ON report

COMPUTE SUM LABEL 'Cust Ttl' of ovalue on customer#
COMPUTE SUM LABEL 'Store Ttl' of ovalue on report

COLUMN ovalue FORMAT $9,990.00 HEADING 'Order|Value'

SPOOL customer.txt

SELECT customer#, order#, sum(paideach*quantity) ovalue
FROM customers JOIN orders USING (customer#)
  JOIN orderitems USING (order#)
GROUP BY customer#, order#
order by 1,2;

spool off





















