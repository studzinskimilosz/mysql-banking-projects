from faker import Faker
import random

fake = Faker("pl_PL")

locales = {
    "PL": "pl_PL",
    "DE": "de_DE",
    "GB": "en_GB",
    "US": "en_US",
    "FR": "fr_FR",
    "ES": "es_ES"
}

for i in range(10):
    country = random.choice(list(locales.keys()))

    fake = Faker(locales[country])

    first_name = fake.first_name()
    last_name = fake.last_name()
    date_of_birth = fake.date_of_birth()
    email = fake.email()
    phone_number = fake.phone_number()

    print(f"Customer {i + 1}")
    print(f"Name: {first_name} {last_name}")
    print(f"Date of birth: {date_of_birth}")
    print(f"Email: {email}")
    print(f"Phone: {phone_number}")
    print(f"Country: {country}")
    print("-" * 40)