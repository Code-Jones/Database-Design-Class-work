/*	This file is used to build a report to show all 
the movies in a genre base on Dave's Digital Rentals.
	
Created by    : Fernando Arenas and Matt Jones
Date created  : 20/04/09

/*	Report: all movies of a genre 	*/


set echo off;
set feedback off;
set linesize 61;
set pagesize 50;
set underline on;
set define on;

accept genre_input char format 'A30' prompt 'Enter a Genre: ' 

ttitle 	center 'Movies in Selected Genre' skip 1 -
		center &genre_input skip 2

btitle left 'Generated by: ' format A10 SQL.USER skip 2 -
	center 'For internal use only' left _date right 'Page: ' format 9 SQL.PNO;


column "Genre" format A30 heading "Genre";
column "Title" format A30 heading "Title";

Break on "Genre" on report;

compute count label "Total amount" of "Title" on report;

spool "C:\cprg250\project\spool\Report_1.txt";

select 	initcap(genre) "Genre", initcap(show_title) "Title"
from 	genres, title
where 	genres.genre_id = title.genre_id
and 	genre like initcap('%&genre_input%')
group by show_title, genre; 

spool off;
ttitle off;
btitle off;
repheader off;
repfooter off;
clear columns;
clear compute;
clear break;




