-- Insert Users
INSERT INTO Users (name, email) VALUES
('Harsha Chougule', 'harsha@example.com'),
('Amit Patel', 'amitp@example.com');

-- Insert Categories
INSERT INTO Categories (category_name, type) VALUES
('Salary', 'Income'),
('Freelance', 'Income'),
('Food', 'Expense'),
('Transport', 'Expense'),
('Entertainment', 'Expense'),
('Rent', 'Expense');

-- Insert Income
INSERT INTO Income (user_id, category_id, amount, income_date, description) VALUES
(1, 1, 50000.00, '2025-10-01', 'Monthly salary'),
(1, 2, 8000.00, '2025-10-10', 'Freelance website project'),
(2, 1, 45000.00, '2025-10-01', 'Salary credited');

-- Insert Expenses
INSERT INTO Expenses (user_id, category_id, amount, expense_date, description) VALUES
(1, 3, 2500.00, '2025-10-05', 'Groceries'),
(1, 4, 1000.00, '2025-10-08', 'Bus pass'),
(1, 5, 1500.00, '2025-10-15', 'Movie and snacks'),
(1, 6, 12000.00, '2025-10-01', 'Monthly rent'),
(2, 3, 2000.00, '2025-10-06', 'Lunch'),
(2, 4, 800.00, '2025-10-09', 'Metro card');
