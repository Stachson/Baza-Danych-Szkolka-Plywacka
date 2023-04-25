CREATE DEFINER=`root`@`localhost` PROCEDURE `zapis_dziecka_na_zajecia`(IN pesel varchar(11) , numer_zajec integer)
BEGIN
	if((SELECT max_ilosc_osob FROM zajecia WHERE id_zajec = numer_zajec) > (SELECT aktualna_ilosc_osob FROM zajecia WHERE id_zajec = numer_zajec )
    AND numer_zajec NOT IN (SELECT id_zajec FROM zapisani_uczestnicy WHERE id_zajec = numer_zajec AND id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel)))  THEN
	
   INSERT INTO zapisani_uczestnicy (id_dziecka, id_zajec, id_klienta)
   VALUES ((SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel), numer_zajec, NULL);

	UPDATE zajecia
    SET aktualna_ilosc_osob = aktualna_ilosc_osob +1
    WHERE id_zajec = numer_zajec;
    
	end if;
END