-- View: Monthly Balance (Income - Expense)
CREATE VIEW Monthly_Balance AS
SELECT 
    u.user_id,
    u.name,
    DATE_FORMAT(i.income_date, '%Y-%m') AS Month,
    IFNULL(SUM(i.amount), 0) AS Total_Income,
    IFNULL((
        SELECT SUM(e.amount)
        FROM Expenses e
        WHERE e.user_id = u.user_id
          AND DATE_FORMAT(e.expense_date, '%Y-%m') = DATE_FORMAT(i.income_date, '%Y-%m')
    ), 0) AS Total_Expenses,
    (IFNULL(SUM(i.amount), 0) - IFNULL((
        SELECT SUM(e.amount)
        FROM Expenses e
        WHERE e.user_id = u.user_id
          AND DATE_FORMAT(e.expense_date, '%Y-%m') = DATE_FORMAT(i.income_date, '%Y-%m')
    ), 0)) AS Net_Balance
FROM Income i
JOIN Users u ON i.user_id = u.user_id
GROUP BY u.user_id, Month;
