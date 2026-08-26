CREATE INDEX idx_accounts_customer
ON Accounts(customer_id);

CREATE INDEX idx_cards_account
ON Cards(account_id);

CREATE INDEX idx_transactions_accounts
ON Transactions(account_id);

CREATE INDEX idx_transactions_card
ON Transactions(card_id);

CREATE INDEX idx_transactions_merchant
ON Transactions(merchant_id);

CREATE INDEX idx_transactions_timestamp
ON Transactions(transaction_time);

CREATE INDEX idx_transactions_account_time
ON transactions(account_id, transaction_timestamp);