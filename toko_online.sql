-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 10:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(3, 'Laptop', 'Laptop ucus', 'Elektronik', 6500000, 4, 'laptop.jpg'),
(6, 'Samsung Galaxy A50', 'Samsung Galaxy A20', 'Elektronik', 370000000, 3, 'hp.jpg'),
(14, 'Jam Tangan', 'Jam Tangan Asli', 'Pakaian Pria', 400000, 30, 'jam2.jpg'),
(15, 'Blouse', 'Blouse Aesthetic', 'Pakaian Wanita', 300000, 5, 'blouse.jpg'),
(20, 'Seragam Sekolah', 'Seragam Model Jepang', 'Pakaian Anak-anak', 300000, 5, 'seifuku3.jpg'),
(21, 'Carrier', 'Tas Gunung', 'Peralatan Olahraga', 1500000, 6, 'carrier.jpg'),
(28, 'Treadmil', 'Khusus Indoor', 'Peralatan Olahraga', 500000, 8, 'treadmil1.jpg'),
(29, 'Baju Tidur Anak', 'Baju Tidur tipe wool', 'Pakaian Anak-anak', 50000, 100, 'Baju_Tidur_Anak1.jpg'),
(30, 'Kemeja Pria', 'Kemeja Sehari-hari', 'Pakaian Pria', 250000, 6, 'kemeja_pria1.jpg'),
(32, 'Kemeja Wanita', 'Coklat Susu', 'Pakaian Wanita', 500000, 2, 'kemeja.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(5, 'Ifan Prihandi', 'Meruya', '2022-11-21 18:25:52', '2022-11-22 18:25:52'),
(6, 'Alkam Fariz', 'Grogol', '2022-11-21 18:27:10', '2022-11-22 18:27:10'),
(7, 'Ifan Prihandi', 'Grogol', '2022-11-22 21:49:02', '2022-11-23 21:49:02'),
(8, 'Ifan Prihandi', 'Grogol', '2022-11-22 22:09:15', '2022-11-23 22:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 3, 3, 'Laptop', 1, 6500000, ''),
(2, 3, 15, 'Blouse', 1, 300000, ''),
(3, 4, 6, 'Samsung Galaxy A50', 1, 370000000, ''),
(4, 4, 14, 'Jam Tangan', 1, 400000, ''),
(5, 5, 3, 'Laptop', 1, 6500000, ''),
(6, 5, 14, 'Jam Tangan', 1, 400000, ''),
(7, 6, 6, 'Samsung Galaxy A50', 1, 370000000, ''),
(8, 7, 3, 'Laptop', 1, 6500000, ''),
(9, 8, 6, 'Samsung Galaxy A50', 1, 370000000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(2, 'admin', 'admin', '123', 1),
(4, 'Test User', 'User', '123', 2),
(5, 'Test User 2', 'user2', '1234', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
