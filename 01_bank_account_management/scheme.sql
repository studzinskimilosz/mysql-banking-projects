CREATE DATABASE bank_account_management;
USE bank_account_management;

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(9) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    pesel VARCHAR(11) NOT NULL UNIQUE,
    customer_status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Accounts (
	account_id INT PRIMARY KEY AUTO_INCREMENT, 
    customer_id INT NOT NULL,
    account_number VARCHAR(26) NOT NULL UNIQUE,
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    currency CHAR(3) NOT NULL DEFAULT 'PLN',
    account_status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE CASCADE
);

CREATE TABLE Transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date timestamp default current_timestamp,
    title VARCHAR(100) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
    CHECK (amount != 0)
);

DELIMITER $$

CREATE TRIGGER account_balance_update
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN 
	UPDATE Accounts
    SET balance = balance + NEW.amount
    WHERE account_id = NEW.account_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE MakeTransaction(IN p_account_id INT, IN p_transaction_type VARCHAR(50), IN p_transaction_amount DECIMAL(15,2), IN p_transaction_title VARCHAR(100))
BEGIN 
	INSERT INTO Transactions (account_id, transaction_type, amount, title)
    VALUES (p_account_id, p_transaction_type, p_transaction_amount, p_transaction_title);
END $$

DELIMITER ;