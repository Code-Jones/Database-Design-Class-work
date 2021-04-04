spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\mod4lab2.sql"
set echo on
set linesize 132
set pagesize 66

REM Q1

select firstname || ' ' || lastname as customer, state
from customers
where state = 'CA'
order by lastname, firstname asc;

Q2
select title, category, retail-cost
from books
where ((retail - cost) < 15
order by category, title asc;

Q3
select title, category, discount
from books
where category = 'COMPUTER'
and discount > 3;


Q4
column region format a10

select firstname, lastname, region
from customers
where       	region != 'N'
and             region != 'NW'
and             region != 'NE'
order by lastname desc, firstname asc;


Q5
column region format a10
select firstname, lastname, region
from customers
where region not in ('N', 'NW', 'NE')
order by lastname desc, firstname asc;

spool off