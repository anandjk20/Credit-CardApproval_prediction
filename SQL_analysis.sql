Create database Credicardapproval;
use Credicardapproval;
select * from final_project; 

# 1. Group the customers based on their income type and find the average of their annual income.
select Type_Income, round(avg(annual_income),2) As Average_Income from final_project group by Type_Income;

# 2. Find the female owners of cars and property.

select * from final_project where Gender = 'F' AND Car_Owner  = 'Y' AND Propert_Owner = 'Y' ;

# 3. Find the male customers who are staying with their families.

select * from final_project where Gender = 'M' AND Housing_type  = 'With parents';

# 4. Please list the top five people having the highest income.

WITH RankedIncome AS (
    SELECT
        Ind_id,
        Annual_income,
        RANK() OVER (ORDER BY Annual_income DESC) AS IncomeRank
    FROM
        final_project -- Replace with your table name
)
SELECT
    Ind_id,
    Annual_income
FROM
    RankedIncome
WHERE
    IncomeRank <= 5;
    
# 5. How many married people are having bad credit?

select * from final_project where Marital_status = 'Married' AND label  = 0 ;

# 6.What is the highest education level and what is the total count?

select Education , count(Education) AS total_count from final_project group by Education;

# 7. Between married males and females, who is having more bad credit? 

select Marital_status,label, Gender , count(Gender) As Count from final_project where Marital_status = 'Married' AND label  = 0 group by Gender;

