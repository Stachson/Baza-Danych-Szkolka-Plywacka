CREATE DEFINER=`root`@`localhost` PROCEDURE `kupno_produktu`(IN idprzedmiotu integer, pesel varchar(11), ilosc integer)
BEGIN
	IF(((SELECT ilosc_przedmiotow FROM produkty WHERE id_przedmiotu = idprzedmiotu) - ilosc) >= 0 AND length(pesel) = 11 ) THEN
		INSERT INTO historia_zakupow(id_klienta,suma, id_przedmiotu,data_zakupu)
        VALUES((SELECT id_klienta FROM klienci WHERE pesel_klienta = pesel), ilosc * (SELECT cena_przedmiotu from produkty WHERE id_przedmiotu = idprzedmiotu), idprzedmiotu, '0000-00-00');
        
        UPDATE produkty
        SET ilosc_przedmiotow = ilosc_przedmiotow - ilosc
        WHERE id_przedmiotu = idprzedmiotu;
        
    
    END IF;
END