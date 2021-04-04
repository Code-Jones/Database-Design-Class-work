/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Building the Refund Table 	*/

/*  not done.  select at the end*/


create table refund (
customer_id 			number(5),
rental_id 				number(5));


insert into refund (customer_id, rental_id)
values ('20001','40004');

insert into refund (customer_id, rental_id)
values ('20005','40003');