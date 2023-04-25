CREATE DEFINER=`root`@`localhost` PROCEDURE `zmiana_ceny_zajec`(In idzajec integer, nowa_cena decimal (6,2))
BEGIN
	UPDATE zajecia
    Set cena_zajec = nowa_cena
    WHERE id_zajec = idzajec;
END