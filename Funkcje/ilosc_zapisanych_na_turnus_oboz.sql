CREATE DEFINER=`root`@`localhost` FUNCTION `ilosc_zapisanych_na_turnus_oboz`(nr_turnusu integer) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE wynik integer;
    
    SET wynik = (SELECT COUNT(*) FROM oboz_uczestnicy WHERE id_turnusu = nr_turnusu);
RETURN (wynik);
END