REM REPORT: // fix grand total

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\midtermtextreport.txt"

set linesize 100
set pagesize 50
ttitle center 'Faculty - Expertise Report' skip 2 center

break on expertise_level on surname on report
compute count label "Expertise Total" of surname on expertise_level 
compute count label "Grand Total" of surname on report;

select unique expertise_level, employee_id, firstname, surname
from expertise natural join faculty
where expertise_level >= 7
order by expertise_level, employee_id;

clear columns
clear compute
clear break

spool off




