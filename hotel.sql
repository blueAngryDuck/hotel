-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 22, 2023 at 01:40 PM
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
  `ilość_osób` int(2) DEFAULT NULL,
  `e_mail` varchar(255) NOT NULL,
  `telefon` varchar(11) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imię`, `nazwisko`, `ilość_osób`, `e_mail`, `telefon`, `adres`) VALUES
(1, 'Jan', 'Kowal', 2, 'j.kow@gmail.com', '987456321', '50-505 Wrocław'),
(2, 'Inna', 'Dyakonova', 2, 'inda@gmail.com', '678556798', '678 fgh'),
(3, 'Valentin', 'Makiewić', 1, 'ghj765@gmail.com', '789456432', '876-67 Wrocław'),
(4, 'Łukasz', 'Kowalski', NULL, 'lukasz@h.com', '346467842', '54-789 Legnica'),
(6, 'Damian', 'Kot', NULL, 'dkot@home.com', '555777666', '0'),
(15, 'imie', 'nazwisko', NULL, 'imnz@gmail.com', '12345789', 'Fabryczna 14, 50-000 Wrocław'),
(16, 'imie', 'nazwisko', NULL, 'imnz@gmail.com', '12345789', 'Fabryczna 14, 50-000 Wrocław'),
(17, 'imie', 'nazwisko', NULL, 'imnz@gmail.com', '12345789', 'Fabryczna 14, 50-000 Wrocław');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `cena` int(10) NOT NULL,
  `dostępność` bit(1) NOT NULL DEFAULT current_timestamp(),
  `rodzaj_pokoju` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pokoje`
--

INSERT INTO `pokoje` (`id`, `nazwa`, `cena`, `dostępność`, `rodzaj_pokoju`) VALUES
(1, 'jednoosobowy', 100, b'1', 'standart'),
(2, 'dwuosobowy', 130, b'1', 'standart'),
(3, 'rodzinny', 150, b'1', 'standart'),
(4, 'rodzinny', 200, b'1', 'standart'),
(5, 'deluxe', 250, b'1', 'deluxe'),
(6, 'deluxe', 250, b'1', 'deluxe'),
(7, 'jednoosobowy', 100, b'1', 'standart'),
(8, 'dwuosobowy', 230, b'1', 'deluxe');

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
-- Struktura tabeli dla tabeli `płatność`
--

CREATE TABLE `płatność` (
  `id` int(11) NOT NULL,
  `id_rezerwacji` int(11) DEFAULT NULL,
  `status_płtności` bit(1) DEFAULT current_timestamp(),
  `data_płatności` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklamacji`
--

CREATE TABLE `reklamacji` (
  `id` int(11) NOT NULL,
  `id_pracownika` int(11) NOT NULL,
  `opis` text NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `status_reklamacji` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `reklamacji`
--

INSERT INTO `reklamacji` (`id`, `id_pracownika`, `opis`, `id_klienta`, `status_reklamacji`) VALUES
(4, 0, 'uhc uchniuu ojchu', 4, 0),
(5, 0, 'Nie udało mi się zarezerwować pokój', 5, 0),
(7, 0, 'cos tam ', 4, 0),
(8, 0, 'składam reklamacje', 6, 0),
(9, 0, 'już złożyłem reklamacje', 6, 0),
(10, 0, 'już złożyłem reklamacje', 6, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE `rezerwacja` (
  `id` int(11) NOT NULL,
  `id_pokoju` int(11) NOT NULL,
  `rezerwacja_od` date NOT NULL,
  `rezerwacja_do` date NOT NULL,
  `id_pracownika` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `rezerwacja`
--

INSERT INTO `rezerwacja` (`id`, `id_pokoju`, `rezerwacja_od`, `rezerwacja_do`, `id_pracownika`, `id_klienta`) VALUES
(1, 1, '2023-10-19', '2023-10-21', 2, 4),
(10, 7, '2023-10-29', '2023-10-31', 2, 15),
(11, 8, '2023-10-29', '2023-10-30', 2, 16),
(12, 8, '2023-10-29', '2023-10-30', 2, 17);

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
-- Indeksy dla tabeli `płatność`
--
ALTER TABLE `płatność`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rezerwacji` (`id_rezerwacji`);

--
-- Indeksy dla tabeli `reklamacji`
--
ALTER TABLE `reklamacji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pracownika` (`id_pracownika`),
  ADD KEY `id_klienta` (`id_klienta`) USING BTREE;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

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
