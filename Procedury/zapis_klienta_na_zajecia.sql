CREATE DEFINER=`root`@`localhost` PROCEDURE `zapis_klienta_na_zajecia`(IN pesel varchar(11) , numer_zajec integer)
BEGIN
	if((SELECT max_ilosc_osob FROM zajecia WHERE id_zajec = numer_zajec) > (SELECT aktualna_ilosc_osob FROM zajecia WHERE id_zajec = numer_zajec )
	AND numer_zajec NOT IN (SELECT id_zajec FROM zapisani_uczestnicy WHERE id_zajec = numer_zajec AND id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel))) THEN
	
    
	INSERT INTO zapisani_uczestnicy (id_dziecka, id_zajec, id_klienta)
   VALUES (NULL, numer_zajec, (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel));
    
    
    UPDATE zajecia
    SET aktualna_ilosc_osob = aktualna_ilosc_osob +1
    WHERE id_zajec = numer_zajec;
    
    END if;
END