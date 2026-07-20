USE bank_account_management;

INSERT INTO Customers (first_name, last_name, email, phone_number, birth_date, pesel)
VALUES
('Jan', 'Nowak', 'jan.nowak@gmail.com', '123456789', '2000-05-15', '19573920942');
('Anna' 'Kowalska', 'anna.kowalska@wp.pl', '987654321', '1990-11-21', '28452385421');
('Piotr' 'Zabielski', 'piotr.zabielski@piszto.pl', '555222000', '2002-07-14', '84375610128')

INSERT INTO Accounts (customer_id, account_number, account_type)
VALUES
(1, 'PL111122223333444455556666', 'Konto Osobiste'),
(2, 'PL222277778888333311110000', 'Konto Osobiste'),
(2, 'PL999922226666333300009999', 'Konto Oszczędnościowe'),
(3, 'PL222288881111999933335555', 'Konto Firmowe');

CALL MakeTransaction(1, 'Wpłata we wpłatomacie', 2000.00, 'Zasilenie konta');

CALL MakeTransaction(2, 'Przelew przychodzący', 5000.00, 'Wynagrodzenie za czerwiec');

CALL MakeTransaction(2, 'Przelew własny (wychodzacy)', -1000.00, 'Oszczędności na urlop');

CALL MakeTransaction(3, 'Przelew własny (przychodzący)', 1000.00, 'Oszczędności na urlop');

Call MakeTransaction(4, 'Płatność kartą', -500, 'Zakup artykułów biurowych, papierniczychi piśmienniczych - FA/09/2025');
