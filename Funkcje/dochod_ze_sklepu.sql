CREATE DEFINER=`root`@`localhost` FUNCTION `dochod_ze_sklepu`(data_poczatkowa datetime, data_koncowa datetime) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
	DECLARE sumakoncowa DECIMAL (9,2);
    DECLARE i integer;
    DECLARE j integer;
    SET i = (SELECT min(id_transakcji) FROM historia_zakupow WHERE data_zakupu BETWEEN data_poczatkowa AND data_koncowa);
	SET j = (SELECT max(id_transakcji) FROM historia_zakupow WHERE data_zakupu BETWEEN data_poczatkowa AND data_koncowa);
    SET sumakoncowa = 0;
    sloop: LOOP

	IF((SELECT data_zakupu FROM historia_zakupow WHERE id_transakcji = i) BETWEEN data_poczatkowa AND data_koncowa)  THEN
        SET sumakoncowa = sumakoncowa + (SELECT suma from historia_zakupow WHERE id_transakcji = i);
	END IF;
    
    IF( i != j) THEN
		SET i = i+1;
        ITERATE sloop;
	ELSE 
		LEAVE sloop;
	END IF;
    
    END LOOP;

RETURN sumakoncowa;
END