# 🏦 Bank Account Management

## Overview 📖

This mini project is a fundational database system designed to simulate
core banking operations. It manages customer profiles,
handles multiple bank accounts per user and safely
processes financial transactions.

## Key Features & Database Mechanics ⚙️

**Data Integrity:** Enforced through `PRIMARY KEY`, `FOREIGN KEY`, and `UNIQUE`.
**Cascading Deletes:** Removing a customer record automatically deletes all their associated accounts (`ON DELETE CASCADE`).
**Automated Balances (Trigger):** An `AFTER INSERT` Trigger (`account_balance_update`) automatically calculates and updates the account balance.

## Project Structure 📂
```text
01_bank_account_management/
├── schem.sql
│   
├── mock_data.sql
│   
├── queries.sql (IN PROGRESS)
│   
└── README.md
```

## How to Run 🚀
1. Open your SQL client.
2. EXcute the `scheme.sql` script to build the empty database structure.
3. Execute the `mock_data.sql` scrip to seed the database with test data.

## Future improvements ❗️
* validation data system (for `email`, `pese`, `phone_number`, etc.).
* create a collection of SQL queries demonstration data retrieval, operations, aggregations.