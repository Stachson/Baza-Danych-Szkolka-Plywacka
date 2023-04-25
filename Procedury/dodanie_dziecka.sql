CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_dziecka`(IN pesel_rodzica varchar(11), pesel varchar(11), dataurodzenia date, imie varchar(10), nazwisko varchar(20))
    DETERMINISTIC
BEGIN
	DECLARE idklienta integer;
    SET idklienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel_rodzica);
	IF(length(pesel_rodzica) = 11 AND length(pesel) = 11) then
		
		INSERT INTO uczestnicy_zajec(pesel_dziecka, data_urodzenia, imie_dziecka, nazwisko_dziecka,id_klienta)
		VALUES (pesel, dataurodzenia, imie, nazwisko,idklienta);
        
        UPDATE uczestnicy_zajec
        SET id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel_rodzica)
        WHERE id_klienta = 0;
		
	end if;
END