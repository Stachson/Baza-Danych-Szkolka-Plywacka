CREATE DEFINER=`root`@`localhost` PROCEDURE `przychody_z_obozow_i_polkolonii`()
BEGIN
	SELECT przychod_z_obozow() AS "Przychód z obozów", przychod_z_polkolonii() AS "Przychód z półkolonii";
END