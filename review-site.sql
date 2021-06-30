-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 30 2021 г., 18:07
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `review-site`
--

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

CREATE TABLE `companies` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Logo` varchar(200) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`ID`, `Name`, `Logo`, `Description`) VALUES
(1, 'Company1', 'qqq', 'Company1 is AMAZING!!!'),
(2, 'Company2', 'rrr', 'Company2 is boring(((');

-- --------------------------------------------------------

--
-- Структура таблицы `companies-reviews`
--

CREATE TABLE `companies-reviews` (
  `ID` int(11) NOT NULL,
  `Company_ID` int(11) NOT NULL,
  `Review_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `companies-reviews`
--

INSERT INTO `companies-reviews` (`ID`, `Company_ID`, `Review_ID`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `ID` int(11) NOT NULL,
  `User_name` text NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`ID`, `User_name`, `Photo`, `Review_text`) VALUES
(1, 'Barinov Ilya Petrovich', 'fff', 'Everything was cool!!!!'),
(2, 'Koluchiy Ivan Borisovich', 'jjj', 'I didn\'t like it(');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `companies-reviews`
--
ALTER TABLE `companies-reviews`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Index_1` (`Company_ID`),
  ADD KEY `Index_2` (`Review_ID`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `companies-reviews`
--
ALTER TABLE `companies-reviews`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `companies-reviews`
--
ALTER TABLE `companies-reviews`
  ADD CONSTRAINT `companies-reviews_ibfk_1` FOREIGN KEY (`Review_ID`) REFERENCES `reviews` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `companies-reviews_ibfk_2` FOREIGN KEY (`Company_ID`) REFERENCES `companies` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
