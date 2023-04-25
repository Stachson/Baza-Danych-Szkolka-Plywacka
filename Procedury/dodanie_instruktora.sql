CREATE DEFINER=`root`@`localhost` PROCEDURE `dodanie_instruktora`(IN imie varchar(10), nazwisko varchar(20), stawka decimal(6,2) )
BEGIN
	INSERT INTO instruktorzy(imie_instruktora, nazwisko_instruktora, stawka_za_zajecia)
    VALUES (imie, nazwisko, stawka);
    
END