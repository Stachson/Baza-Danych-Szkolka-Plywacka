CREATE DEFINER=`root`@`localhost` PROCEDURE `ilosc_zapisanych_na_polkolonie`(IN nr_turnusu integer)
BEGIN
	SELECT id_turnusu - 4 AS "Numer turnusu", ilosc_zapisanych_na_turnus_polkolonie(nr_turnusu)
		FROM polkolonie_uczestnicy 
        WHERE id_turnusu = nr_turnusu
        GROUP BY id_turnusu;
END