-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Gru 2018, 07:50
-- Wersja serwera: 10.1.13-MariaDB
-- Wersja PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dziennik`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_kontaktowe`
--

CREATE TABLE `dane_kontaktowe` (
  `IDAdresu` int(11) NOT NULL,
  `Miejscowosc` varchar(32) NOT NULL,
  `Ulica` varchar(64) NOT NULL,
  `KodPocztowy` varchar(6) NOT NULL,
  `Telefon` varchar(16) NOT NULL,
  `Email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `dane_kontaktowe`
--

INSERT INTO `dane_kontaktowe` (`IDAdresu`, `Miejscowosc`, `Ulica`, `KodPocztowy`, `Telefon`, `Email`) VALUES
(1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `IDKlasy` int(11) NOT NULL,
  `Nazwa` varchar(32) NOT NULL,
  `IDWychowawcy` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `klasy`
--

INSERT INTO `klasy` (`IDKlasy`, `Nazwa`, `IDWychowawcy`) VALUES
(1, 'Niezdefiniowana', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `IDNauczyciela` int(11) NOT NULL,
  `Imie` varchar(32) NOT NULL,
  `Nazwisko` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `nauczyciele`
--

INSERT INTO `nauczyciele` (`IDNauczyciela`, `Imie`, `Nazwisko`) VALUES
(1, 'nauczyciel niezdefiniowany', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `obecnosc`
--

CREATE TABLE `obecnosc` (
  `IDObecnosci` int(11) NOT NULL,
  `IDZajec` int(11) NOT NULL,
  `IDUcznia` int(11) NOT NULL,
  `IDStanObecnosci` int(11) NOT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `IDOceny` int(11) NOT NULL,
  `IDZajec` int(11) NOT NULL,
  `IDUcznia` int(11) NOT NULL,
  `IDOcenySchematu` int(11) NOT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny_schematu`
--

CREATE TABLE `oceny_schematu` (
  `IDOcenySchematu` int(11) NOT NULL,
  `Nazwa` varchar(32) NOT NULL,
  `Wartosc` double NOT NULL,
  `IDSchematu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie`
--

CREATE TABLE `opiekunowie` (
  `IDOpiekuna` int(11) NOT NULL,
  `Imie` varchar(32) NOT NULL,
  `Nazwisko` varchar(32) NOT NULL,
  `IDAdresu` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie_uczniow`
--

CREATE TABLE `opiekunowie_uczniow` (
  `IDWpisu` int(11) NOT NULL,
  `IDOpiekuna` int(11) NOT NULL,
  `IDUcznia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `IDPrzedmiotu` int(11) NOT NULL,
  `Nazwa` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `schemat_ocen`
--

CREATE TABLE `schemat_ocen` (
  `IDSchematu` int(11) NOT NULL,
  `Nazwa` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stan_obecnosci`
--

CREATE TABLE `stan_obecnosci` (
  `IDStanObecnosci` int(11) NOT NULL,
  `Nazwa` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `stan_obecnosci`
--

INSERT INTO `stan_obecnosci` (`IDStanObecnosci`, `Nazwa`) VALUES
(1, 'obecny'),
(2, 'spóźniony'),
(3, 'nieobecny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `IDUcznia` int(11) NOT NULL,
  `Imie` varchar(32) NOT NULL,
  `Nazwisko` varchar(32) NOT NULL,
  `IDKlasy` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zajecia`
--

CREATE TABLE `zajecia` (
  `IDZajec` int(11) NOT NULL,
  `IDProwadzacego` int(11) NOT NULL DEFAULT '1',
  `IDKlasy` int(11) NOT NULL,
  `IDPrzedmiotu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `dane_kontaktowe`
--
ALTER TABLE `dane_kontaktowe`
  ADD PRIMARY KEY (`IDAdresu`);

--
-- Indexes for table `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`IDKlasy`),
  ADD KEY `idwychowawcy` (`IDWychowawcy`);

--
-- Indexes for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`IDNauczyciela`);

--
-- Indexes for table `obecnosc`
--
ALTER TABLE `obecnosc`
  ADD PRIMARY KEY (`IDObecnosci`),
  ADD KEY `IDZajec` (`IDZajec`),
  ADD KEY `IDUcznia` (`IDUcznia`),
  ADD KEY `IDStanObecnosci` (`IDStanObecnosci`);

--
-- Indexes for table `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`IDOceny`),
  ADD KEY `IDZajec` (`IDZajec`),
  ADD KEY `IDUcznia` (`IDUcznia`),
  ADD KEY `IDOcenySchematu` (`IDOcenySchematu`);

--
-- Indexes for table `oceny_schematu`
--
ALTER TABLE `oceny_schematu`
  ADD PRIMARY KEY (`IDOcenySchematu`),
  ADD KEY `IDSchematu` (`IDSchematu`);

--
-- Indexes for table `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD PRIMARY KEY (`IDOpiekuna`),
  ADD KEY `IDAdresu` (`IDAdresu`);

--
-- Indexes for table `opiekunowie_uczniow`
--
ALTER TABLE `opiekunowie_uczniow`
  ADD PRIMARY KEY (`IDWpisu`),
  ADD KEY `IDOpiekuna` (`IDOpiekuna`),
  ADD KEY `IDUcznia` (`IDUcznia`);

--
-- Indexes for table `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`IDPrzedmiotu`);

--
-- Indexes for table `schemat_ocen`
--
ALTER TABLE `schemat_ocen`
  ADD PRIMARY KEY (`IDSchematu`);

--
-- Indexes for table `stan_obecnosci`
--
ALTER TABLE `stan_obecnosci`
  ADD PRIMARY KEY (`IDStanObecnosci`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`IDUcznia`),
  ADD KEY `IDKlasy` (`IDKlasy`);

--
-- Indexes for table `zajecia`
--
ALTER TABLE `zajecia`
  ADD PRIMARY KEY (`IDZajec`),
  ADD KEY `IDProwadzacego` (`IDProwadzacego`),
  ADD KEY `IDKlasy` (`IDKlasy`),
  ADD KEY `IDPrzedmiotu` (`IDPrzedmiotu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dane_kontaktowe`
--
ALTER TABLE `dane_kontaktowe`
  MODIFY `IDAdresu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `klasy`
--
ALTER TABLE `klasy`
  MODIFY `IDKlasy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `IDNauczyciela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `obecnosc`
--
ALTER TABLE `obecnosc`
  MODIFY `IDObecnosci` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `IDOceny` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `oceny_schematu`
--
ALTER TABLE `oceny_schematu`
  MODIFY `IDOcenySchematu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  MODIFY `IDOpiekuna` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `opiekunowie_uczniow`
--
ALTER TABLE `opiekunowie_uczniow`
  MODIFY `IDWpisu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `IDPrzedmiotu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `schemat_ocen`
--
ALTER TABLE `schemat_ocen`
  MODIFY `IDSchematu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `stan_obecnosci`
--
ALTER TABLE `stan_obecnosci`
  MODIFY `IDStanObecnosci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `IDUcznia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `zajecia`
--
ALTER TABLE `zajecia`
  MODIFY `IDZajec` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klasy`
--
ALTER TABLE `klasy`
  ADD CONSTRAINT `klasy_ibfk_1` FOREIGN KEY (`IDWychowawcy`) REFERENCES `nauczyciele` (`IDNauczyciela`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `obecnosc`
--
ALTER TABLE `obecnosc`
  ADD CONSTRAINT `obecnosc_ibfk_1` FOREIGN KEY (`IDStanObecnosci`) REFERENCES `stan_obecnosci` (`IDStanObecnosci`) ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`IDZajec`) REFERENCES `zajecia` (`IDZajec`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`IDUcznia`) REFERENCES `uczniowie` (`IDUcznia`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`IDOcenySchematu`) REFERENCES `oceny_schematu` (`IDOcenySchematu`) ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `oceny_schematu`
--
ALTER TABLE `oceny_schematu`
  ADD CONSTRAINT `oceny_schematu_ibfk_1` FOREIGN KEY (`IDSchematu`) REFERENCES `schemat_ocen` (`IDSchematu`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD CONSTRAINT `opiekunowie_ibfk_1` FOREIGN KEY (`IDAdresu`) REFERENCES `dane_kontaktowe` (`IDAdresu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `opiekunowie_uczniow`
--
ALTER TABLE `opiekunowie_uczniow`
  ADD CONSTRAINT `opiekunowie_uczniow_ibfk_1` FOREIGN KEY (`IDOpiekuna`) REFERENCES `opiekunowie` (`IDOpiekuna`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `opiekunowie_uczniow_ibfk_2` FOREIGN KEY (`IDUcznia`) REFERENCES `uczniowie` (`IDUcznia`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`IDKlasy`) REFERENCES `klasy` (`IDKlasy`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `uczniowie_ibfk_2` FOREIGN KEY (`IDUcznia`) REFERENCES `obecnosc` (`IDUcznia`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zajecia`
--
ALTER TABLE `zajecia`
  ADD CONSTRAINT `zajecia_ibfk_1` FOREIGN KEY (`IDProwadzacego`) REFERENCES `nauczyciele` (`IDNauczyciela`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `zajecia_ibfk_2` FOREIGN KEY (`IDKlasy`) REFERENCES `klasy` (`IDKlasy`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `zajecia_ibfk_3` FOREIGN KEY (`IDPrzedmiotu`) REFERENCES `przedmiot` (`IDPrzedmiotu`) ON DELETE CASCADE,
  ADD CONSTRAINT `zajecia_ibfk_4` FOREIGN KEY (`IDZajec`) REFERENCES `obecnosc` (`IDZajec`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
