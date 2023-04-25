CREATE DEFINER=`root`@`localhost` PROCEDURE `pokaz_historie_zakupow`(IN pesel varchar(11))
    DETERMINISTIC
BEGIN
	DECLARE idklienta integer;
    SET idklienta = (SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel);
	IF(length(pesel) = 11) THEN
		SELECT a.data_zakupu, a.suma, b.nazwa_przedmiotu, ROUND((a.suma/b.cena_przedmiotu),0) AS "ilosc" FROM historia_zakupow a 
        INNER JOIN produkty b ON a.id_przedmiotu = b.id_przedmiotu WHERE a.id_klienta = idklienta;
    
    END IF;

END