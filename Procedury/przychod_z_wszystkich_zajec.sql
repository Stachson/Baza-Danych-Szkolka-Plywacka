CREATE DEFINER=`root`@`localhost` PROCEDURE `przychod_z_wszystkich_zajec`(IN ilosc_tygodni integer)
    DETERMINISTIC
BEGIN
	DECLARE suma decimal(9,2);
    DECLARE idzajec integer;
    DECLARE i integer;
    DECLARE j integer;
	DECLARE ilosc_uczestnikow integer;
    
    SET suma = 0;
    
	SET i = (SELECT min(id_zajec) FROM zajecia);
    SET j = (SELECT max(id_zajec) FROM zajecia);
    
    sloop: LOOP
    SET idzajec = i;
   # IF((SELECT id_zajec FROM zajecia WHERE id_zajec = idzajec) != null) THEN
    SET ilosc_uczestnikow  = (SELECT aktualna_ilosc_osob FROM zajecia WHERE id_zajec = idzajec);
		IF(ilosc_uczestnikow != 0) THEN
		SET suma = suma + (SELECT cena_zajec FROM zajecia WHERE id_zajec = idzajec) * ilosc_uczestnikow;
		END IF;
        
   #END IF;
    
    IF( i != j) THEN
		SET i = i+1;
        ITERATE sloop;
	ELSE 
		LEAVE sloop;
	END IF;
    
    END LOOP;
    
SET suma = suma * ilosc_tygodni;    
SELECT suma;
   
    
    
	

END