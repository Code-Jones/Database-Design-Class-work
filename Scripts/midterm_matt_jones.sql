REM midterm

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

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\midtermtext2.txt"
set echo on
REM Q1: // done

select program_of_studies "Program", count(*) "Number of students"
from student
group by program_of_studies
having count(*) = (	select max(count(student_id))
					from student
					group by program_of_studies);
					
rem total number of students per program // back up answer
rem select program_of_studies "Program", count(student_id) "Number of students"
rem from student
rem group by program_of_studies;

REM Q2: // done

column "Course code, Course title" format A51
select 	course_code || ' ' || course_title "Course code, Course title", hours, credits
from 	course
where 	prerequisite is not null;

REM Q3: // change format

column "Birthdate" format a15
select firstname, surname, substr(birthdate,1,2) || '/MAR/' || substr(birthdate,8,9) "Birthdate"
from faculty
where birthdate like '%MAR%';


REM Q4: // to easy check after // not right, didnt account for all courses

select count(grade) "Total number of students with grade above 85"
from course_registration
where grade >= 85;


REM Q5: // done

select firstname, surname, count(*) "# of Courses"
from 	student s, course_registration cr, class_section cs, course c
where 	s.student_id = cr.student_id
and 	cr.year = cs.year
and 	cr.semester = cs.semester
and 	cr.section = cs.section_code
and 	cr.course_code = cs.course_code
and 	cs.course_code = c.course_code
group by firstname, surname
having count(*) >= 4;

REM Q6: // done

select firstname, surname, unit, salary
from faculty
where (unit, salary) in (select unit, max(salary)
				from faculty
				where unit is not null
				group by unit)
order by salary;

REM Q7: // done

column salary format $99,999
select firstname, surname, unit, salary
from faculty
where salary > (select avg(salary)
						from faculty)
order by salary desc;

spool off




