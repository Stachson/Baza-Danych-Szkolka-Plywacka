CREATE DEFINER=`root`@`localhost` PROCEDURE `dodawanie_zajec`(IN nazwa varchar(60), maxiloscosob integer, nazwabasenu varchar(40), cenazajec decimal(5,2), nazwiskoinstruktora varchar(20))
BEGIN
	INSERT INTO zajecia(nazwa_zajec, max_ilosc_osob,aktualna_ilosc_osob, id_basenu, cena_zajec, id_instruktora)
    VALUES(nazwa, maxiloscosob, 0, (SELECT id_basenu FROM baseny WHERE nazwa_basenu = nazwabasenu), cenazajec, (SELECT id_instruktora FROM instruktorzy WHERE nazwisko_instruktora = nazwiskoinstruktora));
	
END