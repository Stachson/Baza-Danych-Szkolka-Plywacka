CREATE DEFINER=`root`@`localhost` PROCEDURE `usuwanie_instruktora`(IN idinstruktora integer)
BEGIN
	IF((SELECT COUNT(*) FROM zajecia WHERE id_instruktora = idinstruktora ) = 0) THEN
    
    DELETE FROM instruktorzy WHERE id_instruktora = idinstruktora;
    
   END IF;  
END