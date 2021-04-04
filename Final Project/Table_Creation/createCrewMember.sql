/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Building the CrewMember Table 	*/

/*  not done. select at the end*/


create table CrewMember (
crew_mem_id			number(5) GENERATED AS IDENTITY (START WITH 10001 INCREMENT BY 1),
fname				varchar(15) constraint crewmember_fname_nn not null,
lname				varchar(15) constraint crewmember_lname_nn not null,
position 			varchar(10) constraint crewmember_position_nn not null
constraint crewmember_position_ck check (position in ('director', 'cast'))
);

insert into CrewMember (fname, lname, position)
values ('albert', 'Juorio', 'cast');

insert into CrewMember (fname, lname, position)
values ('Bryan', 'Bellin', 'director');

insert into CrewMember (fname, lname, position)
values ('lauretta', 'Massey', 'director');

insert into CrewMember (fname, lname, position)
values ('allie', 'Yashin', 'cast');

insert into CrewMember (fname, lname, position)
values ('Felipa', 'Wolverson', 'cast');
