CREATE DEFINER=`root`@`localhost` PROCEDURE `usuwanie_zajec`(IN nr_zajec integer)
BEGIN
	IF((SELECT aktualna_ilosc_osob FROM zajecia WHERE id_zajec = nr_zajec) = 0) then
    
    DELETE FROM zajecia WHERE id_zajec = nr_zajec;
    
    END IF;
END