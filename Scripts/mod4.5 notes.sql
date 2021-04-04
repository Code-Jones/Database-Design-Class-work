-- mod 4.5 notes

group (mulit rows) functions
input will be set of rows 
output will be one value
it is called aggregate/multiple rows functions

select max(retail), min(retail), max(title)
from books; 

select item#, isbn, quantity, paideach, paideach * quantity "total", (paideach - cost) * quantity "Profit"
from orderitems natural join books
where order# = 1007
order by 1, 2;

select sum((paideach - cost) * quantity) "Sum"
from orderitems natural join books
where order# = 1007;


select title, category, retail
from books
order by category;

--- many group function results

select category, sum(retail) "Sum per Category"
from books
group by category;


--- average avg()

select avg(retail)
from books;

select category, sum(retail) "sum per category", avg(retail) "Average"
from books
group by category;

select avg(sum(retail)) "Average sum of retail cost"
from books
group by category;

select round(avg(sum(quantity * paideach)),2) "Average order total"
from orders join orderitems using (order#)
group by order#;

--- count for counting null values

select count(title)
from books
group by category;

--- what is the max profit per category

select category, max(retail-cost)
from books
group by category;

-- subquery
select title, category, (retail - cost)
from books
where retail-cost = (select - max(retail-cost)
					from books);


select category, count(*) "# of books", avg(retail-cost)
from books
group by category;


select name, category, avg(retail-cost) "Profit"
from books natural join publisher
group by name, category
order by name, category;

-- same as 

select name, category, (retail-cost) "Profit"
from books natural join publisher
order by name, category;

-- conditions to group

select category, avg(retail-cost) "Profit"
from books
group by category
having avg(retail-cost) >= 13
order by category;


select category, avg(retail-cost) "Profit"
from books
group by category
having avg(retail-cost) >= 13
and category like 'C%'
order by category;


select category, avg(retail - cost) "avg profit"
from books
where pubdate > '01-Jan-04'
group by category
having count(*) >= 2;

--- nested functions must have group by

select max(avg(retail-cost)) "avg"
from books
group by category;

--- group by sets

select name, category, count(*) "# of books"
from publisher join books using (pubid)
group by grouping sets (name, category,(name, category), ())
order by 1, 2;

select name, category, count(*) "# of books"
from publisher join books using (pubid)
group by cube (name, category)
order by 1, 2;

select name, category, count(*) "# of books"
from publisher join books using (pubid)
group by rollup (name, category)
order by 1, 2;
