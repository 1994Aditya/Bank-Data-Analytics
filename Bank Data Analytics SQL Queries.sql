/*KPI 1. Total Loan Amount Funded*/

SELECT 
SUM(`Funded Amount`) AS total_loan_amount_funded
FROM bank_data_analytics;

/*KPI 2. Total Loans*/

SELECT 
COUNT(*) AS total_loans
FROM bank_data_analytics;

/*KPI 3. Total Collection*/

SELECT 
ROUND(SUM(`Total Pymnt`),2) AS total_collection
FROM bank_data_analytics;

/*KPI 4. Total Interest*/

SELECT 
ROUND(SUM(`Total Rrec int`),2) AS total_interest
FROM bank_data_analytics;

/*KPI 5. Branch-Wise (Interest, Fees, Total Revenue)*/

SELECT `Branch Name`, 
ROUND(SUM(`Total Rec Prncp` + `Total Rrec int` + `Total Fees`),2) AS total_revenue
FROM bank_data_analytics
GROUP BY `Branch Name`
ORDER BY total_revenue DESC;

/*KPI 6. State-Wise Loan*/

SELECT `State Name`, 
COUNT(*) AS loan_count
FROM bank_data_analytics
GROUP BY `State Name`
ORDER BY loan_count DESC;

/*KPI 7. Religion-Wise Loan*/

SELECT Religion, 
COUNT(*) AS loan_count
FROM bank_data_analytics
GROUP BY Religion;

/*KPI 8. Product Group-Wise Loan*/

SELECT `Purpose Category`, 
COUNT(*) AS loan_count
FROM bank_data_analytics
GROUP BY `Purpose Category`
ORDER BY loan_count DESC;

/*KPI 9. Disbursement Trend*/

SELECT `Disbursement Date (Years)` AS `year`,
COUNT(*) AS loan_count,
CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data_analytics), 2), ' %') AS Disbursement_trend
FROM bank_data_analytics
GROUP BY `Disbursement Date (Years)`
ORDER BY `Disbursement Date (Years)`;

/*KPI 10. Grade-Wise Loan*/

SELECT Grrade, 
COUNT(*) AS loan_count
FROM bank_data_analytics
GROUP BY Grrade
ORDER BY Grrade;

/*KPI 11. Count of Default Loan*/

SELECT 
COUNT(*) AS default_loan_count
FROM bank_data_analytics
WHERE `Is Default Loan` = 'Y';

/*KPI 12. Count of Delinquent Clients*/

SELECT 
COUNT(DISTINCT `Client id`) AS delinquent_client_count
FROM bank_data_analytics
WHERE `Is Delinquent Loan` = 'Y';

/*KPI 13. Delinquent Loans Rate*/

SELECT 
CONCAT(ROUND(100.0 * SUM(CASE WHEN `Is Delinquent Loan` = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2), ' %')
AS delinquent_loan_rate
FROM bank_data_analytics;

/*KPI 14. Default Loan Rate*/

SELECT 
CONCAT(ROUND(100.0 * SUM(CASE WHEN `Is Default Loan` = 'Y' THEN 1 ELSE 0 END) / COUNT(*), 2), ' %') 
AS default_loan_rate
FROM bank_data_analytics;

/*KPI 15. Loan Status-Wise Loan*/

SELECT `Final Status`, 
COUNT(*) AS loan_count
FROM bank_data_analytics
GROUP BY `Final Status`;

/*KPI 16. Age Group-Wise Loan*/

SELECT `Age`, 
COUNT(*) AS loan_count
FROM bank_data_analytics
GROUP BY `Age`
ORDER BY `Age`;

/*KPI 17. No Verified Loan*/

SELECT 
COUNT(*) AS No_verified_loans
FROM bank_data_analytics
WHERE `Verification Status` = 'Not Verified';

/*KPI 18. Loan Maturity*/

SELECT `Loan Status`, `Loan Term`,
COUNT(*) AS Loan_Count,
CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_data_analytics), 2),' %') AS Loan_perchantage
FROM bank_data_analytics
GROUP BY `Loan Status`,`Loan Term`
ORDER BY `Loan Status`;
















