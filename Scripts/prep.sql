REM practice

/* table names + column names
course, course_code, course_title, hours, credits, prerequisite
expertise, expertise_level
faculty, employee_id, firstname, surname, birthdate, seniority_date, salary, unit
class_section, section_code, semester, year, instructor_id, capacity, enrolment
course_registration, student_id, section, grade
student, gender, program_of_studies */

/*(single-row functions
lower(), upper(), initcap(), concat(), substr(), length(), instr(), lpad(), rpad() 
trim(), replace(), translate(), abs(), round(), trunc(), mod(), sysdate, months_between(), add_months(),
next_day(), last_day(), to_date(), current_date(), nvl(), nvl2(), nullif(), coalesce(), decode()
to_number(), )*/

/*(multi-row functions + grouping sets
sum(), max(), min(), avg(), count(), greatest(), least(), stddev(), variance(),  )

(grouping sets
group by grouping sets (c1, c2, (c1, c2), ())
group by cube (c1, c2)
group by rollup (c1, c2)

// deal with duplicates:
select name, to_char(orderdate, 'MM-YYYY') Mth, category, count(*), group_id()
from publisher join books using (pubid) join orderitems using (isbn)
  join orders using (order#)
group by rollup (name, (to_char(orderdate, 'MM-YYYY'), category))
HAVING group_id() = 0
order by name, 2,3;
) 

(case colname
	when value1 then return1
	else returnDefault
end "alias") */

/*(Reporting
set linesize 100
set pagesize 50
set newpage 1

ttile "titles" skip 1 center
btitle left sysdate -
right 'page: ' format 99 sql.pno skip 1 -
center ''
column colname heading "words" format A20
column number heading"numbers|more numbers" format $990.99
repheader 'report title' skip 2
repfooter 'last page of report' skip 3

// only one break at a time
break on colname skip 2 on report 
break on "colname" skip 1 on report on row skip 1

compute sum label "this is it" of numbers on "othertitle"
compute count label "what it's called" of "colname" on report
//
COMPUTE {group function} OF {column_name | column_alias,. . .} 
						ON {break_column_name | ROW | PAGE | REPORT};
ttile off
btitle off
repheader off
repfooter off
clear columns
clear compute
clear break
) */

/* add subsets templates 
select 	firstname, surname, employee_id
from 	faculty f, class_section cs
where 	f.employee_id = cs.instructor_id
and 	employee_id in (select count(instructor_id)
						from 	class_section
						where 	enrolment = 0
						group by instructor_id);

*/

REM Course to Course 
(select c1.course_code, c2.hours 
from course c1, course c2 
where c1.prerequisite = c2.course_code;)

REM Student to Expertise / join using (course_code)
(select unique firstname, student_id
from student s	join course_registration cr using (student_id)
				join class_section cs using (cr.course_code = cs.course_code and
											cr.section = cs.section_code and
											cr.semester = cs.semester and 
											cr.year = cs.year)
				join course c using (course_code)
				join expertise e using (course_code);)

REM Student to Course / join on
(select s.firstname, s.student_id, c.course_code
from student s	join course_registration cr on (s.student_id = cr.student_id)
				join class_section cs on (cr.course_code = cs.course_code and
											cr.section = cs.section_code and
											cr.semester = cs.semester and 
											cr.year = cs.year)
				join course c on (cs.course_code = c.course_code);)

REM Student to Course / traditional full
(select 	firstname, surname, birthdate, program_of_studies
from 	student s, course_registration cr, class_section cs, course c
where 	s.student_id = cr.student_id
and 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cr.section = cs.section_code
and 	cr.course_code = cs.course_code
and 	cs.course_code = c.course_code;)

REM Student to Faculty / traditional
(select s.student_id, f.employee_id
from student s, course_registration cr, class_section cs, faculty f
where 	s.student_id = cr.student_id
and 	cr.course_code = cs.course_code
and 	cr.semester = cs.semester
and 	cr.year = cs.year
and 	cr.section = cs.section_code
and 	cs.instructor_id = f.employee_id);

REM Course to Faculty / traditional + join using
(select firstname, course_code, course_title
from course 	join expertise using (course_code)
				join faculty using (employee_id);

select f.firstname, c.course_code, c.course_title
from course c, expertise e, faculty f
where 	c.course_code = e.course_code
and 	e.employee_id = f.employee_id;)

REM Course_Reg to Class_Sec / traditional full
(select cr.year, cs.year, cr.semester, cs.semester
from course_registration cr, class_section cs
where 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cr.section = cs.section_code
and 	cr.course_code = cs.course_code;)

REM Course_Reg to Class_Sec / traditional full show keys
(select  cr.course_code, cs.course_code, cr.year, cs.year, cr.semester, cs.semester, cr.section, cs.section_code
from 	course_registration cr, class_section cs
where 	cr.course_code = cs.course_code
and 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cr.section = cs.section_code;)

REM Student to Course / students of 'Calculus I'
(select 	s.firstname, c.course_title
from 	student s, course_registration cr, class_section cs, course c
where 	s.student_id = cr.student_id
and 	cr.course_code = cs.course_code
and 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cs.course_code = c.course_code
and 	cr.section = cs.section_code
and 	course_title = 'Calculus I';)

REM Student to Course / no prerequisite
(select  unique firstname, surname
from 	student s, course_registration cr, class_section cs, course c
where 	s.student_id = cr.student_id
and 	cr.course_code = cs.course_code
and 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cr.section = cs.section_code
and 	cs.course_code = c.course_code
and 	prerequisite is null;
)
