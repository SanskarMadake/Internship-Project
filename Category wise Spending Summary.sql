-- Category-wise Expense Distribution
SELECT 
    u.name AS User,
    c.category_name AS Category,
    SUM(e.amount) AS Total_Spent
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
JOIN Categories c ON e.category_id = c.category_id
GROUP BY u.name, c.category_name
ORDER BY u.name, Total_Spent DESC;
