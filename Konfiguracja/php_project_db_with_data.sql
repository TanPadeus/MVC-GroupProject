-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Cze 2020, 16:54
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `php_project_db`
--
CREATE DATABASE IF NOT EXISTS `php_project_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `php_project_db`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `news`
--

INSERT INTO `news` (`id`, `author_id`, `title`, `slug`, `summary`, `content`, `published_at`) VALUES
(1, 1, 'Kotki', 'kotki', 'Uwielbiam kotki.', 'Kotki są bardzo słodkie, szczególnie jak są małe. Są to bardzo mądre zwierzaki.', '2020-06-23 16:51:56'),
(2, 1, 'Symfony', 'symfony', 'Ocena symfony.', 'Symfony jest bardzo ciekawym frameworkiem, intuicyjnym oraz zdecydowanie przyspieszającym czas pracy.', '2020-06-23 16:52:32'),
(3, 1, 'Praca Zdalna', 'praca-zdalna', 'Ocena pracy zdalnej na SGGW.', 'Praca zdalna była bardzo dobra, pozwalała na lepsze warunki do nauki oraz sprawiła, że ludzie nie tracili czasu na dojazdy.', '2020-06-23 16:52:54');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_files_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `projects`
--

INSERT INTO `projects` (`id`, `author_id`, `title`, `slug`, `summary`, `content`, `image`, `project_files_name`, `published_at`, `updated_at`) VALUES
(2, 1, 'Serwis internetowy \"Our Projects\"', 'serwis-internetowy-our-projects', 'Serwis internetowy oparty na Symfony PHP, czyli dokładnie ta strona na której wyświetla się w tym momencie ten komunikat.', 'Strona została zrobiona potrzeby zaliczenia przedmiotu na studiach \"Serwisy internetowe PHP\". Wykonana została poprzez użycie frameworku Symfony.\r\n\r\nAplikacja internetowa służy do umieszczania projektów (z ich statusami oraz możliwością pobrania), posiadająca wyszukiwarkę zawężającą listę projektów działającą na zasadzie słów kluczowych (tagów) przypisanych do poszczególnych projektów.\r\n\r\n<h4>Autorzy</h4>\r\n<ul class=\"list-group list-group-flush grow\">\r\n<li>Artur Wenda</li>\r\n<li>Maciej Moryń</li>\r\n</ul>\r\n\r\n<h3><a href=\"https://github.com/TanPadeus/MVC-GroupProject\">Link do projektu github</a></h3>', NULL, NULL, '2020-06-23 16:14:25', NULL),
(3, 1, 'Gra mobilna na platformę android \"Endless Runner\"', 'gra-mobilna-na-platforme-android-endless-runner', 'Gra mobilna bazowana na popularnej grze \"Geometry Dash\" pisana w pythonie. Modułowe nieskończone poziomy wraz z systemem najwyższych poziomów. Możliwa do uruchomienia na Androidzie oraz Windowsie!', 'Projekt został rozpoczęty jako zaliczenie przedmiotu na studiach \"Programowanie Komponentowe\". Głównym celem było napisanie gry mobilnej używając języka Python. Żeby to osiągnąć użyliśmy Kivy framework który jest open source biblioteką do pythona pozwalającą pisać aplikacje na różne platformy. Pomysł na grę był bazowany na popularnej grze \"Geometry Dash\"\r\n\r\nGra jest bardzo prosta, jedynym celem jest przetrwać jak najdłużej, a jak sama nazwa wskazuje gra nie ma końca. Gracz zdobywa punkty podczas gry wraz z upływem czasu ale gra także staje się coraz trudniejsza. Po przegranej na koniec można wpisać swój wynik na listę najlepszych wyników jeżeli osiągnęło się ich wystarczającą ilość.\r\n\r\nGra została zaprojektowana tak żeby przeszkody były modułami co pozwala dodawać/edytować przeszkody nawet w notatniku. W grze nie ma poziomów, poszczególne przeszkody są wczytywane losowo aż gracz przegra.\r\n\r\n<h4>Autorzy</h4>\r\n<ul class=\"list-group list-group-flush grow\">\r\n<li>Artur Wenda</li>\r\n<li>Maciej Moryń</li>\r\n<li>Kamil Chmielewski</li>\r\n<li>Paulina Osińska (Grafika)</li>\r\n</ul>', 'endlessrunner-5ef2152a0e9b4148250300.jpg', 'endlessrunner-exe-5ef2152a1e8a5662808150.rar', '2020-06-23 16:31:44', '2020-06-23 16:43:54'),
(4, 1, 'Gra mobilna \"Codname-G\" pisana w Unity', 'gra-mobilna-codname-g-pisana-w-unity', 'Oryginalny pomysł na grę zręcznościowo-logiczną stworzoną w zespole na studiach. Gra pisana głównie na platformę android z możliwością budowy na ios.', 'Projekt został rozpoczęty jako zaliczenie przedmiotu na studiach \"Projekt zespołowy\". Głównym celem było napisanie gry mobilnej w małym zespole używając Silnika Gier Unity. Główną platformą docelową jest był androib ale dzięki wybranemu silnikowi bardzo łatwo można zmodyfikować projekt żeby działał na urządzeniach ios. Po skończeniu projektu na studiach oraz otrzymaniu ocey planujemy dopracować projekt i wypuścic go do app stora.\r\n\r\nGra jest połączeniem zręcznościówka z grą logiczną. Gracz ma za zadanie przesuwać swoim awatarem w taki sposób żeby dotrzeć do wyznaczonego miejsca jednocześnie unikając przeszkód. Za każdym razem kiedy jego awatar się nie porusza może wybrać kierunek ruchu, ale po wybraniu awatar będzie się poruszał aż coś będzie blokować mu drogę. ta mechanika zmusza gracza do znalezienia najlepszej trasy do celu jednocześnie uważając na przeciwników którzy chcą zabić gracza zmuszając go do powrotu na pozycję startową.\r\n\r\nGra została napisana w taki sposób żeby ułatwić przyszły rozwój. Poziomy są zapisywane jako pliki binarne które mogą zostać wczytane podczas działania gry co umożliwia stworzenie edytora poziomów dla graczy.\r\n\r\n<h4>Autorzy</h4>\r\n<ul class=\"list-group list-group-flush grow\">\r\n<li>Artur Wenda</li>\r\n<li>Maciej Moryń</li>\r\n<li>Aleksandra Rawicz-Galińska</li>\r\n<li>Małgorzata Wieteska</li>\r\n</ul>', 'codenameg-5ef216b440b54596219808.png', 'codename-g-v0.3-5ef216b4437a6024825196.apk', '2020-06-23 16:44:39', '2020-06-23 16:50:28');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `project_tag`
--

CREATE TABLE `project_tag` (
  `project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `project_tag`
