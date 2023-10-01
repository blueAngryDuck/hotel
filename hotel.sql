-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 29, 2023 at 10:53 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imię` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `ilość_osób` int(2) NOT NULL,
  `e-mail` varchar(255) NOT NULL,
  `telefon` int(9) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `cena` int(10) NOT NULL,
  `dostępność` bit(1) NOT NULL DEFAULT current_timestamp(),
  `max_ilość_osób` int(2) DEFAULT NULL,
  `rodzaj_pokoju` varchar(255) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `piętro` int(1) DEFAULT NULL,
  `zdjęcia` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pokoje`
--

INSERT INTO `pokoje` (`id`, `nazwa`, `cena`, `dostępność`, `max_ilość_osób`, `rodzaj_pokoju`, `opis`, `piętro`, `zdjęcia`) VALUES
(1, 'solo', 100, b'1', 1, 'standart', 'Komfortowy pokój dla jednej osoby. Znajduje się na czwartym piętrze ze strony parku.\nCena za pokój standardowy obejmuje śniadanie.', 4, ''),
(2, 'para', 130, b'1', 2, 'standart', 'Komfortowy pokój dla pary. Znajduje się na czwartym piętrze ze strony wewnętrznego dziedzińca. Pokój ma balkon.\nCena za pokój standardowy obejmuje śniadanie.', 4, ''),
(3, 'rodzina', 150, b'1', 4, 'standart', 'Przestronny pokój, w którym może nocować nawet do 4 osób w komfortowych warunkach. Pokój jest podzielony na dwie przestrzeni dla rodziców i maksymalnie dwóch dzieci do 16 lat. Znajduje się na trzecim piętrze ze strony parku.\r\nIdealny wybór dla osób podróżujących rodziną.\r\nCena za pokój standardowy obejmuje śniadanie.', 3, ''),
(4, 'rodzina', 160, b'1', 5, 'standart', 'Przestronny pokój, w którym może nocować nawet do 5 osób w komfortowych warunkach. Pokój jest podzielony na dwie przestrzeni dla rodziców i maksymalnie trzech dzieci do 16 lat, ma balkon oraz powiększoną łazienkę. Znajduje się na trzecim piętrze ze strony wewnętrznego dziedzińca.\nIdealny wybór dla osób podróżujących dużą rodziną.\nCena za pokój standardowy obejmuje śniadanie.', 3, ''),
(5, 'rodzina', 250, b'1', 3, 'deluxe', 'Przestronny pokój o podwyższonym standardzie dla rodziny do trzech osób. Znajduje się na piątym piętrze ze strony wewnętrznego dziedzińca.\r\nPokój jest podzielony na dwie przestrzeni dla rodziców i dziecka do 16 lat. Ma balkon, dużą wannę i nielimitowany mini-bar.\r\nCena za pokój deluxe obejmuje śniadanie i zniżkę 70% na wszystkie dania w restauracji.', 5, ''),
(6, 'solo', 180, b'1', 1, 'deluxe', 'Pokój o podwyższonym standardzie dla jednej osoby. Znajduje się na piątym piętrze ze strony wewnętrznego dziedzińca. Zawiera balkon, dużą wannę i nielimitowany mini-bar.\r\nCena za pokój deluxe obejmuje śniadanie i zniżkę 70% na wszystkie dania w restauracji.', 5, ''),
(7, 'dwuosobowy', 100, b'1', 2, 'ekonomiczny', 'Komfortowy pokój dla dwóch osób. Znajduje się na drugim piętrze ze strony parku.\r\nCena za pokój standardowy obejmuje śniadanie.', 2, ''),
(8, 'para', 230, b'1', 2, 'deluxe', 'Pokój o podwyższonym standardzie dla pary. Znajduje się na piątym piętrze ze strony parku, ma piękny widok na góry. Zawiera balkon, dużą wannę i nielimitowany mini-bar.\r\nCena za pokój deluxe obejmuje śniadanie i zniżkę 70% na wszystkie dania w restauracji.', 5, ''),
(9, 'grupa', 120, b'1', 3, 'ekonomiczny', 'Przestronny pokój, w którym może nocować nawet do 3 osób w komfortowych warunkach. Znajduje się na drugim piętrze ze strony parku.\r\nIdealny wybór dla osób podróżujących grupą.', 2, ''),
(10, 'grupa', 130, b'1', 4, 'ekonomiczny', 'Przestronny pokój, w którym może nocować nawet do 4 osób w komfortowych warunkach. Znajduje się na pierwszym piętrze ze strony parku.\r\nIdealny wybór dla osób podróżujących większą grupą.', 1, ''),
(11, 'grupa', 140, b'1', 5, 'ekonomiczny', 'Przestronny pokój, w którym może nocować nawet do 5 osób w komfortowych warunkach. Pokój jest podzielony na dwie części sypialne, wspólny balkon i łazienkę. Znajduje się na drugim piętrze ze strony wewnętrznego dziedzińca.\r\nIdealny wybór dla osób podróżujących większą grupą.', 2, ''),
(12, 'grupa', 160, b'1', 6, 'ekonomiczny', 'Przestronny pokój, w którym może nocować nawet do 6 osób w komfortowych warunkach. Pokój jest podzielony na dwie części sypialne, wspólny balkon i łazienkę. Znajduje się na pierwszym piętrze ze strony wewnętrznego dziedzińca.\r\nIdealny wybór dla osób podróżujących większą grupą.', 1, ''),
(13, 'rodzina', 200, b'1', 3, 'standart', 'Przestronny pokój, w którym może nocować do 3 osób w komfortowych warunkach. Pokój jest podzielony na dwie przestrzeni dla rodziców i dziecka do 16 lat. Znajduje się na trzecim piętrze ze strony parku.\nIdealny wybór dla osób podróżujących rodziną.\nCena za pokój standardowy obejmuje śniadanie.', 3, ''),
(14, 'solo', 100, b'1', 1, 'standart', 'Komfortowy pokój dla jednej osoby. Znajduje się na czwartym piętrze ze strony wewnętrznego dziedzińca.\nCena za pokój standardowy obejmuje śniadanie.', 4, ''),
(15, 'para', 130, b'1', 2, 'standart', 'Komfortowy pokój dla pary. Znajduje się na czwartym piętrze ze strony wewnętrznego dziedzińca. Pokój ma balkon.\r\nCena za pokój standardowy obejmuje śniadanie.', 4, 0x24327924313024725868717a6372656753386f79397147674e4c6e377539554e346b435a6a63375561364b67496e4a332e79366f777874536c375853);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `imię` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `stanowisko` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` int(9) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `imię`, `nazwisko`, `stanowisko`, `email`, `telefon`, `adres`) VALUES
(1, 'Kamil', 'Wiśniewski', 'manager', 'k.wisniewski@wro.hotel.pl', 98765432, 'Wrocław 51-601'),
(2, 'Michał', 'Grosicki', 'recepcjonista', 'm.grosocki@wro.hotel.pl', 123456789, 'Wrocław 50-505');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklamacji`
--

