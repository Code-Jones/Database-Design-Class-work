List all books whose cost is greater than the cost of the book whose ISBN = 0132149871
unknown value? cost of the book whose ISBN = 0132149871 -- 17.85
select cost
from books
where ISBN = 0132149871;


select title, cost, category
from books
where cost > (select cost
              from books
              where ISBN = 0132149871);
Find all computer books whose cost is more than 
the cost  of the ‘DATABASE IMPLEMENTATION’ book. Include category, title, and cost
unknown value? cost  of the ‘DATABASE IMPLEMENTATION’ book
-- Subquery to find the unknown value
select cost 
from books
where title = 'DATABASE IMPLEMENTATION'

-- Main query			  
select title, cost, category
from books
where category = 'COMPUTER'
and cost > (select cost 
            from books
            where title = 'DATABASE IMPLEMENTATION');

Find all books whose retail price is more than 
the retail price of the book ‘DATABASE IMPLEMENTATION’. 
Include the title and retail price on the report. Sort by title?
select title, retail, category
from books
where  retail > (select retail 
            from books
            where title = 'DATABASE IMPLEMENTATION');
List all books whose cost is the lowest. Include title, cost and retail
unknown value? the lowest cost
select min(cost)
from books			-- 5.32

select title, cost
from books
where cost = (select min(cost)
              from books);

Show all categories whose average profit is greater than 
the average profit of the ‘LITERATURE’ category.
 unknown value? AVG (‘LITERATURE’)
 select avg(retail-cost-nvl(discount,0))
 from books
 where category = 'LITERATURE'
 
 select category, avg(retail-cost-nvl(discount,0))
 from books
 group by category
 having avg(retail-cost-nvl(discount,0))> 
             (select avg(retail-cost-nvl(discount,0)) avgerage
              from books
              where category = 'LITERATURE');
Show each category, the price of the most expensive books in that category 
and the price of the most expensive book in the bookstore?
unknown value? price of the most expensive book
select max(retail)
from books;

select category, max(retail), 
      (select max(retail)
       from books
       ) "Most expensive book"
from books
group by category

For each category show 
The average price of books in the category, 
The average price of all categories, and 
How much the average price of this category is above or below the average of all the categories.

select category, avg(retail),
        (select avg(avg(retail))
         from books
         group by category) "AVG of ALL",
		 avg(retail) - (select avg(avg(retail))
                        from books
                        group by category) "Above/Below"
from books
group by category

Show the most expensive book in each category.
The inner query (a set of category and max retail)???

select max(retail)
from books
group by category;


select title, retail, category
from books
where retail > any (select max(retail)
                    from books
                     group by category)

select title, retail, category
from books
where (category,retail) in (select category, max(retail)
                            from books
                            group by category)
Find all books whose retail price is less than 
any cooking book in the bookstore. 
Include the title, retail price and category. Sort by title.
select retail
from books
where category = 'COOKING';
							
select title, retail, category
from books
where retail <any (select retail
                   from books
                   where category = 'COOKING');
Find all orders whose value is greater than 
the value of orders placed by customers in Florida. 
Show the order# and value of the order. Sort by order#.
unknown value? value of orders placed by customers in Florida
select customer#, order#, state, item#, paideach, quantity
from customers natural join orders
               natural join orderitems
where state = 'FL'
order by customer#, order#;

select sum(paideach*quantity)
from customers natural join orders
               natural join orderitems
where state = 'FL'
group by customer#, order#

select order#, sum(paideach*quantity)
from orderitems
group by order#
having sum(paideach*quantity) > all (select sum(paideach*quantity)
                                from customers natural join orders
                                               natural join orderitems
                                where state = 'FL'
                                group by customer#, order#);
								
select max((select sum(paideach*quantity)
                                from customers natural join orders
                                               natural join orderitems
                                where state = 'FL'
                                group by customer#, order#))
from dual;								

Find all books whose retail price is more than 
the average price of books in the same category. Sort by category and title.
select title, retail, category
from books
where (category, retail) in 
                       (select category, avg(retail)
                        from books
                         group by category);

select title, retail, T.category
from books b, (select category, avg(retail) catavg
                        from books
                         group by category) T
where retail > catavg
and b.category = T.category;

Find all people who were referred by 
the same person who referred customer # 1005 (unknown??)yes
select referred
from customers
where customer# = 1005;

select customer#
from customers
where nvl(referred,0) = (select nvl(referred,0)
                  from customers
                  where customer# = 1005)
and customer# != 1005;

Q: Allow the user to enter a customer # and 
then find all people who were referred by the same person who referred this customer. 

accept custNo number prompt "Enter Customer#: "
select customer#
from customers
where nvl(referred,0) = (select nvl(referred,0)
                  from customers
                  where customer# = &custNo)
and customer# != &custNo;

-- Correlated subquery: 
-- (1) it references one column from the outer query
   (2)the subquery will run for each row returned by the main query
-- uncorrelated
select title, retail, category
from books
where (category, retail) in 
                       (select category, avg(retail)
                        from books
                         group by category);
-- Correlated version
select title, retail, category
from books b
where retail = 
                       (select avg(retail)
                        from books bs
                        where   b.category = bs.category);
Show the most expensive book published by each publisher.
select name, max(retail)
from books natural join publisher
group by name; 


select pubid, name, max(retail)
from books natural join publisher
group by pubid, name; 

select name, title, retail
from books natural join publisher
where (name,retail) in (select name, max(retail)
                 from books natural join publisher
                 group by name );

select name, title, retail
from books natural join publisher p
where retail = (select max(retail)
                 from books natural join publisher ps
                where  p.name = ps.name );

select name, title, retail
from books natural join publisher
where (pubid,retail) in (select pubid, max(retail)
                 from books natural join publisher
                 group by pubid );
				 
select name, title, retail
from books b join publisher p on (b.pubid = p.pubid)
where retail = (select max(retail)
                 from books bs,  publisher ps
                 where p.pubid = ps.pubid
				 and bs.pubid = ps.pubid);

-- ROWNUM
select rownum,title, retail-cost profit
from books;

-- using rownum to implement top-n analysis
List the top 5 most profitable books (in $ terms)
-- create a sorted list
-- If the next query create a temporary table/ inline view
select title, retail-cost profit
from books
order by 2 desc;
-- work with the temprary table
select T.*
from (select title, retail-cost profit
      from books
      order by 2 desc) T
where rownum<=5

-- use fetch keyword + offset
select title, retail-cost profit
from books
order by 2 desc
fetch first 5 rows only

select title, retail-cost profit
from books
order by 2 desc
fetch first -5 rows only

select title, retail-cost profit
from books
order by 2 desc
offset 5 rows
fetch next 100 rows only

select title, retail-cost profit
from books
order by 2 asc
fetch first 5 rows only

SELECT name, title, retail
FROM publisher JOIN books USING  (pubid)
WHERE(pubid, retail) IN (SELECT pubid, MAX(retail)
	            	            FROM books
	            	            GROUP by pubid);

