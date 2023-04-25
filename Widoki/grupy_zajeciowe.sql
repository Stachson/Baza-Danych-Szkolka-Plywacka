CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `grupy_zajeciowe` AS
    SELECT 
        `a`.`id_zajec` AS `numer_zajec`,
        `a`.`nazwa_zajec` AS `nazwa_zajec`,
        `a`.`max_ilosc_osob` AS `max_ilosc_osob`,
        `a`.`aktualna_ilosc_osob` AS `aktualna_ilosc_osob`,
        `a`.`cena_zajec` AS `cena_zajec`,
        `b`.`nazwa_basenu` AS `nazwa_basenu`
    FROM
        (`zajecia` `a`
        JOIN `baseny` `b` ON ((`a`.`id_basenu` = `b`.`id_basenu`)))