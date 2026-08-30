import pandas as pd
import random as rd

customers_df = pd.read_csv("../../data/customers.csv")

accounts = []

account_id = 1

for a, c in customers_df.iterrows():
    number_of_accounts = rd.randint(1, 2)

    for a in range(number_of_accounts):
        account = {
            "account_id": account_id,
            "customer_id": c["customer_id"],
            "account_number": f"{c["country"]}{rd.randint(100000000000000000000000, 999999999999999999999999)}",
            "account_type": rd.choice(["CURRENT_ACCOUNT", "SAVINGS_ACCOUNT", "BUSSINESS_ACCOUNT"]),
            "currency": rd.choice(["PLN", "EUR", "USD", "GBP"]),
            "balance": round(rd.uniform(100, 50000), 2),
            "account_status": rd.choice(["ACTIVE", "INACTIVE"]),
        }

        accounts.append(account)
        account_id += 1

df = pd.DataFrame(accounts)

df.to_csv("../../data/accounts.csv", index=False)
