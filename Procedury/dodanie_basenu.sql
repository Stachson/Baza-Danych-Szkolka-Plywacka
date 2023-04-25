CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_basenu`(IN nazwa varchar(40), cena decimal(6,2))
BEGIN
	IF((SELECT nazwa_basenu FROM baseny WHERE nazwa_basenu = nazwa) IS NULL) THEN
	INSERT INTO baseny(nazwa_basenu, cena_toru_h)
    VAlUES (nazwa, cena);
    END IF;
END