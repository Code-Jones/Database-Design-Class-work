/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Building the Title Table 	*/

/*  not done. fix fk and select at the end*/


create table title (
title_id			number(5) GENERATED AS IDENTITY (START WITH 50001 INCREMENT BY 1),
genre_id			number(5),
show_title			varchar(30) constraint title_show_title_nn not null,
runtime 			number(4) 	constraint title_runtime_nn not null,
available_on		date 		constraint title_available_on_nn not null,
release_date 		date 		constraint title_release_date_nn not null,
avg_star_rating		number(2,1),
class				char(1),
age_rating			varchar(3) 	constraint title_age_rating_nn not null,
rental_count		number(7) 	default 0,
constraint title_show_title_uk unique (show_title),
constraint title_runtime_ck check (runtime > 0),
constraint title_star_rating_ck check (avg_star_rating >= 0 and avg_star_rating <= 5.1)
);


insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30001' ,'Good Shepherd', 87, '31-Jan-2019' , '03-Jan-2020' ,4.2 ,'a','g');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30002' ,'Nekromantikto',170 ,'9-Sep-19' ,'2-Jun-20' , null ,'b','pg');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30003' ,'Doorway',173,'28-Apr-19' ,'5-Apr-20' ,3.5 ,'c','14a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30004' ,'Takers Change',159,'29-Jun-19' ,'9-Apr-20' ,2.1 ,'b','18a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30005' ,'Hi Rosenberg',157,'5-Sep-19'  ,'16-Dec-20' ,3.6 ,'c','r');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30001' ,'Quick D',200,'10-Dec-19'  ,'1-Apr-20' ,3.9 ,'a','r');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30003' ,'Lassie with', 114,'28-May-19' ,'6-Apr-20' ,2.1 ,'b','14a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30005' ,'Jimmy Live', 190,'15-Oct-19' ,'28-Sep-20' , 4.5,'c','pg');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30001' ,'The Guy', 72,'14-Jul-19' ,'27-Mar-20' ,2.2 ,'a','g');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30001' ,'Contagion Blue Harvest', 141,'12-Sep-19' ,'29-Mar-20' , 2.9,'b','18a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30001' ,'Chicks and Trains', 184,'3-Oct-19' ,'19-Mar-20' ,2.4 ,'c','r');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30004' ,'Long Degrees', 105,'10-Jun-19' ,'6-Mar-20' ,4.9 ,'a','14a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30004', 'The Father, Son and Talent', 132,'17-Jul-19' ,'30-Mar-20' ,2.0 ,'b' ,'18a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30004', 'Play for Me', 162,'14-Jun-19' ,'3-Feb-20' , null ,'a' ,'g');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30004', 'Asterix Escape', 189,'24-Sep-19' ,'17-Apr-20' ,1.5 ,'c' ,'r');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30003', 'Six Obelix: God Save Britannia',76,'8-Aug-19' ,'19-Aug-20' ,3.2 ,'b','pg');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30003', 'Racing of Separation', 170,'23-Aug-19' ,'8-Sep-20' , null ,'a' ,'pg');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30003', 'Sideways', 182,'27-Dec-19' ,'31-Mar-20' ,3.7 , 'c','r');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30002', 'Sharons Baby', 91 ,'18-Jun-19' ,'29-Apr-20' , null , 'b','14a');

insert into title (genre_id, show_title, runtime, available_on, release_date, avg_star_rating, class, age_rating)
values ('30002', 'Great Excape The' , 71 ,'2-Sep-19','30-Jan-20' , 2.9 , 'a' ,'r');

