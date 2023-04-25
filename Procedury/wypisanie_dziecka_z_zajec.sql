CREATE DEFINER=`root`@`localhost` PROCEDURE `wypisanie_dziecka_z_zajec`(IN pesel varchar(11), numer_zajec integer)
BEGIN
	
    IF((SELECT COUNT(*) FROM zapisani_uczestnicy WHERE id_zajec = numer_zajec AND id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel))  = 1) THEN
	
    DELETE FROM zapisani_uczestnicy
    WHERE id_zajec = numer_zajec AND id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel);
    
	UPDATE zajecia
		SET aktualna_ilosc_osob = aktualna_ilosc_osob - 1
        WHERE id_zajec = numer_zajec;
      END IF;  
END