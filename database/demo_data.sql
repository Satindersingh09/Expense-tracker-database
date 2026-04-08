-- database/demo_data.sql
USE expense_tracker_db;

-- 1. Clean Slate (Ensures script can be run multiple times)
SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE group_members;
TRUNCATE TABLE debts;
TRUNCATE TABLE expenses;
TRUNCATE TABLE groups_table;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Insert Users
INSERT INTO users (username, email) VALUES 
('Satinder', 'satinder@student.gisma.com'),
('Roommate_A', 'alex@example.com'),
('Roommate_B', 'bella@example.com');

-- 3. Setup Group
INSERT INTO groups_table (group_name, description) VALUES ('Berlin Flat', 'Main Group');
INSERT INTO group_members (group_id, user_id) VALUES (1, 1), (1, 2), (1, 3);

-- 4. Add Rent Expense (Payer: Satinder)
INSERT INTO expenses (payer_id, group_id, amount, description, expense_date) 
VALUES (1, 1, 900.00, 'Monthly Rent', '2026-04-08');

-- 5. Record Debts (Roommate A and B owe Satinder 300 each)
INSERT INTO debts (expense_id, debtor_id, creditor_id, amount_owed) VALUES 
(1, 2, 1, 300.00),
(1, 3, 1, 300.00);
