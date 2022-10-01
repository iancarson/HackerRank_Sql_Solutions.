select a.start_date, b.end_date from ( select start_date, row_number() 
over(order by start_date) num from projects where start_date not in (select end_date from projects) ) a 
join ( select end_date, row_number() over(order by end_date) num from projects where end_date not in (select start_date from projects) ) b 
using(num) order by datediff(end_date, start_date), a.start_date
