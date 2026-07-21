USE personal_budget_tracker;

INSERT INTO Categories (category_name, category_type)
VALUES
('Wypłata', 'Income'),
('Sprzedaż odzieży na Vinted', 'Income'),
('Jedzenie', 'Expense'),
('Czynsz za najem mieszkania', 'Expense'),
('Rozrywka', 'Expense');

INSERT INTO Budget_Entries (category_id, amount, entry_date, description)
VALUES
(1, 5000.00, '2026-06-01', 'Wypłata z etatu'),
(4, 2000.00, '2027-06-02', 'Czynsz za najem mieszkania'),
(3, 150.50, '2026-06-04', 'Zakupy w Lidlu'),
(3, 80.00, '2026-06-08', 'Pizza z rodziną'),
(5, 46.00, '2026-06-12', 'Kino'),
(2, 130.00, '2026-06-15', 'Sprzedaż starj kurtki na vinted'),

SELECT * FROM Monthly_Summary;