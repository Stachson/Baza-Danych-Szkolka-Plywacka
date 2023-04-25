CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `obozy` AS
    SELECT 
        `turnusy`.`data_rozpoczecia` AS `data_rozpoczecia`,
        `turnusy`.`data_zakonczenia` AS `data_zakonczenia`,
        `turnusy`.`id_turnusu` AS `numer_turnusu`,
        `turnusy`.`cena_turnusu` AS `cena_turnusu`
    FROM
        `turnusy`
    WHERE
        ((TO_DAYS(`turnusy`.`data_zakonczenia`) - TO_DAYS(`turnusy`.`data_rozpoczecia`)) = 9)