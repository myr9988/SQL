SELECT * FROM sachin.sbanational;
use sachin;
-----------------------------------------------------------------------------------------
select Name from sbanational where `GrAppv` = `$5,000,000`;
select count(Name),`MIS_Status` FROM sbanational group by `MIS_status`;
--  ------------------------------------------------------------------------------
select count(Name),NewExist FROM sbanational group by NewExist;
-- ------------------------------------------------------------------------------------
SELECT Name,`MIS_Status`, NewExist ,
CASE
    WHEN NewExist =2 THEN 'new_business'
    WHEN NewExist = 1 THEN 'existing_business'
    ELSE 'not_defined'
END AS BUSINESS_STATUS
FROM sbanational group by `MIS_Status`,BUSINESS_STATUS;
SELECT `MIS_Status`,count(Term) from sbanational group by `MIS_Status`;
-- -----------------------------------------------------------------------------------------
SELECT `MIS_Status`,count(DisbursementGross) from sbanational group by `MIS_Status`;
-- ----------------------------------------------------------------------------------------------
SELECT `MIS_Status`,count(RetainedJob) from sbanational group by `MIS_Status`;
-- ----------------------------------------------------------------------------------------------------
SELECT `MIS_Status`,count(GrAppv) from sbanational group by `MIS_Status`;
-- ---------------------------------------------------------------------------------------------------
# Create the bar chart to show relationship between MIS_Status and SBA_Appv
SELECT `MIS_Status`,count(SBA_Appv) from sbanational group by `MIS_Status`;

select name ,ApprovalDate,MIS_Status from sbanational where ApprovalDate < 2012 and MIS_Status='P I F' LIMIT 5;
-- ---------------------------------------------------------------
-- Write out the Final Query to identify the approved/Declined Cohorts
-- Using Window functions, explore the top 3, 5 or 10 customers based on certain metrics (Eg - Find the top 5 customers with highest bank balance who have not defaulted on a loan in the last 2 years). This will help you understand your ideal loan applicants.

WITH cte AS (
  SELECT name ,ApprovalDate,MIS_Status,GrAppv,
    row_number() over(PARTITION BY MIS_status  ORDER BY GrAppv DESC) AS rn
  FROM sbanational
)
SELECT name ,ApprovalDate,MIS_Status,GrAppv
FROM cte
WHERE ApprovalDate < 2012 and MIS_Status='P I F' limit 5;


-------------------------------------------------------------------------------------------------
-- Write out your final query that creates a column in the table (Refer to the commands in C3) which says whether a customer is eligible for a loan or not based on the criterion you set in the previous component.


SELECT Name,`MIS_Status` ,
CASE
    WHEN `MIS_Status` ='CHGOFF' THEN 'Not eligile for loan'
    WHEN `MIS_Status` = 'P I F' THEN 'eligible for loan'
    ELSE 'not_defined'
END AS Loan_Eligibility
FROM sbanational limit 10000;