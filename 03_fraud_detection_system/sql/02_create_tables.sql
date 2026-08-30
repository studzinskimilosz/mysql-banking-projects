CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    country ENUM('PL', 'DE', 'GB', 'US', 'FR', 'ES') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_number VARCHAR(26) NOT NULL UNIQUE,
    account_type ENUM(
        'CURRENT_ACCOUNT',
        'SAVINGS_ACCOUNT',
        'BUSSINESS_ACCOUNT'
    ) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'PLN',
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    account_status ENUM('ACTIVE', 'INACTIVE') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

CREATE TABLE Cards (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    card_number VARCHAR(20), UNIQUE NOT NULL,
    card_type ENUM('DEBIT', 'CREDIT') NOT NULL,
    status ENUM('ACTIVE', 'BLOCKED', 'EXPIRED', 'CANCELLED') NOT NULL,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at DATE NOT NULL,
    FOREIGN KEY (account_id)
    REFERENCES Accounts(account_id)
);

CREATE TABLE Merchants (
    merchant_id INT PRIMARY KEY AUTO_INCREMENT,
    merchant_name VARCHAR(100) NOT NULL,
    merchant_category ENUM(
        'GROCERY',
        'RESTAURANT',
        'FUEL',
        'TRAVEL',
        'ELECTRONICS',
        'ENTERTAINMENT',
        'ONLINE_SERVICES',
        'CRYPTO',
        'GAMBLING',
        'ATM'
    ) NOT NULL,
    country ENUM('PL', 'DE', 'GB', 'US', 'FR', 'ES') NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    card_id INT,
    merchant_id INT NOT NULL,
    transaction_type ENUM('CARD_PAYMENT', 'ATM_WITHDRAWAL', 'TRANSFER', 'ONLINE_PAYMENT', 'DIRECT_DEBIT', 'BANK_TRANSFER', 'REFUND'),
    amount DECIMAL(15,2) NOT NULL,
    currency CHAR(3) NOT NULL,
    transaction_time TIMESTAMP NOT NULL,
    country ENUM('PL', 'DE', 'GB', 'US', 'FR', 'ES') NOT NULL,
    city VARCHAR(50),
    status ENUM('PENDING', 'COMPLETED', 'FAILED', 'REVERSED'),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (card_id) REFERENCES Cards(card_id),
    FOREIGN KEY (merchant_id) REFERENCES Merchants(merchant_id),
    CHECK (amount >= 0)
);