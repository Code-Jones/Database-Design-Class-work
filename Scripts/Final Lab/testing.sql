REM Testing

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
set linesize 99
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
ttitle off
btitle off
repheader off
repfooter off
clear columns
clear compute
clear break
) */

/*( CPV auto-complete
cp_category, category_code, category_description, cp_title, title_code, film_title, category_code, actors, runtime, star_rating,
cp_price, rental_class, rate_per_day, cp_dvd, dvd_number, title_code, store_number, rental_class, cp_customer, customer_no, name, 
address_1, address_2, area_code, phone_number, credit_card, expiry_date, card_number, cp_rental, customer_no, dvd_number, date_out, 
date_due, actual_date_returned, cp_overdue_log, cp_returns
)*/

/* (practice 
select name, title_code, film_title
from cp_customer 	join cp_rental using (customer_no)
					join cp_dvd using (dvd_number)
					join cp_title using (title_code)
where actual_date_returned is null;

)*/

insert into cp_title values 
('ground day', 'Groundhog Day', 8, 'Bill Murray, Andie Macdowell', 102, '****'); 

insert into cp_dvd values 
(1001, 'ground day', 1, 'A');

select film_title, dvd_number, rental_class
from cp_title join cp_dvd using (title_code)
where film_title like '%Groundhog%';


/*

DELETE FROM cp_title WHERE film_title like '%Groundhog%';

delete from cp_dvd where dvd_number = 1001;

UPDATE cp_price
SET rate_per_day = 2.99
where rental_class = 'A';

UPDATE cp_price
SET rate_per_day = 1.99
where rental_class = 'B';

UPDATE cp_price
SET rate_per_day = 0.99
where rental_class = 'C';

*/
