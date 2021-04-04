/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Dropping all Tables 	*/

set feedback on

drop table rental cascade constraints;

drop table refund cascade constraints;

drop table wishlist_item cascade constraints;

drop table title_crewmember cascade constraints;

drop table crewmember cascade constraints;

drop table customer cascade constraints;

drop table title cascade constraints;

drop table genres cascade constraints;

