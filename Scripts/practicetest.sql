REM practice test

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\practicetest.txt";


REM Q1: 

select student_id, course_code
from course_registration 
where grade >= 85;

REM Q2:

select 	firstname || ' ' || surname "Name", birthdate, program_of_studies
from 	student
where 	program_of_studies = 'Business Administration'
and 	to_number(to_char(sysdate, 'yyyy')-to_char(birthdate, 'yyyy')) >= 25;


REM Q3:

select firstname, surname, count(course_code)
from student natural join course_registration
group by firstname, surname
order by firstname;

REM Q4:

select 	firstname, surname, birthdate, program_of_studies
from 	student s, course_registration cr, class_section cs, course c
where 	s.student_id = cr.student_id
and 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cr.section = cs.section_code
and 	cr.course_code = cs.course_code
and 	cs.course_code = c.course_code
and 	program_of_studies = 'Computer Technology'
and 	prerequisite is null;

REM Q5: 

select firstname, surname
from student
where student_id not in (select student_id
						from course_registration);

REM Q6:



Rem Q7:

select f.firstname "Faculty", s.firstname "Student", count(*) "# of Courses"
from student s, course_registration cr, class_section cs, faculty f
where 	s.student_id = cr.student_id
and 	cr.course_code = cs.course_code
and 	cr.section = cs.section_code
and 	cr.semester = cs.semester
and 	cr.year = cs.year
and 	cs.instructor_id = f.employee_id
group by grouping sets (f.firstname, s.firstname, ())
order by 1,2;



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