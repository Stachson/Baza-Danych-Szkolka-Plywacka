CREATE DEFINER=`root`@`localhost` PROCEDURE `wyswietl_oferte_polkolonii`()
BEGIN
	SELECT * from polkolonie;
END