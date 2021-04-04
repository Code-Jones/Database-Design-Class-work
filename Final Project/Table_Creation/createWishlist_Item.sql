/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Building the Wishlist_item Table 	*/

/*  not done. / select at the end*/


create table wishlist_item (
customer_id				number(5),
title_id				number(5));

insert into wishlist_item (customer_id, title_id)
values ('20001','50006');

insert into wishlist_item (customer_id, title_id)
values ('20002','50004');

insert into wishlist_item (customer_id, title_id)
values ('20004','50001');

insert into wishlist_item (customer_id, title_id)
values ('20005','50003');

insert into wishlist_item (customer_id, title_id)
values ('20004','50008');

insert into wishlist_item (customer_id, title_id)
values ('20003','50014');

insert into wishlist_item (customer_id, title_id)
values ('20001','50016');

insert into wishlist_item (customer_id, title_id)
values ('20002','50020');

insert into wishlist_item (customer_id, title_id)
values ('20003','50015');

insert into wishlist_item (customer_id, title_id)
values ('20003','50011');

insert into wishlist_item (customer_id, title_id)
values ('20002','50011');

insert into wishlist_item (customer_id, title_id)
values ('20001','50011');

insert into wishlist_item (customer_id, title_id)
values ('20004','50011');
