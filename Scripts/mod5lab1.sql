set echo on
set feedback off
set linesize 88
set pagesize 45
set underline on

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod5lab1.txt"

ttitle 	center 'Customer / Title Information' skip 1 -
		center 'Customer Order Evaluation' skip 2

btitle	skip 2 center 'For internal use only'

column "Book Title" format A30 heading 'Book|Title'
column "Last Name" format A10 heading 'Last|Name'
column "First Name" format A10 heading 'First|Name'
column cost format $999.99 heading 'Book|Cost'

Break on "Book Title" on report

select initcap(title) "Book Title", initcap(lastname) "Last Name", initcap(firstname) "First Name", cost "Book Cost"
from books 	join orderitems using (isbn)
			join orders using (order#)
			join customers using (customer#)
order by title, lastname;


clear columns;
clear break;


REM ------------------------------------------------------



ttitle 	center 'Author / Title Information' skip 1 -
		center 'Author Book Cost Evaluation' skip 2

btitle	skip 2 center 'For internal use only'

column "Publisher Name" format A30 heading 'Publsher|Name';
column "Book Title" format A30 heading 'Book|Title';
column "Book Cost" format $999.99 heading 'Book|Cost';
column pubid format 99 heading 'ID'

BREAK ON "Publisher Name" SKIP 1 ON "ID" on report skip 2

compute sum label "Total Cost" of "Book Cost" on "Publisher Name";
compute sum label "Grand Total Cost" of "Book Cost" on report;

select name "Publisher Name", pubid, initcap(title) "Book Title", cost "Book Cost"
from books join publisher using (pubid)
order by "Publisher Name", "Book Title";

spool off;
clear columns;
clear breaks;

