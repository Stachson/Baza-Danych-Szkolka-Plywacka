CREATE DEFINER=`root`@`localhost` PROCEDURE `usuwanie_klienta`(IN pesel varchar(11))
BEGIN
	IF((SELECT COUNT(*) FROM uczestnicy_zajec WHERE id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel)) = 0 AND length(pesel) = 11) then
		
        UPDATE zajecia
		SET aktualna_ilosc_osob = aktualna_ilosc_osob - 1
        WHERE id_zajec IN
					(SELECT id_zajec 
                    FROM zapisani_uczestnicy 
                    WHERE id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel));
                    
		Delete FROM zapisani_uczestnicy
		WHERE id_klienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel);

		DELETE FROM klienci 
		WHERE pesel_klienta = pesel;
    end if;
END