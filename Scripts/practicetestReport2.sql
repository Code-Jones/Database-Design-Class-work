rem report one
clear breaks 
clear columns
clear compute

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\practicetestreport2.txt"

set echo on
set feedback off
set linesize 100
set pagesize 66
set underline off

ttitle 	center 'Faculty Memeber Report' skip 1 

column employee_id format A20 heading 'Employee ID #|***********'
column course_code format A10 heading 'Code|***********'
column course_title format A25 heading 'Course title|***********'
column salary format $99999999.99 heading 'Salary|***********'

Break on employee_id skip 1 on report 

compute sum label "Total Salary" of salary on employee_id skip 2;
compute sum label "Grand Total Salary" of salary on report;

select employee_id, course_code, course_title , expertise_level "Expertise level", salary
from faculty 	join expertise using (employee_id)
				join course using (course_code)
where expertise_level > 8
order by expertise_level desc;

clear columns 
clear compute
clear breaks