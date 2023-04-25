CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `polkolonie` AS
    SELECT 
        `turnusy`.`data_rozpoczecia` AS `data_rozpoczecia`,
        `turnusy`.`data_zakonczenia` AS `data_zakonczenia`,
        (`turnusy`.`id_turnusu` - 4) AS `numer_polkolonii`,
        `turnusy`.`cena_turnusu` AS `cena_turnusu`
    FROM
        `turnusy`
    WHERE
        ((TO_DAYS(`turnusy`.`data_zakonczenia`) - TO_DAYS(`turnusy`.`data_rozpoczecia`)) = 4)