CREATE DEFINER=`root`@`localhost` PROCEDURE `zapis_dziecka_na_polkolonie`(IN pesel varchar(11), numer_turnusu integer)
BEGIN
	IF(length(pesel) = 11 AND (SELECT DATEDIFF(data_zakonczenia, data_rozpoczecia) FROM turnusy WHERE id_turnusu = numer_turnusu  + 4) = 4  ) then
    
    IF((SELECT count(*) FROM polkolonie_uczestnicy WHERE id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel) AND id_turnusu = numer_turnusu +4) = 0 ) then
    
    INSERT INTO polkolonie_uczestnicy(id_klienta, id_dziecka, id_turnusu)
    VALUES((SELECT id_klienta FROM uczestnicy_zajec WHERE pesel_dziecka = pesel), (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel), numer_turnusu + 4);
    
    END IF;
    END IF;
END