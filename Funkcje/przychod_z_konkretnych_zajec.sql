CREATE DEFINER=`root`@`localhost` FUNCTION `przychod_z_konkretnych_zajec`(ilosc_tygodni integer, idzajec integer) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
	DECLARE suma decimal (9,2);
    DECLARE ilosc_uczestnikow integer;
    SET suma = 0;
    SET ilosc_uczestnikow = (SELECT aktualna_ilosc_osob FROM zajecia WHERE id_zajec = idzajec);
    IF(ilosc_uczestnikow != 0) THEN
	SET suma = (SELECT cena_zajec FROM zajecia WHERE id_zajec = idzajec) * ilosc_uczestnikow * ilosc_tygodni;
    END IF;
    

RETURN suma;
END