-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21 Jun 2019 pada 14.40
-- Versi Server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_persediaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_keluar`
--

CREATE TABLE IF NOT EXISTS `detail_keluar` (
  `kd_transaksi` char(15) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `kd_barang` char(7) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  PRIMARY KEY (`kd_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_keluar`
--

INSERT INTO `detail_keluar` (`kd_transaksi`, `tanggal_keluar`, `kd_barang`, `jumlah_keluar`, `harga`, `sub_total`) VALUES
('', '0000-00-00', 'B000001', 1, 1000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_masuk`
--

CREATE TABLE IF NOT EXISTS `detail_masuk` (
  `kd_transaksi` char(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kd_barang` char(7) NOT NULL,
  `kd_supplier` char(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  PRIMARY KEY (`kd_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_masuk`
--

INSERT INTO `detail_masuk` (`kd_transaksi`, `tanggal_masuk`, `kd_barang`, `kd_supplier`, `jumlah_masuk`, `harga`, `sub_total`) VALUES
('111', '2019-06-19', 'B000001', 'S000003', 1, 1000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang_keluar`
--

CREATE TABLE IF NOT EXISTS `tb_barang_keluar` (
  `kd_transaksi` char(15) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `sub_total` int(11) NOT NULL,
  `created_user` int(2) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kd_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_barang_keluar`
--

INSERT INTO `tb_barang_keluar` (`kd_transaksi`, `tanggal_keluar`, `sub_total`, `created_user`, `created_date`) VALUES
('111', '2019-06-20', 1000, 0, '2019-06-19 17:02:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang_masuk`
--

CREATE TABLE IF NOT EXISTS `tb_barang_masuk` (
  `kd_transaksi` char(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `sub_total` int(11) NOT NULL,
  `created_user` int(2) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kd_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`kd_transaksi`, `tanggal_masuk`, `sub_total`, `created_user`, `created_date`) VALUES
('111', '2019-06-19', 100000, 0, '2019-06-19 14:42:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pakaian`
--

CREATE TABLE IF NOT EXISTS `tb_pakaian` (
  `kd_barang` char(7) NOT NULL DEFAULT '',
  `kd_supplier` char(7) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `kategori` enum('Blouse','Gamis','Brukat','Pakaian Anak','Sarimbit') NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stok` int(5) NOT NULL,
  `created_user` int(2) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` int(2) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kd_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pakaian`
--

INSERT INTO `tb_pakaian` (`kd_barang`, `kd_supplier`, `nama_barang`, `kategori`, `harga_beli`, `harga_jual`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`) VALUES
('B000001', 'S000004', '1a', 'Blouse', 11, 11, 0, 4, '2019-06-02 15:00:44', 4, '2019-06-02 15:00:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peramalan`
--

CREATE TABLE IF NOT EXISTS `tb_peramalan` (
  `id_peramalan` int(2) NOT NULL AUTO_INCREMENT,
  `bulan_peramalan` varchar(8) NOT NULL,
  `jenis` enum('Blouse','Pakaian Anak','Gamis','Brukat','Sarimbit') NOT NULL,
  `hasil_peramalan` int(3) NOT NULL,
  PRIMARY KEY (`id_peramalan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE IF NOT EXISTS `tb_supplier` (
  `kd_supplier` char(7) NOT NULL DEFAULT '',
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(50) NOT NULL,
  `no_hp` char(12) NOT NULL,
  PRIMARY KEY (`kd_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`kd_supplier`, `nama_supplier`, `alamat_supplier`, `no_hp`) VALUES
('S000002', 'Mega Busana', 'pkl', '081910298990'),
('S000003', 'Dapyuna', 'bdg', '0192736'),
('S000004', 'Batik Sari', 'Pekalongan', '081933');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `id_user` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `telepon` char(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Admin','Manajer','','') NOT NULL,
  `status` enum('aktif','blokir') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `telepon`, `foto`, `hak_akses`, `status`, `created_at`, `updated_at`) VALUES
(3, 'manajer', '69b731ea8f289cf16a192ce78a37b4f0', 'a', '085865524558', 'user-default.png', 'Manajer', 'blokir', '2019-03-24 03:27:25', '2019-05-03 13:46:53'),
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator', '08531420000', 'user-default.png', 'Admin', 'aktif', '2019-03-24 03:27:25', '2019-05-08 05:09:17'),
(5, 'pemilik', '58399557dae3c60e23c78606771dfa3d', 'pemilik', '08191290920', NULL, 'Manajer', 'aktif', '2019-04-05 02:07:56', '2019-05-03 13:46:49');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