CREATE TABLE `reklamacji` (
  `id` int(11) NOT NULL,
  `id_rezerwacji` int(11) NOT NULL,
  `id_pracownika` int(11) NOT NULL,
  `opis` text NOT NULL,
  `id_klienta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE `rezerwacja` (
  `id` int(11) NOT NULL,
  `id_pokoju` int(11) NOT NULL,
  `data_rezerwacji` date NOT NULL,
  `id_pracownika` int(11) NOT NULL,
  `długość_rezerwacji` varchar(255) NOT NULL,
  `id_klienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reklamacji`
--
ALTER TABLE `reklamacji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rezerwacji` (`id_rezerwacji`),
  ADD KEY `id_pracownika` (`id_pracownika`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- Indeksy dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pokoju` (`id_pokoju`),
  ADD KEY `id_pracownika` (`id_pracownika`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pokoje`
--
ALTER TABLE `pokoje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reklamacji`
--
ALTER TABLE `reklamacji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reklamacji`
--
ALTER TABLE `reklamacji`
  ADD CONSTRAINT `reklamacji_ibfk_1` FOREIGN KEY (`id_rezerwacji`) REFERENCES `rezerwacja` (`id`),
  ADD CONSTRAINT `reklamacji_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id`),
  ADD CONSTRAINT `reklamacji_ibfk_3` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id`);

--
-- Constraints for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `rezerwacja_ibfk_1` FOREIGN KEY (`id_pokoju`) REFERENCES `pokoje` (`id`),
  ADD CONSTRAINT `rezerwacja_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id`),
  ADD CONSTRAINT `rezerwacja_ibfk_3` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
