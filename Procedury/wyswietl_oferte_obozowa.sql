CREATE DEFINER=`root`@`localhost` PROCEDURE `wyswietl_oferte_obozowa`()
BEGIN
	SELECT * from obozy;
END