CREATE DEFINER=`root`@`localhost` PROCEDURE `zapisani_na_oboz`( IN nr_turnusu integer)
BEGIN
	SELECT 
        `a`.`imie_dziecka` AS `imie_dziecka`,
        `a`.`nazwisko_dziecka` AS `nazwisko_dziecka`,
        `b`.`id_turnusu` AS `id_turnusu`
    FROM
        (`uczestnicy_zajec` `a`
        JOIN `oboz_uczestnicy` `b` ON ((`a`.`id_dziecka` = `b`.`id_dziecka`)))
    WHERE
        (`b`.`id_turnusu` = nr_turnusu);
END