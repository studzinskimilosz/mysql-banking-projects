CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    country ENUM('PL', 'DE', 'GB', 'US', 'FR', 'ES'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_number VARCHAR(26) NOT NULL UNIQUE,
    account_type VARCHAR(50) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'PLN',
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    account_status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
)

CREATE TABLE Cards (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    card_number VARCHAR(20), UNIQUE NOT NULL,
    card_type ENUM('DEBIT', 'CREDIT'),
    status ENUM('ACTIVE', 'BLOCKED', 'EXPIRED', 'CANCELLED'),
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at DATE NOT NULL,
    FOREIGN KEY (account_id)
    REFERENCES Accounts(account_id)
)