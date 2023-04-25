INSERT INTO historia_zakupow(id_przedmiotu, id_klienta, data_zakupu, suma)
VALUES(1, 1, '2022-01-02 15:26:54', 298.00);

INSERT INTO historia_zakupow(id_przedmiotu, id_klienta, data_zakupu, suma)
VALUES(3, 1, '2022-01-02 18:26:54', 129.00);

INSERT INTO historia_zakupow(id_przedmiotu, id_klienta, data_zakupu, suma)
VALUES(8, 12, '2022-01-08 23:26:54', 109.00);

INSERT INTO historia_zakupow(id_przedmiotu, id_klienta, data_zakupu, suma)
VALUES(7, 8, '2022-02-06 11:26:54', 109.00);

DELETE FROM historia_zakupow WHERE id_transakcji > 6;

SELECT * FROM historia_zakupow;