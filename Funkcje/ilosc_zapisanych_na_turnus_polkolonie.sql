CREATE DEFINER=`root`@`localhost` FUNCTION `ilosc_zapisanych_na_turnus_polkolonie`(nr_turnusu integer) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE wynik integer;
    
    SET wynik = (SELECT COUNT(*) FROM polkolonie_uczestnicy WHERE id_turnusu = nr_turnusu + 4);
RETURN (wynik);
END