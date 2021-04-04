subquery --- a query in a query

list all books whose cost is great 
than the cost of the books whose isbn = 0132149871

select cost
from books
where cost > (	select cost 
				from books 
				where isbn = 0132149871);
				
				
select title, cost, retail
from books
where cost = (	select min(cost)
				from books);
				
				
select category, avg(retail-cost) "Average Profit"
from books
group by category
having avg(retail-cost) > (	select avg(retail-cost)
							from books
							where category = 'LITERATURE');
							
find all computer books whose cost is more than
the cost of the 'DATABASE IMPLEMENTATIONS' books. 
Include category, title, and cost.

select cost, category, title
from books
where cost > (	select cost
				from books
				where title = 'DATABASE IMPLEMENTATION');
				
find all books whose retail price is more than
the retail price of the book 'DATABASE IMPLEMENTATION'.
include title, retail price, sort by title

select title, retail
from books
where retail > (select retail
				from books
				where title = 'DATABASE IMPLEMENTATION');
				
				
lowest cost of books

select title, cost, retail
from books
where cost = (	select min(cost)
				from books);


Find all books whose retail price is more than 
the average price of books in
the same category. Sort by category and title.

select category, avg(retail-cost) "Average Profit"
from books
group by category
having avg(retail-cost) > (	select avg(retail-cost)
							from books
							where category = 'LITERATURE');


select title, retail, (select to_char(avg(retail), 999.99)
						from books) "Overall Average"
from books;


select avg(retail), category, (select avg(avg(retail))
								from books
								group by category)
								"average per category",
								avg(retail) - (select avg(avg(retail))
								from books
								group by category)
								"Above/Below"
from books
group by category;


multiple row subqueries
in, any, all, exists

select (retail-cost) "Profit", (select avg(retail-cost)
								from books) "Average"
from books
where retail-cost > any (select avg(retail-cost)
						from books);
						
select title, retail, category
from books
where retail in (select max(retail)
				from books
				group by category);
				
select title, retail, category
from books
where (category, retail) in (select category, max(retail)
							from books
							group by category);


select title, retail, category
from books
where retail < any (select min(retail)
					from books
					where category = 'COOKING');


Find all orders whose value is greater than the value of 
orders placed by customers in Florida. Show the order# and 
value of the order. Sort by order#.


select order#, sum(paideach*quantity) "Order Value"
from orderitems
group by order#
having sum(paideach*quantity) > all (select sum(paideach*quantity)
									from customers natural join orders natural join orderitems
									where state = 'FL'
									group by order#)
order by 1,2;


find all books whose retail price is more than
the average price of books in the same category.
 sort by category and title
 
select category, avg(retail)
from books
group by category;

select title, retail, b.category
from books b, (select category, avg(retail) catavg
				from books
				group by category) sub
where b.category = sub.category
and retail > catavg;


Find all people who were referred by the same person 
who referred customer # 1005


