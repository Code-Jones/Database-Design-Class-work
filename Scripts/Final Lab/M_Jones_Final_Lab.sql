
rem final lab 
set echo on;
spool "c:\cprg250\final lab\spool\m_jones_part_a.txt";

rem part a:

rem q1:

insert into cp_title values 
('ground day', 'Groundhog Day', 8, 'Bill Murray, Andie Macdowell', 102, '****'); 

insert into cp_dvd values 
(1001, 'ground day', 1, 'A');

select film_title, dvd_number, rental_class
from cp_title join cp_dvd using (title_code)
where film_title like '%Groundhog%';


rem q2:

savepoint a;

select * from cp_returns;

delete from cp_returns;

select * from cp_returns;

rollback to a;

select * from cp_returns;

rem q3:

select * from cp_price;

update cp_price
set rate_per_day = rate_per_day * 1.1
where rate_per_day is not null;

/* old way 
update cp_price
set rate_per_day = 3.29
where rental_class = 'a';

update cp_price
set rate_per_day = 2.19
where rental_class = 'b';

update cp_price
set rate_per_day = 1.01
where rental_class = 'c';
*/

select * from cp_price;

commit;

spool off

rem part b:

spool "c:\cprg250\final lab\spool\m_jones_part_b.txt";


drop table exam_appointment;

drop table exam_doctor;

drop table exam_patient;




create table exam_patient (
hcn varchar2(15),
firstname varchar2(20),
lastname varchar2(20),
phonenumber number(10) constraint exam_patient_phonenumber_nn not null,
constraint exam_patient_pk primary key (hcn)); 

create table exam_doctor (
providernumber number(6),
firstname varchar2(20),
lastname varchar2(20),
phonenumber number(10)
);

alter table exam_doctor
add constraint exam_doctor_pk primary key(providernumber);

alter table exam_doctor
modify (phonenumber not null);


create table exam_appointment (
appointmentdatetime date,
hcn varchar2(15),
doctorname varchar2(20),
providernumber number(6),
charge number(8,2),
constraint exam_appt_pk primary key (appointmentdatetime, hcn, doctorname),
constraint exam_appt_patient_fk foreign key (hcn) references exam_patient (hcn),
constraint exam_appt_doctor_fk foreign key (providernumber) references exam_doctor(providernumber),
constraint exam_appt_charge_ck check (charge > 0)
);

commit;

spool off;

























