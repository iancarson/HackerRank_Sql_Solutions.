/*
Enter your query here.
*/
SELECT COMPANY.company_code,COMPANY.founder,
COUNT(DISTINCT lead_Manager_code),
COUNT(DISTINCT senior_manager_code),
COUNT(DISTINCT manager_code),
COUNT(DISTINCT employee_code)
FROM Employee 
INNER JOIN COMPANY ON (COMPANY.COMPANY_CODE=EMPLOYEE.COMPANY_CODE)
GROUP BY COMPANY.company_code,COMPANY.founder
ORDER BY COMPANY.company_code;
