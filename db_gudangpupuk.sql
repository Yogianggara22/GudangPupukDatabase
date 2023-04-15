-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 10.24
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gudangpupuk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('root', 'root');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ barang_pupuk`
--

CREATE TABLE `tb_ barang_pupuk` (
  `Kode_Jenis_Pupuk` varchar(5) NOT NULL,
  `Jenis_Pupuk` varchar(15) NOT NULL,
  `ID_Pegawai` varchar(10) NOT NULL,
  `Kode_Pupuk_Masuk` varchar(10) NOT NULL,
  `Kode_Gudang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gudang`
--

CREATE TABLE `tb_gudang` (
  `Kode_Gudang` varchar(10) NOT NULL,
  `ID_Karyawan_Gudang` varchar(10) NOT NULL,
  `Stock_Semua_Pupuk` int(11) NOT NULL,
  `Jumlah_Pupuk_Masuk` int(11) NOT NULL,
  `Jumlah_Pupuk_Keluar` int(11) NOT NULL,
  `Kode_Pupuk_Keluar` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_karyawan_gudang`
--

CREATE TABLE `tb_karyawan_gudang` (
  `ID_Karyawan_Gudang` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telephone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kendaraan_truk`
--

CREATE TABLE `tb_kendaraan_truk` (
  `Kode_Truk` varchar(10) NOT NULL,
  `Jumlah_Truk_Tersedia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet_toko`
--

CREATE TABLE `tb_outlet_toko` (
  `No_Antrian` varchar(5) NOT NULL,
  `Alamat_Penerima` text NOT NULL,
  `Jumlah_Pupuk_Dipesan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `ID_Pegawai` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telephone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `Kode_Pengiriman` varchar(10) NOT NULL,
  `ID_Supir` varchar(10) NOT NULL,
  `Kode_Truk` varchar(10) NOT NULL,
  `No_Antrian` varchar(5) NOT NULL,
  `Tanggal_Pengiriman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pupuk_keluar`
--

CREATE TABLE `tb_pupuk_keluar` (
  `Kode_Pupuk_Keluar` varchar(10) NOT NULL,
  `Jenis_Pupuk` varchar(15) NOT NULL,
  `Jumlah_Pupuk_Keluar` int(11) NOT NULL,
  `Kode_Pengiriman` varchar(10) NOT NULL,
  `Tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pupuk_masuk`
--

CREATE TABLE `tb_pupuk_masuk` (
  `Kode_Pupuk_Masuk` varchar(10) NOT NULL,
  `Jenis_Pupuk` varchar(15) NOT NULL,
  `Jumlah_Pupuk_Masuk` int(11) NOT NULL,
  `Tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supir_pengirim`
--

CREATE TABLE `tb_supir_pengirim` (
  `ID_Supir` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Telephone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_ barang_pupuk`
--
ALTER TABLE `tb_ barang_pupuk`
  ADD PRIMARY KEY (`Kode_Jenis_Pupuk`),
  ADD KEY `Kode_Pupuk_Masuk` (`Kode_Pupuk_Masuk`),
  ADD KEY `Kode_Gudang` (`Kode_Gudang`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indeks untuk tabel `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD PRIMARY KEY (`Kode_Gudang`),
  ADD KEY `ID_Karyawan_Gudang` (`ID_Karyawan_Gudang`,`Kode_Pupuk_Keluar`),
  ADD KEY `Kode_Pupuk_Keluar` (`Kode_Pupuk_Keluar`);

--
-- Indeks untuk tabel `tb_karyawan_gudang`
--
ALTER TABLE `tb_karyawan_gudang`
  ADD PRIMARY KEY (`ID_Karyawan_Gudang`);

--
-- Indeks untuk tabel `tb_kendaraan_truk`
--
ALTER TABLE `tb_kendaraan_truk`
  ADD PRIMARY KEY (`Kode_Truk`);

--
-- Indeks untuk tabel `tb_outlet_toko`
--
ALTER TABLE `tb_outlet_toko`
  ADD PRIMARY KEY (`No_Antrian`);

--
-- Indeks untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`ID_Pegawai`);

--
-- Indeks untuk tabel `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`Kode_Pengiriman`),
  ADD KEY `Kode_Truk` (`Kode_Truk`,`No_Antrian`),
  ADD KEY `No_Antrian` (`No_Antrian`),
  ADD KEY `ID_Supir` (`ID_Supir`);

--
-- Indeks untuk tabel `tb_pupuk_keluar`
--
ALTER TABLE `tb_pupuk_keluar`
  ADD PRIMARY KEY (`Kode_Pupuk_Keluar`),
  ADD KEY `Kode_Pengiriman` (`Kode_Pengiriman`);

--
-- Indeks untuk tabel `tb_pupuk_masuk`
--
ALTER TABLE `tb_pupuk_masuk`
  ADD PRIMARY KEY (`Kode_Pupuk_Masuk`);

--
-- Indeks untuk tabel `tb_supir_pengirim`
--
ALTER TABLE `tb_supir_pengirim`
  ADD PRIMARY KEY (`ID_Supir`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_ barang_pupuk`
--
ALTER TABLE `tb_ barang_pupuk`
  ADD CONSTRAINT `tb_ barang_pupuk_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_Pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ barang_pupuk_ibfk_2` FOREIGN KEY (`Kode_Pupuk_Masuk`) REFERENCES `tb_pupuk_masuk` (`Kode_Pupuk_Masuk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ barang_pupuk_ibfk_3` FOREIGN KEY (`Kode_Gudang`) REFERENCES `tb_gudang` (`Kode_Gudang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD CONSTRAINT `tb_gudang_ibfk_1` FOREIGN KEY (`Kode_Pupuk_Keluar`) REFERENCES `tb_pupuk_keluar` (`Kode_Pupuk_Keluar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_gudang_ibfk_2` FOREIGN KEY (`ID_Karyawan_Gudang`) REFERENCES `tb_karyawan_gudang` (`ID_Karyawan_Gudang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD CONSTRAINT `tb_pengiriman_ibfk_1` FOREIGN KEY (`No_Antrian`) REFERENCES `tb_outlet_toko` (`No_Antrian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pengiriman_ibfk_2` FOREIGN KEY (`Kode_Truk`) REFERENCES `tb_kendaraan_truk` (`Kode_Truk`),
  ADD CONSTRAINT `tb_pengiriman_ibfk_3` FOREIGN KEY (`ID_Supir`) REFERENCES `tb_supir_pengirim` (`ID_Supir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pupuk_keluar`
--
ALTER TABLE `tb_pupuk_keluar`
  ADD CONSTRAINT `tb_pupuk_keluar_ibfk_1` FOREIGN KEY (`Kode_Pengiriman`) REFERENCES `tb_pengiriman` (`Kode_Pengiriman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
