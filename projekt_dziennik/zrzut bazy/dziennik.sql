-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Gru 2018, 09:36
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
  `Ocena` varchar(2) NOT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie`
--

CREATE TABLE `opiekunowie` (
  `IDOpiekuna` int(11) NOT NULL,
  `Imie` varchar(32) NOT NULL,
  `Nazwisko` varchar(32) NOT NULL,
  `IDUcznia` int(11) NOT NULL DEFAULT '1',
  `IDAdresu` int(11) NOT NULL DEFAULT '1'
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
  `Nazwa` varchar(32) NOT NULL
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
  ADD KEY `IDUcznia` (`IDUcznia`);

--
-- Indexes for table `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD PRIMARY KEY (`IDOpiekuna`),
  ADD KEY `IDUcznia` (`IDUcznia`),
  ADD KEY `IDAdresu` (`IDAdresu`);

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
  ADD KEY `IDKlasy` (`IDKlasy`);

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
  MODIFY `IDNauczyciela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  MODIFY `IDOpiekuna` int(11) NOT NULL AUTO_INCREMENT;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
