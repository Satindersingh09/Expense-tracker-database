-- database/queries.sql
USE expense_tracker_db;

-- QUERY 1: The "Executive Summary" (Who owes what for which bill)
-- Purpose: Shows the human-readable names instead of just IDs.
SELECT 
    e.description AS 'Expense',
    payer.username AS 'Paid By',
    debtor.username AS 'Owed By',
    d.amount_owed AS 'Amount'
FROM debts d
JOIN expenses e ON d.expense_id = e.expense_id
JOIN users payer ON d.creditor_id = payer.user_id
JOIN users debtor ON d.debtor_id = debtor.user_id
WHERE d.is_settled = FALSE;

-- QUERY 2: Personal Spending vs. Group Spending
-- Purpose: Separates your private coffee/lunch from shared rent.
SELECT 
    u.username, 
    IF(e.group_id IS NULL, 'Personal', 'Group') AS 'Category',
    SUM(e.amount) AS 'Total Spent'
FROM expenses e
JOIN users u ON e.payer_id = u.user_id
GROUP BY u.username, Category;

-- QUERY 3: Group Balance Sheet
-- Purpose: Shows the total "Pot" of money for the Berlin Flat.
SELECT 
    g.group_name, 
    SUM(e.amount) AS 'Total Group Expenses'
FROM groups_table g
JOIN expenses e ON g.group_id = e.group_id
GROUP BY g.group_name;