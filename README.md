# Expense-tracker-database

A simple expense tracking and sharing system implemented using MySQL. This project allows users to track personal and shared expenses, manage debts between group members, and generate insightful financial summaries.

🔹 Features
Record personal and group expenses
Track who owes whom for each expense
Categorize spending as personal or group
Generate executive summaries, personal spending reports, and group balance sheets
Fully relational database design with foreign keys to maintain data integrity
📂 Database Schema

The database consists of the following tables:

Table	Description
users	Stores user information (username, email, creation date)
groups_table	Stores groups for shared expenses
group_members	Many-to-many relation linking users and groups
expenses	Stores all expenses, including payer, amount, and group
debts	Tracks "who owes whom" for each expense
🛠️ Installation & Setup
Clone the repository
git clone <YOUR_GITHUB_REPO_LINK>
cd expense-tracker-db
Create the database
-- Open MySQL or your preferred client
source schema.sql;
Insert demo data
source demo_data.sql;
Run queries
source queries.sql;

You can modify or extend the demo data to test more scenarios.

📊 Queries

The project includes three main queries:

Executive Summary – Shows debts between users in human-readable format
Personal vs Group Spending – Separates personal and group expenses for each user
Group Balance Sheet – Shows total group expenses for each group
📝 Sample Results

Query 1: Executive Summary

Monthly Rent   Satinder   Roommate_A   300.00
Monthly Rent   Satinder   Roommate_B   300.00

Query 2: Personal vs Group Spending

Satinder   Group   900.00

Query 3: Group Balance Sheet

Berlin Flat   900.00

🔮 Future Work
Automate debt splitting for group expenses
Add categories for expenses (Food, Utilities, Entertainment)
Include payment settlement tracking
Build a frontend with user authentication
Generate analytics, charts, and monthly summaries
Integrate OCR to parse receipts automatically
💻 Technologies Used
Database: MySQL
Query Language: SQL

This project can be extended into a full-stack application using Node.js / Python / React for the frontend.

📂 File Structure
expense-tracker-db/
│
├─ schema.sql          # Database schema creation
├─ demo_data.sql       # Demo data for testing
├─ queries.sql         # Predefined queries for results
└─ README.md           # Project documentation
