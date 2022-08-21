/*
Enter your query here.
*/
select case 
    when a+b <=c or b+c <=a or c+a <=b then 'Not A Triangle'
    when a=b and b=c then 'Equilateral'
    when a=b or b=c or c=a then 'Isosceles'  
    
    else 'Scalene'
end as result
from triangles;
