CREATE DEFINER=`root`@`localhost` PROCEDURE `usuwanie_dziecka`(IN pesel varchar(11))
    DETERMINISTIC
BEGIN
	IF(length(pesel) = 11) then
    
    UPDATE zajecia
		SET aktualna_ilosc_osob = aktualna_ilosc_osob - 1
        WHERE id_zajec IN
					(SELECT id_zajec 
                    FROM zapisani_uczestnicy 
                    WHERE id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel));
                    
	Delete FROM zapisani_uczestnicy
		WHERE id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel);
                    
	DELETE FROM uczestnicy_zajec
		WHERE pesel_dziecka = pesel;
	end if;
END