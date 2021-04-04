/*	This file is used to build the title rental data
base for Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Building the all Tables 	*/


/* Drop all tables */
@"C:\cprg250\Project\dropAllTables.sql"

SET LINESIZE  300
SET PAGESIZE   100
SET UNDERLINE on
set echo on
set feedback on

/* create customer table */
spool C:\CPRG250\Project\Spool\createCustomer.txt
@"C:\CPRG250\Project\Table_Creation\createCustomer.sql"
select * from customer;

spool off

/* create Genres table */
spool C:\CPRG250\Project\Spool\createGenres.txt
@"C:\CPRG250\Project\Table_Creation\createGenres.sql"
select * from genres;
spool off

/* create Crew Member table */
spool C:\CPRG250\Project\Spool\createCrewMember.txt
@"C:\CPRG250\Project\Table_Creation\createCrewMember.sql"
select * from CrewMember;
spool off

/* create title table */
spool C:\CPRG250\Project\Spool\createTitle.txt
@"C:\CPRG250\Project\Table_Creation\createTitle.sql"
select * from title;
spool off

/* create title_crewMember table */
spool C:\CPRG250\Project\Spool\createTitle_CrewMember.txt
@"C:\CPRG250\Project\Table_Creation\createTitle_CrewMember.sql"
select * from Title_CrewMember;
spool off


/* create wishlist table */
spool C:\CPRG250\Project\Spool\createWishlist_Item.txt
@"C:\CPRG250\Project\Table_Creation\createWishlist_Item.sql"
select * from Wishlist_Item;
spool off

/* create refund table */
spool C:\CPRG250\Project\Spool\createRefund.txt
@"C:\CPRG250\Project\Table_Creation\createRefund.sql"
select * from refund;
spool off

/* create rental table */
spool C:\CPRG250\Project\Spool\createRental.txt
@"C:\CPRG250\Project\Table_Creation\createRental.sql"
select * from rental;
spool off

/* Alter the tables */
spool C:\CPRG250\Project\Spool\tableAlteration.txt
@"C:\CPRG250\Project\alterTables.sql"
spool off
