CREATE DEFINER=`root`@`localhost` PROCEDURE `dochod_ze_sklepu`(IN data_poczatkowa datetime, data_koncowa datetime)
BEGIN
	SELECT dochod_ze_sklepu(data_poczatkowa, data_koncowa);
END