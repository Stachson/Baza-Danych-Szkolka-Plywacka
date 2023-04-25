CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sum_prod`(IN id_prod integer, IN dostawa integer)
UPDATE Produkty SET ilosc_przedmiotow=ilosc_przedmiotow+dostawa WHERE id_przedmiotu=id_prod