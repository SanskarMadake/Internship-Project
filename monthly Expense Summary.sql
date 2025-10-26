-- Total Expenses per Month (for each user)
SELECT 
    u.name AS User,
    DATE_FORMAT(e.expense_date, '%Y-%m') AS Month,
    SUM(e.amount) AS Total_Expenses
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
GROUP BY u.name, Month
ORDER BY Month;
