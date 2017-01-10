-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 10 Oca 2017, 22:00:14
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `gulselsaglik`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hastalar`
--

CREATE TABLE IF NOT EXISTS `hastalar` (
  `ts` int(10) NOT NULL,
  `ad` tinytext COLLATE utf8_turkish_ci NOT NULL,
  `soyad` tinytext COLLATE utf8_turkish_ci NOT NULL,
  `eklenme_gunu` date NOT NULL,
  `iletisim` tinytext COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hastalar`
--

INSERT INTO `hastalar` (`ts`, `ad`, `soyad`, `eklenme_gunu`, `iletisim`) VALUES
(1, 'Mehmet', 'Yılmaz', '2017-01-09', 'mehmet.yilmaz@gmail.com'),
(2, 'Duru', 'Demirayak', '2017-01-08', 'Duru.demirayak@gmail.com'),
(3, 'Akın', 'Sularakın', '2017-01-04', 'akin.sularakin@gmail.com'),
(4, 'Tekin', 'Gültekin', '2017-01-03', 'tekin.gultekin@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hekim_hasta`
--

CREATE TABLE IF NOT EXISTS `hekim_hasta` (
  `kullanıcı_ts` int(11) NOT NULL,
  `hasta_ts` int(11) NOT NULL,
  `im` datetime NOT NULL,
  `gorusme_turu` tinytext COLLATE utf8_turkish_ci NOT NULL,
  KEY `kullanıcı_ts` (`kullanıcı_ts`),
  KEY `hasta_ts` (`hasta_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hekim_hasta`
--

INSERT INTO `hekim_hasta` (`kullanıcı_ts`, `hasta_ts`, `im`, `gorusme_turu`) VALUES
(1, 2, '2017-01-10 11:00:00', 'olağan görüşme'),
(1, 3, '2017-01-10 12:00:00', 'işlem görecek'),
(1, 1, '2017-01-10 18:00:00', 'sonuç gösterme'),
(1, 4, '2017-01-11 08:00:00', 'kan verme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `ts` int(4) NOT NULL,
  `eposta` tinytext COLLATE utf8mb4_turkish_ci NOT NULL,
  `acarsoz` tinytext COLLATE utf8mb4_turkish_ci NOT NULL,
  `kayitgunu` date NOT NULL,
  `ad` tinytext COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`ts`, `eposta`, `acarsoz`, `kayitgunu`, `ad`) VALUES
(1, 'can@gmail.com', '123456', '2016-12-24', 'can'),
(2, 'cem@gmail.com', '123456', '2016-12-24', 'cem');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `hekim_hasta`
--
ALTER TABLE `hekim_hasta`
  ADD CONSTRAINT `hekim_hasta_ibfk_2` FOREIGN KEY (`hasta_ts`) REFERENCES `hastalar` (`ts`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hekim_hasta_ibfk_1` FOREIGN KEY (`kullanıcı_ts`) REFERENCES `kullanicilar` (`ts`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
