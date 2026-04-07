-- 1. the Database
CREATE DATABASE IF NOT EXISTS expense_tracker_db;
USE expense_tracker_db;

-- 2. User Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3. Group Table: For roommates/friends who every we want to split the amount with
CREATE TABLE groups_table (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB;

-- 4. Group Members: Many-to-Many junction table
CREATE TABLE group_members (
    group_id INT,
    user_id INT,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups_table(group_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. Expense Table: This will Stores OCR data + Who paid
CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    payer_id INT NOT NULL,           -- The person who paid the bill
    group_id INT DEFAULT NULL,        -- NULL if personal, ID if shared
    amount DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255),
    expense_date DATE NOT NULL,
    FOREIGN KEY (payer_id) REFERENCES users(user_id),
    FOREIGN KEY (group_id) REFERENCES groups_table(group_id)
) ENGINE=InnoDB;

-- 6. Debt Table: Tracks "Who owes whom"
CREATE TABLE debts (
    debt_id INT AUTO_INCREMENT PRIMARY KEY,
    expense_id INT NOT NULL,
    debtor_id INT NOT NULL,          -- Person who needs to pay back
    creditor_id INT NOT NULL,        -- Person who is owed (the payer)
    amount_owed DECIMAL(10, 2) NOT NULL,
    is_settled BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (expense_id) REFERENCES expenses(expense_id) ON DELETE CASCADE,
    FOREIGN KEY (debtor_id) REFERENCES users(user_id),
    FOREIGN KEY (creditor_id) REFERENCES users(user_id)
) ENGINE=InnoDB;