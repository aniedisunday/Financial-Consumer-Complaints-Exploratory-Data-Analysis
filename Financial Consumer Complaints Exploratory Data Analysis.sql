--Exploratory data analysis 

SELECT * 
FROM FinancialConsumerComplaint.dbo.FCC;

-- 1. Total complaints

SELECT COUNT(ComplaintID) AS Total_Complaints
FROM FinancialConsumerComplaint.dbo.FCC;

-- 2. Timely Response Rate

SELECT 
    ROUND((COUNT(CASE WHEN TimelyResponse = 'Yes' THEN 1 END) * 100.0 / COUNT(*)), 1) AS Timely_Response_Percentage
FROM FinancialConsumerComplaint.dbo.FCC;

-- 3. Check for Pending Company Response to Consumer

SELECT COUNT(CompanyResponseToConsumer) AS In_Progress
FROM FinancialConsumerComplaint.dbo.FCC
WHERE CompanyResponseToConsumer = 'In Progress';

-- 4. Consumer Dispute Rate

SELECT 
    ROUND((COUNT(CASE WHEN ConsumerDisputed = 'Yes' THEN 1 END) * 100.0 / COUNT(*)), 1) AS Dispute_Rate
FROM FinancialConsumerComplaint.dbo.FCC;

-- 5. Dispute Resolved at No Cost

SELECT 
    ROUND((COUNT(CASE WHEN CompanyResponseToConsumer NOT IN ('In Progress', 'Closed with Monetary relief') THEN 1 END) * 100.0 / COUNT(*)), 1) AS Resolved_at_No_Cost
FROM FinancialConsumerComplaint.dbo.FCC;

-- 6. Complaints By Issues

SELECT Issue,
    COUNT(*) AS Complaint_by_Issues
FROM FinancialConsumerComplaint.dbo.FCC
GROUP BY Issue
ORDER BY 2 DESC;

-- 7. Complaints By State

SELECT State,
    COUNT(*) AS Complaints_By_States
FROM FinancialConsumerComplaint.dbo.FCC
GROUP BY State
ORDER BY 2 DESC;

-- 8. Complaints By Product

SELECT Product,
    COUNT(*) AS Complaints_By_Product
FROM FinancialConsumerComplaint.dbo.FCC
GROUP BY Product
ORDER BY 2 DESC;

-- 9. Complaints By Media

SELECT SubmittedVia,
    COUNT(*) AS Complaints_By_Media
FROM FinancialConsumerComplaint.dbo.FCC
GROUP BY SubmittedVia
ORDER BY 2 DESC;

-- 10. Complaints By Media

SELECT ConsumerDisputed,
    COUNT(*) AS Consumer_Dispute
FROM FinancialConsumerComplaint.dbo.FCC
GROUP BY ConsumerDisputed
ORDER BY 2 DESC;

-- 11. % Consumer Disputer

SELECT 
    ConsumerDisputed,
    COUNT(*) AS Consumer_Dispute,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM FinancialConsumerComplaint.dbo.FCC), 1) AS "Percentage"
FROM FinancialConsumerComplaint.dbo.FCC
GROUP BY ConsumerDisputed
ORDER BY Consumer_Dispute DESC;