--

INSERT INTO `project_tag` (`project_id`, `tag_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 3),
(3, 4),
(3, 5),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 3),
(4, 4),
(4, 5),
(4, 7),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(12, 'Alpha'),
(7, 'Android'),
(4, 'Artur Wenda'),
(15, 'C#'),
(3, 'Finished'),
(11, 'Gry Komputerowe'),
(14, 'iOS'),
(10, 'Kivy'),
(5, 'Maciej Moryń'),
(2, 'MVC'),
(6, 'PHP'),
(9, 'Python'),
(1, 'Symfony'),
(13, 'Unity'),
(8, 'Windows');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `password`, `roles`) VALUES
(1, 'admin', 'admin', 'admin@admin', '$argon2id$v=19$m=65536,t=4,p=1$SzhpTGJaTFR1WGRXYm54Rg$dT9P0byJNKg5xJoEXKEWSgN6gQxuq2GqU78RIUHc3Yg', '[\"ROLE_ADMIN\"]');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962AF675F31B` (`author_id`),
  ADD KEY `IDX_5F9E962A166D1F9C` (`project_id`);

--
-- Indeksy dla tabeli `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1DD39950F675F31B` (`author_id`);

--
-- Indeksy dla tabeli `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5C93B3A4F675F31B` (`author_id`);

--
-- Indeksy dla tabeli `project_tag`
--
ALTER TABLE `project_tag`
  ADD PRIMARY KEY (`project_id`,`tag_id`),
  ADD KEY `IDX_91F26D60166D1F9C` (`project_id`),
  ADD KEY `IDX_91F26D60BAD26311` (`tag_id`);

--
-- Indeksy dla tabeli `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6FBC94265E237E06` (`name`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `FK_5F9E962AF675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_1DD39950F675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `FK_5C93B3A4F675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `project_tag`
--
ALTER TABLE `project_tag`
  ADD CONSTRAINT `FK_91F26D60166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_91F26D60BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
