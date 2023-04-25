CREATE DEFINER=`root`@`localhost` FUNCTION `koszty_wynajecia_torow`(ilosc_tygodni integer) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
	DECLARE suma decimal(9,2);
    DECLARE i integer;
    DECLARE j integer;
    SET i = (SELECT min(id_zajec) FROM zajecia);
    SET j = (SELECT max(id_zajec) FROM zajecia);
    SET suma = 0;
    sloop: LOOP
    IF((SELECT COUNT(*) FROM zajecia WHERE id_zajec = i) != 0) THEN
    SET suma = suma + (SELECT COUNT(*) FROM zajecia a INNER JOIN baseny b ON a.id_basenu = b.id_basenu WHERE a.id_zajec = i) * ( SELECT cena_toru_h FROM zajecia a INNER JOIN baseny b on a.id_basenu = b.id_basenu WHERE a.id_zajec = i);
    END IF;
    
 IF( i != j) THEN
		SET i = i+1;
        ITERATE sloop;
	ELSE 
		LEAVE sloop;
	END IF;
    
    END LOOP;
SET suma = suma* ilosc_tygodni;
RETURN suma;
END