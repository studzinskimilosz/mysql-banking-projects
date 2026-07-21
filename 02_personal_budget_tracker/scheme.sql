CREATE DATABASE personal_budget_tracker;
USE personal_budget_tracker;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    category_type ENUM('Income', 'Expense') NOT NULL
);

CREATE TABLE Budget_Entries (
    entry_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    entry_date DATE NOT NULL,
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (amount > 0),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
    ON DELETE RESTRICT
);

CREATE VIEW Monthly_Summary AS
SELECT
    DATE_FORMAT(Budget_Entries.entry_date, '%Y-%m') AS budget_month,
    Categories.category_type,
    SUM(Budget_Entries.amount) AS total_amount
FROM Budget_Entries
JOIN Categories ON Budget_Entries.category_id = Categories.category_id
GROUP BY budget_month, Categories.category_type
ORDER BY budget_month DESC;