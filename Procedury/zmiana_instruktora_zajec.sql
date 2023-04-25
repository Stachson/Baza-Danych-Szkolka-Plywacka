CREATE DEFINER=`root`@`localhost` PROCEDURE `zmiana_instruktora_zajec`(IN idinstruktora integer, nr_zajec integer)
BEGIN
	IF((SELECT COUNT(*) FROM instruktorzy WHERE id_instruktora = idinstruktora) > 0) THEN
    
    UPDATE zajecia
    SET id_instruktora = idinstruktora
    WHERE id_zajec = nr_zajec;
    
    END IF;
END