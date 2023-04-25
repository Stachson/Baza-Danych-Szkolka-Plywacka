CREATE DEFINER=`root`@`localhost` PROCEDURE `uczestnicy_zajec`(IN idzajec integer)
BEGIN
	
    IF((SELECT COUNT(*) FROM zapisani_uczestnicy WHERE id_zajec = idzajec AND id_klienta IS NULL) != 0) THEN
    
		SELECT imie_dziecka, nazwisko_dziecka FROM uczestnicy_zajec 
		WHERE id_dziecka IN (SELECT id_dziecka FROM zapisani_uczestnicy WHERE id_zajec = idzajec);
        
	ELSE IF((SELECT COUNT(*) FROM zapisani_uczestnicy WHERE id_zajec = idzajec AND id_dziecka IS NULL) != 0) THEN
		SELECT imie_klienta, nazwisko_klienta FROM klienci
		WHERE id_klienta IN (SELECT id_klienta FROM zapisani_uczestnicy WHERE id_zajec = idzajec);
        
    END IF;
    
    END IF;

   

END