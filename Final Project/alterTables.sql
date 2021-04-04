/*	This file is used to add the referential constraints to
	the title rental data base for Dave's Digital Rentals.

	Date created  : 20-04-09
								*/

/*  Add the primary keys and Foreign                                      */

alter table CUSTOMER add constraint PKS_CUSTOMER
	primary key (CUSTOMER_ID);
	
alter table GENRES add constraint PK_GENRES
	primary key (GENRE_ID);
	
alter table CREWMEMBER add constraint PK_CREW_MEMBER
	primary key (CREW_MEM_ID);
	
alter table TITLE add constraint PK_TITLE
	primary key (TITLE_ID);
	
alter table TITLE_CREWMEMBER add constraint PK_T_CREWMEM
	primary key (CREW_MEM_ID,title_id);
	
alter table WISHLIST_ITEM add constraint PK_WSH_ITEM
	PRIMARY KEY (customer_id, title_id);
	
alter table REFUND add constraint PK_REFUND
	primary key (customer_id, rental_id);

alter table RENTAL add constraint PK_RENTAL
	primary key (RENTAL_ID);


	
/* foreign KEYS */
	

alter table TITLE add constraint FK_TITLE_TO_GENRE
	foreign key (GENRE_ID) references GENRES;
	
	/**/
alter table TITLE_CREWMEMBER add constraint FK_TCM_TO_TITLE
	foreign key (TITLE_ID) references TITLE;

alter table TITLE_CREWMEMBER add constraint FK_TCM_TO_CM
	foreign key (CREW_MEM_ID) references CREWMEMBER;	

	/**/
alter table WISHLIST_ITEM add constraint FK_WISHITEM_TO_CUSTOMER
	foreign key (CUSTOMER_ID) references CUSTOMER;		
	
alter table WISHLIST_ITEM add constraint FK_WISHITEM_TO_TITLE
	foreign key (TITLE_ID) references TITLE;
	
alter table REFUND add constraint FK_REFUND_TO_CUSTOMER
	foreign key (CUSTOMER_ID) references CUSTOMER;
	
alter table REFUND add constraint FK_REFUND_TO_RENTAL
	foreign key (RENTAL_ID) references RENTAL;	
	
alter table RENTAL add constraint FK_RENTAL_TO_TITLE
	foreign key (TITLE_ID) references TITLE;		
	
alter table RENTAL add constraint FK_RENTAL_TO_CUSTOMER
	foreign key (CUSTOMER_ID) references CUSTOMER;	
	

	

	

	

