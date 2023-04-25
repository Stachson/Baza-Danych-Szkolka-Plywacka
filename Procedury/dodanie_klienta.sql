CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_klienta`(IN imie varchar(10), nazwisko varchar(20), telefon varchar(9), pesel varchar(11), email varchar(30))
BEGIN
	IF (length(telefon) = 9 AND length(pesel) = 11) then
	INSERT INTO klienci(imie_klienta, nazwisko_klienta, telefon_klienta, pesel_klienta, email_klienta)
    VALUES (imie, nazwisko, telefon, pesel, email);
    END IF;
END