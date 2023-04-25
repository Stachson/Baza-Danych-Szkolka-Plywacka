CREATE DEFINER=`root`@`localhost` PROCEDURE `ilosc_zapisanych_na_oboz`(IN nr_turnusu integer)
BEGIN
	SELECT id_turnusu AS "Numer turnusu", ilosc_zapisanych_na_turnus_oboz(nr_turnusu)
		FROM oboz_uczestnicy 
        WHERE id_turnusu = nr_turnusu
        GROUP BY id_turnusu;
END