/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Building the Genres Table 	*/

/*  not done. select at the end*/


create table genres (
genre_id			number(5) GENERATED AS IDENTITY (START WITH 30001 INCREMENT BY 1),
genre				varchar(30) constraint genre_genre_nn not null);


insert into genres (genre)
values ('Action');

insert into genres (genre)
values ('Drama');

insert into genres (genre)
values ('Thriller');

insert into genres (genre)
values ('Sci-fiction');

insert into genres (genre)
values ('Horror');

insert into genres (genre)
values ('Comedy');

/* select * from genres; */