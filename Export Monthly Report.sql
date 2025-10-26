DROP VIEW IF EXISTS Monthly_Balance;

CREATE VIEW Monthly_Balance AS
SELECT 
    u.user_id,
    u.name,
    DATE_FORMAT(i.income_date, '%Y-%m') AS Month,
    SUM(i.amount) AS Total_Income,
    IFNULL((
        SELECT SUM(e.amount)
        FROM Expenses e
        WHERE e.user_id = u.user_id
          AND DATE_FORMAT(e.expense_date, '%Y-%m') = DATE_FORMAT(i.income_date, '%Y-%m')
    ), 0) AS Total_Expenses,
    (SUM(i.amount) - IFNULL((
        SELECT SUM(e.amount)
        FROM Expenses e
        WHERE e.user_id = u.user_id
          AND DATE_FORMAT(e.expense_date, '%Y-%m') = DATE_FORMAT(i.income_date, '%Y-%m')
    ), 0)) AS Net_Balance
FROM Income i
JOIN Users u ON i.user_id = u.user_id
GROUP BY u.user_id, u.name, DATE_FORMAT(i.income_date, '%Y-%m');
