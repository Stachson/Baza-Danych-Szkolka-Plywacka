CREATE DEFINER=`root`@`localhost` FUNCTION `pensja_instruktora`(ilosc_tygodni integer, nazwisko varchar(20)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE suma decimal(9,2);
	DECLARE zajecia_w_tygodniu integer;
    DECLARE idinstruktora integer;
    SET suma = 0;
    SET idinstruktora = (SELECT id_instruktora FROM instruktorzy WHERE nazwisko_instruktora = nazwisko);
    
    IF( (SELECT COUNT(*) FROM zajecia WHERE (id_instruktora = idinstruktora)) != 0) THEN
    SET suma = (SELECT stawka_za_zajecia FROM instruktorzy WHERE id_instruktora = idinstruktora); 
    SET zajecia_w_tygodniu = (SELECT COUNT(*) FROM zajecia WHERE (id_instruktora = idinstruktora));
	END IF;
    SET suma = suma * zajecia_w_tygodniu * ilosc_tygodni;
RETURN suma;
END