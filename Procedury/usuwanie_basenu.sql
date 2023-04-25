CREATE DEFINER=`root`@`localhost` PROCEDURE `usuwanie_basenu`(IN nazwa varchar(40))
BEGIN
	IF((SELECT COUNT(*) FROM zajecia WHERE id_basenu = (SELECT id_basenu FROM baseny WHERE nazwa_basenu = nazwa)) = 0) THEN
    
    DELETE FROM baseny WHERE nazwa_basenu = nazwa;
    
	END IF;
END