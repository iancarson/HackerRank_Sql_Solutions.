/*
Enter your query here.
*/
 #MYSQL
    SET @NO=0;
    SELECT REPEAT("* ", @NO:=@NO+1) 
    FROM INFORMATION_SCHEMA.TABLES 
    LIMIT 20;
