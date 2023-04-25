CREATE DEFINER=`root`@`localhost` FUNCTION `przychod_z_obozow`() RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
	DECLARE suma decimal(9,2);
    DECLARE i integer;
    DECLARE j integer;
    SET j = (SELECT min(id_turnusu) FROM turnusy WHERE DATEDIFF(data_zakonczenia, data_rozpoczecia) =9);
    SET suma = 0;
    SET i = (SELECT max(id_turnusu) FROM turnusy WHERE DATEDIFF(data_zakonczenia, data_rozpoczecia) = 9);
    sloop: LOOP
    IF((SELECT COUNT(*) FROM oboz_uczestnicy a INNER JOIN turnusy b  ON b.id_turnusu = a.id_turnusu WHERE a.id_turnusu = j AND DATEDIFF(data_zakonczenia, data_rozpoczecia) = 9) != 0) THEN
    SET suma = suma + ((SELECT COUNT(*) FROM oboz_uczestnicy a INNER JOIN turnusy b  ON b.id_turnusu = a.id_turnusu WHERE a.id_turnusu = j AND DATEDIFF(data_zakonczenia, data_rozpoczecia) = 9) * (SELECT cena_turnusu FROM turnusy WHERE id_turnusu = j) );
    END IF;
    IF( j != i) THEN
		SET j = j+1;
        ITERATE sloop;
	ELSE 
		LEAVE sloop;
	END IF;
    
    END LOOP;
RETURN suma;
END