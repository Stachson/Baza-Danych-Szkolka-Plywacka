CREATE DEFINER=`root`@`localhost` PROCEDURE `wypisanie_dziecka_z_obozu`(IN pesel varchar(11), nr_turnusu integer)
BEGIN
	IF(length(pesel) = 11) then
    
    DELETE FROM oboz_uczestnicy WHERE id_dziecka = (SELECT id_dziecka FROM uczestnicy_zajec WHERE pesel_dziecka = pesel) AND id_turnusu = nr_turnusu;
    
	END IF;
END