CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    country ENUM( 'PL', 'DE', 'GB', 'US', 'FR', 'ES'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)