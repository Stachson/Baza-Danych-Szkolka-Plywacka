#DROP DATABASE IF EXISTS `szkolkaPlywacka`;
CREATE DATABASE `szkolkaPlywacka`;
USE `szkolkaPlywacka`;

CREATE TABLE `Klienci` (
  `id_klienta` integer NOT NULL UNIQUE auto_increment,
  `imie_klienta` varchar(10) NOT NULL,
  `nazwisko_klienta` varchar(20) NOT NULL,
  `telefon_klienta` varchar(9) NOT NULL,
  `pesel_klienta` varchar(11) UNIQUE Not NULL,
  `email_klienta` varchar(30) UNIQUE NOT NULL,
  PRIMARY KEY (`id_klienta`)
);

CREATE TABLE `Uczestnicy_zajec` (
  `id_dziecka` integer NOT NULL UNIQUE auto_increment,
  `id_klienta` integer NOT NULL,
  `pesel_dziecka` varchar(11) UNIQUE NOT NULL,
  `data_urodzenia` date NOT NULL,
  `imie_dziecka` varchar(10) NOT NULL,
  `nazwisko_dziecka` varchar(20) NOT NULL,
  PRIMARY KEY (`id_dziecka`),
  FOREIGN KEY (`id_klienta`) REFERENCES `Klienci`(`id_klienta`)
);

CREATE TABLE `Baseny` (
  `id_basenu` integer NOT NULL UNIQUE auto_increment,
  `nazwa_basenu` varchar(40) NOT NULL,
  `cena_toru_h` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_basenu`)
);

CREATE TABLE `Instruktorzy` (
  `id_instruktora` integer NOT NULL UNIQUE auto_increment,
  `imie_instruktora` varchar(10) NOT NULL,
  `nazwisko_instruktora` varchar(20) NOT NULL,
  `stawka_za_zajecia` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_instruktora`)
);

CREATE TABLE `Zajecia` (
  `id_zajec` integer NOT NULL UNIQUE auto_increment,
  `nazwa_zajec` varchar(60) NOT NULL,
  `max_ilosc_osob` integer NOT NULL,
  `aktualna_ilosc_osob` integer NOT NULL,
  `id_basenu` integer NOT NULL,
  `cena_zajec` decimal(5,2) NOT NULL,
  `id_instruktora` integer NOT NULL,
  PRIMARY KEY (`id_zajec`),
  FOREIGN KEY (`id_basenu`) REFERENCES `Baseny`(`id_basenu`),
  FOREIGN KEY (`id_instruktora`) REFERENCES `Instruktorzy`(`id_instruktora`)
);

CREATE TABLE Zapisani_uczestnicy(
	id_dziecka integer,
    id_zajec integer NOT NULL,
    id_klienta integer,
	FOREIGN KEY (id_dziecka) REFERENCES Uczestnicy_zajec(id_dziecka),
    FOREIGN KEY (id_zajec) REFERENCES Zajecia(id_zajec),
	FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta)
);

CREATE TABLE `Produkty` (
  `id_przedmiotu` integer NOT NULL UNIQUE auto_increment,
  `nazwa_przedmiotu` varchar(20) NOT NULL,
  `cena_przedmiotu` decimal(6,2) NOT NULL,
  `ilosc_przedmiotow` integer NOT NULL,
  PRIMARY KEY (`id_przedmiotu`)
);

CREATE TABLE `Turnusy` (
  `id_turnusu` integer NOT NULL UNIQUE auto_increment,
  `data_rozpoczecia` date NOT NULL,
  `data_zakonczenia` date NOT NULL,
  `cena_turnusu` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id_turnusu`)
);

CREATE TABLE `Polkolonie_uczestnicy` (
  `id_uczestnika_polkolonii` integer NOT NULL UNIQUE auto_increment,
  `id_klienta` integer NOT NULL,
  `id_dziecka` integer NOT NULL,
  `id_turnusu` integer NOT NULL,
  PRIMARY KEY (`id_uczestnika_polkolonii`),
  FOREIGN KEY (`id_turnusu`) REFERENCES `Turnusy`(`id_turnusu`),
  FOREIGN KEY (`id_klienta`) REFERENCES `Klienci`(`id_klienta`),
  FOREIGN KEY (`id_dziecka`) REFERENCES `Uczestnicy_zajec`(`id_dziecka`)
);

CREATE TABLE `Oboz_uczestnicy` (
  `id_uczestnika_obozu` integer NOT NULL auto_increment,
  `id_klienta` integer NOT NULL,
  `id_dziecka` integer NOT NULL,
  `id_turnusu` integer NOT NULL,
  PRIMARY KEY (`id_uczestnika_obozu`),
  FOREIGN KEY (`id_turnusu`) REFERENCES `Turnusy`(`id_turnusu`),
  FOREIGN KEY (`id_klienta`) REFERENCES `Klienci`(`id_klienta`),
  FOREIGN KEY (`id_dziecka`) REFERENCES `Uczestnicy_zajec`(`id_dziecka`)
);

CREATE TABLE historia_zakupow(
	id_transakcji integer NOT NULL UNIQUE auto_increment,
	id_przedmiotu integer,
	id_klienta integer,
	data_zakupu datetime,
	suma decimal(9,2),
	PRIMARY KEY (id_transakcji),
	FOREIGN KEY (id_przedmiotu) REFERENCES produkty (id_przedmiotu)
);

CREATE TABLE Kupione_produkty(
	id_transakcji integer NOT NULL,
    id_przedmiotu integer NOT NULL,
    FOREIGN KEY (id_transakcji) REFERENCES historia_zakupow (id_transakcji),
    FOREIGN KEY (id_przedmiotu) REFERENCES produkty (id_przedmiotu)
);





