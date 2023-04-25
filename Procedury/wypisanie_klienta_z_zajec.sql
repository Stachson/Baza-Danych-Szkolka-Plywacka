CREATE DEFINER=`root`@`localhost` PROCEDURE `wypisanie_klienta_z_zajec`(IN pesel varchar(11), numer_zajec integer)
BEGIN
	
     IF((SELECT COUNT(*) FROM zapisani_uczestnicy WHERE id_zajec = numer_zajec AND id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel))  = 1) THEN
    
	DELETE FROM zapisani_uczestnicy
    WHERE id_zajec = numer_zajec AND id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel);
    
	UPDATE zajecia
		SET aktualna_ilosc_osob = aktualna_ilosc_osob - 1
        WHERE id_zajec = numer_zajec;
    END IF;
END