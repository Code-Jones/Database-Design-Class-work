mod 6

REM acctmanager table
Drop table acctmanager;
CREATE table acctmanager
(
amid 	CHAR(4),
amfirst VARCHAR2(12) NOT NULL,
amlast 	VARCHAR2(12) NOT NULL,
amedate DATE    DEFAULT SYSDATE,
amSal 	NUMBER(8,2),
amcomm 	Number(7,2)	DEFAULT 0,
amearn 	AS   (amsal + amcomm),	
region 	CHAR(2),
CONSTRAINT  acctmanager_amid_pk    PRIMARY KEY(amid),
CONSTRAINT  acctmanager_region_ck
	CHECK (region IN ('N','NW','NE','S','SE','SW','W','E'))
);


insert into acctmanager (amid, amfirst, amlast, amSal, amcomm, amedate)
values ('k500', 'Mandy', 'Lopez', 42000, 10000, to_date('January 03, 2019', 'Month dd, yyyy'));

//error with this
insert into acctmanager 
values ('t500', 'Nick', 'Taylor', '05-SEP-09', 50000, 15000, 'NE'); 


insert into acctmanager (amid, amfirst, amlast, amedate, amsal, amcomm, region)
values ('w503', 'Harvey', 'Wallbanger', sysdate, 50000, 25000, 'NE');

update acctmanager
set amcomm = 15000,
	region = 'SW'
where amfirst = 'Mandy';

delete from acctmanager
where amid = 'k500';


