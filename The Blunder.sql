/*
Enter your query here.
*/
select ceil(avg(Salary - replace (Salary,'0',''))) from EMPLOYEES;
