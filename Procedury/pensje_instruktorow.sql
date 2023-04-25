CREATE DEFINER=`root`@`localhost` PROCEDURE `pensje_instruktorow`(IN ilosc_tygodni integer)
    DETERMINISTIC
BEGIN
	DECLARE i integer;
    DECLARE j integer;
    DECLARE nazwisko varchar(20);
    DECLARE suma decimal (9,2);
    SET suma = 0;
    SET i = (SELECT min(id_instruktora) FROM instruktorzy);
    SET j = (SELECT max(id_instruktora) FROM instruktorzy);
    
    sloop: LOOP
    SET nazwisko = (SELECT nazwisko_instruktora FROM instruktorzy WHERE id_instruktora = i);
		IF((SELECT COUNT(*) FROM zajecia WHERE id_instruktora = i) != 0) THEN
			SET suma = suma + (SELECT pensja_instruktora(ilosc_tygodni, nazwisko) FROM instruktorzy WHERE id_instruktora = i);
        END IF;
        
	IF( i != j) THEN
		SET i = i+1;
        ITERATE sloop;
	ELSE 
		LEAVE sloop;
	END IF;
    
    END LOOP;
    
    SELECT suma;
	
END