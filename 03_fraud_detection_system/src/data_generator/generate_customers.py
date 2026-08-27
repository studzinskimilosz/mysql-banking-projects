import locale

from faker import Faker
import random
import pandas as pd

fake = Faker("pl_PL")

locales = {
    "PL": "pl_PL",
    "DE": "de_DE",
    "GB": "en_GB",
    "US": "en_US",
    "FR": "fr_FR",
    "ES": "es_ES"
}

customers = []

for i in range(100):
    country = random.choice(list(locales.keys()))
    fake = Faker(locales[country])

    customer = {
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "date_of_birth": fake.date_of_birth(),
        "email": fake.email(),
        "phone_number": fake.phone_number(),
        "country": country,
    }

    customers.append(customer)


df = pd.DataFrame(customers)
df.to_csv("/../../data/customers.csv", index=False)