REM assignment 2
set echo on
set feedback on
set linesize 88
set pagesize 45

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\assignment2.txt"

REM Q1: // done

select unique first_name || ' ' || surname "Full Name", customer_number "Customer #", count(customer_number) "# of Trans", 
	Case
		When count(customer_number) > 10 then 'Gold'
		when count(customer_number) > 6 then 'Silver'
		else 'Bronze'
	end "Level"
from wgb_transaction 	natural join wgb_account
						natural join wgb_customer
group by customer_number, first_name, surname
order by customer_number;


REM Q2: // done

column "Customer Name" format A25;
column "Zip" format A7;
select t.*, rownum "Position"
from (	select first_name || ', ' || surname || ' ' || substr(middle_name, 1, 1) || '.' "Customer Name", substr(postal_code, 1, 3) || ' ' || substr(postal_code, 4, 6) "Zip", count(account_type) "# of Accts"
		from wgb_customer join wgb_account using (customer_number)
		group by surname, first_name, middle_name, postal_code
		order by 3 desc, 2) t
fetch first 3 rows only;
clear columns;

REM Q3: // fix date format

column "Name" format A20;
select customer_number "Cust#", first_name || ', ' || surname "Name", account_type "Type", date_created "Open Date", max(balance) "Balance"
from wgb_account natural join wgb_customer
where account_type = 2 or account_type = 5
group by account_type, customer_number, first_name, surname, date_created, balance
having  (balance =	(select max(balance) 
					from wgb_account
					where account_type = 5)
					and account_type = 5)
					or
					(balance = (select max(balance)
					from wgb_account
					where account_type = 2)
					and account_type = 2)
order by balance desc;

REM Q4: //done

column "Total" format $99990.99;
select substr(first_name, 1, 1) || ' ' || surname "Name", account_description "Acc Name", 
sum(case 
	when transaction_type = 'D' then (transaction_amount * -1)
	else transaction_amount
end) "Total"
from wgb_customer 	natural join wgb_account
					natural join wgb_transaction
					natural join wgb_account_type
where city = 'Harrison' or city = 'Eyebrow'
group by rollup((account_type, first_name, surname, account_description))
order by first_name, account_description;

spool off
clear columns;


REM Q5: //done


set echo on
set feedback off
set linesize 150
set pagesize 80

clear break
clear column
clear compute

break on "Name" skip 1 on report on "CUST#" skip 1 on report on account_description skip 1
compute sum label 'Cust Ttl' of amount on "Name"
compute sum label 'Acct Ttl' of amount on "Cust#"
compute count label 'Ttl Transactions' of transaction_number on report
compute sum label 'Grand Total' of amount on report
column "Name" format A20
Column "Cust#" format A10
Column "account_description" format A23 heading "Account Type"
Column "transaction_number" format 99 heading "trans #"
Column "Amount" FORMAT $9,990.00 heading "Amount"

spool "C:\Users\786524\Documents\Sem#2\Database Design (CPRG-250-A)\spool\assignment2_Report.txt"

select surname || ', ' || first_name "Name", customer_number ||'-' || account_type "Cust#",
account_description, to_char(transaction_date, 'fmMon/dd, yyyy') "date", transaction_number,
case transaction_type 
	when 'D' then (-1*(abs(transaction_amount)))
    when 'C' then (abs(transaction_amount)) 
	else 0 
end "Amount"
from wgb_customer 	natural join wgb_account
					natural join wgb_account_type
					natural join wgb_transaction
order by 2, 4;

spool off;


