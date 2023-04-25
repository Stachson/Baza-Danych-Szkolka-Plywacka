CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sklep` AS
    SELECT 
        `produkty`.`id_przedmiotu` AS `id_przedmiotu`,
        `produkty`.`nazwa_przedmiotu` AS `nazwa_przedmiotu`,
        `produkty`.`ilosc_przedmiotow` AS `ilosc_przedmiotow`,
        `produkty`.`cena_przedmiotu` AS `cena_przedmiotu`
    FROM
        `produkty`
    WHERE
        (`produkty`.`ilosc_przedmiotow` <> 0)