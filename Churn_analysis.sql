create database churn_analysis;



CREATE TABLE churn_data (
    gender TEXT,
    SeniorCitizen INT,
    Partner TEXT,
    Dependents TEXT,
    tenure INT,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMovies TEXT,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn TEXT,
    TenureGroup TEXT,
    Revenue FLOAT,
    ChurnFlag INT,
    ChargesCategory TEXT
);

select * from churn_data;

#1 Total customers and churn rate
SELECT 
COUNT(*) AS total_customers,
SUM(ChurnFlag) AS churned_customers,
ROUND(SUM(ChurnFlag)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data;

#2 Churn by Contract
SELECT 
Contract,
COUNT(*) AS total_customers,
SUM(ChurnFlag) AS churned,
ROUND(SUM(ChurnFlag)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY Contract
ORDER BY churn_rate DESC;

#3 Tenure impact
SELECT 
TenureGroup,
COUNT(*) AS total,
SUM(ChurnFlag) AS churned,
ROUND(SUM(ChurnFlag)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY TenureGroup
ORDER BY churn_rate DESC;

#4 Revenue loss due to churn
SELECT 
Churn,
SUM(Revenue) AS total_revenue
FROM churn_data
GROUP BY Churn;

#5 Monthly charges vs churn
SELECT 
ChargesCategory,
COUNT(*) AS total,
SUM(ChurnFlag) AS churned
FROM churn_data
GROUP BY ChargesCategory;

