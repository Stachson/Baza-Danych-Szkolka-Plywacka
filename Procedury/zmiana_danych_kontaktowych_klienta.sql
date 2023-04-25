CREATE DEFINER=`root`@`localhost` PROCEDURE `zmiana_danych_kontaktowych_klienta`(IN imie varchar(10), nazwisko varchar (20), telefon varchar(9), email varchar(30), pesel varchar(11))
BEGIN
	IF(length(telefon) = 9 AND length(pesel) = 11) THEN
		UPDATE klienci
        SET imie_klienta = imie,
         nazwisko_klienta = nazwisko,
         telefon_klienta = telefon,
         email_klienta = email
         WHERE pesel_klienta = pesel;
	END IF;
END