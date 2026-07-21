# Personal Budget Tracker 💵

## Overview 📖

This mini project is a foundational database system designed to
track daily expenses and incomes. It systematically categorizes cash flow and 
generates summaries.

## Key Features ⚙️

* **Categorization:** Uses `ENUM` to strictly enforce `Income` and 
`Expense` types for every category.
* **Data Validation:** A `CHECK (amount>0)` ensures all transaction amount are correctly recorder
as positive values.
* **Automated reporting (VIEW):** A database `VIEW` automatically aggregates data, grouping and calculate cash flows.

## Project Structure 📂

```text
02_Personal_Budget_Tracker/
├── schema.sql
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
* create a collection of SQL queries demonstration data retrieval, operations, aggregations.
