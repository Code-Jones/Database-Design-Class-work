clear columns
clear breaks
clear computes


(--Traditional Join (Students - Expertise)
select s.student_id, cr.grade, cs.enrolment, f.unit, e.expertise_level, c.credits
from student s, course_registration cr, class_section cs, faculty f, expertise e, course c
where s.student_id = cr.student_id
and   cr.course_code = cs.course_code
and   cr.section = cs.section_code
and   cr.semester = cs.semester
and   cr.year = cs.year
and   cs.course_code = c.course_code
and   c.course_code = e.course_code
and   e.employee_id = f.employee_id;)

(--Traditional Join (Expertise - Students)
select s.student_id, cr.grade, cs.enrolment, f.unit, e.expertise_level, c.credits
from student s, course_registration cr, class_section cs, faculty f, expertise e, course c
where e.employee_id = f.employee_id
and   c.course_code = e.course_code
and   cs.course_code = c.course_code
and   cr.year = cs.year
and   cr.semester = cs.semester
and   cr.section = cs.section_code
and   cr.course_code = cs.course_code
and   s.student_id = cr.student_id;)

(-- Join on (Students - Expertise)
select s.student_id, cr.grade, cs.enrolment, f.unit, e.expertise_level, c.credits
from student s join course_registration cr on (s.student_id = cr.student_id)
			   join class_section cs	   on (cr.course_code = cs.course_code
			                               and cr.section = cs.section_code
										   and cr.semester = cs.semester
										   and cr.year = cs.year)
			   join course c			   on (cs.course_code = c.course_code)
			   join expertise e			   on (c.course_code = e.course_code)
			   join faculty f			   on (f.employee_id = e.employee_id);)

(-- Join on (Expertise - Students)
select s.student_id, cr.grade, cs.enrolment, f.unit, e.expertise_level, c.credits
from faculty f join expertise e  on (f.employee_id = e.employee_id)
			   join course c     on  (c.course_code = e.course_code)
			   join class_section cs on (cs.course_code = c.course_code)
			   join course_registration cr on (cr.course_code = cs.course_code
			                               and cr.section = cs.section_code
										   and cr.semester = cs.semester
										   and cr.year = cs.year)
				join student s on (s.student_id = cr.student_id);)

(--Natural join (Students - Expertise) (NOT WORKING)
select student_id, grade, enrolment, unit, expertise_level, credits
from student natural join course_registration 
			 natural join class_section 
			 natural join faculty
			 natural join expertise
			 natural join course;)

(--Natural join (Expertise - Students) (NOT WORKING)
select student_id, grade, enrolment, unit, expertise_level, credits
from course natural join expertise 
			 natural join faculty
			 natural join class_section 
			 natural join course_registration 
			 natural join student;)

(--Join using (Students - Expertise) (Wrong section of cs and cr)
select student_id, grade, enrolment, unit, expertise_level, credits
from student  join course_registration using (student_id)
			  join class_section       using (course_code, semester, year)
			  join course			   using  (course_code)
			  join expertise  		   using  (course_code)
			  join faculty  		   using  (employee_id);)



--Practice Quiz (mine then hamdy)
(- REM Q1 (Show students whose grade is at least 85) 
Select student_id "ID", course_code "Course ID", grade
from student natural join course_registration
where grade >= 85
order by "ID", "Course ID";)

(- REM Q2 (List all business students who are at least 25 years old today)
Column "Full Name" FORMAT A20
Select  firstname || ' ' || surname "Full Name", birthdate, program_of_studies "Program of Studies"
from student
where (round(months_between(SYSDATE, birthdate)/12))>=25
and program_of_studies = 'Business Administration'
order by birthdate;

Select  firstname || ' ' || surname "Full Name", birthdate, program_of_studies "Program of Studies"
from student
where lower(program_of_studies) like '%business%'
and to_number(to_char(sysdate,'yyyy')-to_char(birthdate,'yyyy')) >= 25
order by birthdate;)

(- REM Q3 ( Show students and number of courses in which they are registered)
Column firstname FORMAT A10
Column surname FORMAT A10
Select firstname, surname, count(cr.student_id) "Number of courses"
from student s join course_registration cr on (s.student_id = cr.student_id)
group by s.student_id, (firstname, surname)
order by firstname;

Select firstname, surname, count(cr.course_code) "Number of courses"
from student s join course_registration cr on (s.student_id = cr.student_id)
group by s.student_id, (firstname, surname)
order by firstname;)

(- REM Q4 (List all computer tech students who completed courses without prerequisites join on)
select s.firstname, s.surname, s.birthdate, cr.course_code, cr.semester, c.course_title, c.credits
from student s join course_registration cr on (s.student_id = cr.student_id)
			   join class_section cs	   on  (cr.course_code = cs.course_code
												and cs.section_code = cr.section
												and cs.semester = cr.semester 
												and cs.year = cr.year)
			   join course c    		   on   (c.course_code = cs.course_code)
where c.prerequisite IS null
and s.program_of_studies = 'Computer Technology';)

(- REM Q5 (Display all students who are not registered in any course)
Select Student_id "ID"
from student
minus
select student_id
from course_registration
group by student_id;

select student_id, firstname, surname
from student
where student_id not in (
select student_id
from course_registration);)

(- REM Q6 (Show the courses in which number of registered students is more than the average of course reg)
select course_title, count(*)
from course natural join course_registration group by course_title having count(*) >
    (select avg(count(*))
     from course_registration
     group by course_code
    )
order by course_title;)

(- REM Q7 (Produce a report of number if courses per fac member, student and total)
Select f.firstname "Faculty", s.firstname "Student", Count(*)
from student s, course_registration cr, class_section cs, faculty f
where s.student_id = cr.student_id
and cr.course_code = cs.course_code
and cr.section = cs.section_code
and cr.semester = cs.semester
and cr.year = cs.year
and cs.instructor_id = f.employee_id
group by grouping sets (f.firstname, s.firstname,())
order by "Faculty", "Student";)

(- REM Q8 (Generate a report of all faculty members and their courses, just expertise level >8)
SET LINESIZE  100
SET PAGESIZE   30
SET NEWPAGE 	1
SET ECHO      off
SET UNDERLINE off

ttitle center 'Faculty Member Report' skip 2

column eid format 999999999999 heading 'Employee ID#|**********'
column cc heading 'Code|**********'
column ct heading 'Course Title|*************'
column el heading 'Expertise Level|***************'
column s format $9999999.00 heading 'Salary|*************'
column eid format A12
column ct format A24

BREAK ON eid SKIP 1 ON report

COMPUTE SUM LABEL 'Total Salary' of s on eid
COMPUTE SUM LABEL 'Grand Total Salary' of s on report

Select employee_id eid, course_code cc, course_title ct, expertise_level el, salary s
from faculty natural join expertise 
			 natural join course
where expertise_level>8
order by cc desc;

clear columns
clear breaks
clear computes
)