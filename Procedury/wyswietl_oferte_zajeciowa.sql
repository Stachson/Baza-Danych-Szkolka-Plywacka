CREATE DEFINER=`root`@`localhost` PROCEDURE `wyswietl_oferte_zajeciowa`()
BEGIN
	SELECT * from grupy_zajeciowe;
END