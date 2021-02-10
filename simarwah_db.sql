-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2021 at 06:20 PM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simarwah_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota_himpunan`
--

CREATE TABLE `anggota_himpunan` (
  `nim` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_himpunan` varchar(255) NOT NULL,
  `parent_bidang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota_himpunan`
--

INSERT INTO `anggota_himpunan` (`nim`, `nama`, `alamat`, `jenis_kelamin`, `kontak`, `email`, `jabatan`, `create_date`, `parent_himpunan`, `parent_bidang`) VALUES
('11770101', 'Anggota A', 'Bandung', 'L', '08123456789', 'anggotaa@gmail.com', 'KETUA BIDANG', '2021-01-24 14:13:59', 'HIMATIF', 'Bidangseni'),
('117765544', 'Anggota B', 'Bandung', 'P', '081245673290', 'anggotab@gmail.com', 'ANGGOTA', '2021-01-26 07:19:38', 'HIMATIF', 'Bidangmikat');

-- --------------------------------------------------------

--
-- Table structure for table `anggota_ukmukk`
--

CREATE TABLE `anggota_ukmukk` (
  `u_nim` varchar(255) CHARACTER SET latin1 NOT NULL,
  `u_nama` varchar(255) CHARACTER SET latin1 NOT NULL,
  `u_alamat` varchar(255) CHARACTER SET latin1 NOT NULL,
  `u_jeniskelamin` varchar(255) CHARACTER SET latin1 NOT NULL,
  `u_kontak` varchar(255) CHARACTER SET latin1 NOT NULL,
  `u_email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `u_jabatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `parent_ubidang` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bidang_ukmukk`
--

CREATE TABLE `bidang_ukmukk` (
  `kode_ubidang` varchar(255) CHARACTER SET latin1 NOT NULL,
  `label_ubidang` varchar(255) CHARACTER SET latin1 NOT NULL,
  `desc_ubidang` varchar(255) CHARACTER SET latin1 NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `parent_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_kegiatan`
--

CREATE TABLE `daftar_kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(255) NOT NULL,
  `Parent_himpunan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_kegiatan`
--

INSERT INTO `daftar_kegiatan` (`id_kegiatan`, `nama_kegiatan`, `start_date`, `end_date`, `image`, `Parent_himpunan`, `create_date`) VALUES
(1, 'Kegiatan A', '2021-01-18', '2021-01-20', '', 'HIMATIF', '2021-01-24 14:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `kode_fakultas` varchar(255) NOT NULL,
  `nama_fakultas` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `visi` varchar(255) NOT NULL,
  `misi` varchar(255) NOT NULL,
  `parent_univ` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`kode_fakultas`, `nama_fakultas`, `deskripsi`, `visi`, `misi`, `parent_univ`) VALUES
('ADHUM', 'Adab dan Humaniora', '', '', '', NULL),
('DAKOM', 'Dakwah dan Komunikasi', '', '', '', NULL),
('FEBI', 'Ekonomi dan Bisnis Islam', '', '', '', NULL),
('FISIP', 'Ilmu Sosial dan Ilmu Politik', '', '', '', NULL),
('PSIKOLOGI', 'Psikologi', '', '', '', NULL),
('SAINTEK', 'Sains dan Teknologi', 'Fakultas SAINTEK di UIN Bandung', '', '', NULL),
('SYARKUM', 'Syariah dan Hukum', '', '', '', NULL),
('TARBIYAH', 'Tarbiyah dan Keguruan', 'Fakultas Tarbiyah dan Keguruan UIN Sunan Gunung Djati Bandung', '', '', NULL),
('USHULUDDIN', 'Ushuluddin', 'Fakultas yang ada di UIN Sunan Gunung Djati Bandung', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_himpunan` varchar(255) NOT NULL,
  `nama_himpunan` varchar(255) NOT NULL,
  `desc_himpunan` varchar(255) NOT NULL,
  `visi` varchar(255) NOT NULL,
  `misi` varchar(255) NOT NULL,
  `jml_mhsaktif` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `parent_fakultas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_himpunan`, `nama_himpunan`, `desc_himpunan`, `visi`, `misi`, `jml_mhsaktif`, `image`, `parent_fakultas`) VALUES
('DEMAFADHUM', 'DEMAF', 'Dewan Mahasiswa Fakultas Adab dan Humaniora', '', '', 0, 'a86f765d83b07363198dd08bd675d7bc.png', 'ADHUM'),
('DEMAFDAKOM', 'DEMAF', 'Dewan Mahasiswa Fakultas Dakwah dan Komunikasi', '', '', 0, '77342efe2e19cecf988302e77c51bef6.png', 'DAKOM'),
('DEMAFFEBI', 'DEMAF', 'Dewan Mahasiswa Fakultas Ekonomi dan Bisnis Islam', '', '', 0, '2f6f22cb3fd49a97b54ca762a12d716c.png', 'FEBI'),
('DEMAFFISIP', 'DEMAF', 'Dewan Mahasiswa Fakultas Ilmu Sosial dan Ilmu Politik', '', '', 0, '18150225cb1a3a8676ad0410bf2d40d8.png', 'FISIP'),
('DEMAFPSIKOLOGI', 'DEMAF', 'Dewan Mahasiswa Fakultas Psikologi', '', '', 0, '9e8a2bc8032b1810da4272f2097bb688.png', 'PSIKOLOGI'),
('DEMAFSAINTEK', 'DEMAF', 'Dewan Mahasiswa Fakultas Sains dan Teknologi ', '', '', 0, '3f017563eeb838f2c518967e8c399292.png', 'SAINTEK'),
('DEMAFSYARKUM', 'DEMAF', 'Dewan Mahasiswa Fakultas Syariah dan Hukum', '', '', 0, 'b41402cdf84e51c1c9f35f6427e2a63e.png', 'SYARKUM'),
('DEMAFTARBIYAH', 'DEMAF', 'Dewan Mahasiswa Fakultas Tarbiyah dan Keguruan', '', '', 0, '6689a042df8c2ac9b9af103e6c3e9fb0.png', 'TARBIYAH'),
('DEMAFUSHULUDDIN', 'DEMAF', 'Dewan Mahasiswa Fakultas Ushuluddin', '', '', 0, '530e977b84deb011ed82e08e833747cb.png', 'USHULUDDIN'),
('DEMAU', 'DEMA-U', 'Dewan Mahasiswa Universitas', '', '', 0, '28312397e5ff4fee9b09c4308717e93e.jpg', NULL),
('HIMATIF', 'Teknik Informatika', 'Himpunan Mahasiswa Teknik Informatika', '<p>visi visi visi</p>', '<p>misi misi misi</p>', 500, 'c11d6baadba61b0543d1989137be782b.png', 'SAINTEK'),
('HIMATIKA', 'Matematika', 'Himpunan Mahasiswa Matematika', '', '', 0, '', 'SAINTEK'),
('SEMAFADHUM', 'SEMAF', 'Senat Mahasiswa Fakultas Adab dan Humaniora', '', '', 0, '7518793beb354aa2bab3a6ce265bf6de.png', 'ADHUM'),
('SEMAFDAKOM', 'SEMAF', 'Senat Mahasiswa Fakultas Dakwah dan Komunikasi', '', '', 0, '37eabaa919d2786b32018eda10af2d8f.png', 'DAKOM'),
('SEMAFFEBI', 'SEMAF', 'Senat Mahasiswa Fakultas Ekonomi dan Bisnis Islam', '', '', 0, 'bda485bd672ebb0cc64f35b0864b2ed8.png', 'FEBI'),
('SEMAFFISIP', 'SEMAF', 'Senat Mahasiswa Fakultas Ilmu Sosial dan Ilmu Politik', '', '', 0, 'b2a1f38d45c1ebee6cc5fb51c7b59031.png', 'FISIP'),
('SEMAFPSIKOLOGI', 'SEMAF', 'Senat Mahasiswa Fakultas Psikologi', '', '', 0, '38f92befcf8e3cec3941e1f3f7478fa1.png', 'PSIKOLOGI'),
('SEMAFSAINTEK', 'SEMAF', 'Senat Mahasiswa Fakultas Sains dan Teknologi', '', '', 0, '3836fd3251e428226154d3a7dd7c89ce.png', 'SAINTEK'),
('SEMAFSYARKUM', 'SEMAF', 'Senat Mahasiswa Fakultas Syariah dan Hukum', '', '', 0, '03e4ba64e3c3899ee3db88ec8adfde8d.png', 'SYARKUM'),
('SEMAFTARBIYAH', 'SEMAF', 'Senat Mahasiswa Fakultas Tarbiyah dan Keguruan', '', '', 0, 'a4677a88cac6c056bf3185eb79e33cea.png', 'TARBIYAH'),
('SEMAFUSHULUDDIN', 'SEMAF', 'Senat Mahasiswa Fakultas Ushuluddin', '', '', 0, '4905b7af2d24e0a80916ddffd08b66ea.png', 'USHULUDDIN'),
('SEMAU', 'SEMA-U', 'Senat Mahasiswa Universitas', '', '', 0, '63ba01bd0926fe3ab0a5c51d98050b3a.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_ukmukk`
--

CREATE TABLE `kegiatan_ukmukk` (
  `id_ukegiatan` int(11) NOT NULL,
  `nama_ukegiatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ustart_date` date NOT NULL,
  `uend_date` date NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nama_bidang`
--

CREATE TABLE `nama_bidang` (
  `kode_bidang` varchar(255) NOT NULL,
  `label_bidang` varchar(255) NOT NULL,
  `desc_bidang` varchar(255) NOT NULL,
  `parent_himpunan` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nama_bidang`
--

INSERT INTO `nama_bidang` (`kode_bidang`, `label_bidang`, `desc_bidang`, `parent_himpunan`, `image`, `create_date`) VALUES
('Bidangmikat', 'Bidang minat dan bakat', 'Bidang yang ada di HIMATIF', 'HIMATIF', '2c5b8c107387dd7eabd1e69bcd41b622.png', '2021-01-26 07:18:31'),
('Bidangseni', 'Bidang Seni HIMATIF', 'Bidang ini terdiri dari 5 anggota', 'HIMATIF', 'c90cd82a5fddf0fdceb6cf6c85e625d7.png', '2021-01-24 14:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_himpunan`
--

CREATE TABLE `prestasi_himpunan` (
  `id_prestasi` int(11) NOT NULL,
  `jenis_prestasi` varchar(255) NOT NULL,
  `nama_prestasi` varchar(255) NOT NULL,
  `waktu` date NOT NULL,
  `desc_prestasi` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `parent_himpunan` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestasi_himpunan`
--

INSERT INTO `prestasi_himpunan` (`id_prestasi`, `jenis_prestasi`, `nama_prestasi`, `waktu`, `desc_prestasi`, `lokasi`, `image`, `parent_himpunan`, `create_date`) VALUES
(1, 'Anggota', 'Prestasi A', '2021-01-23', 'Dimenangkan oleh Anggota A', 'Bandung', '5c5c671c53e6b2539baff3c92142f9f8.png', 'HIMATIF', '2021-01-24 14:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_ukmukk`
--

CREATE TABLE `prestasi_ukmukk` (
  `id_uprestasi` int(11) NOT NULL,
  `jenis_uprestasi` varchar(255) NOT NULL,
  `nama_uprestasi` varchar(255) NOT NULL,
  `waktu` date NOT NULL,
  `desc_uprestasi` varchar(255) NOT NULL,
  `ulokasi` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `parent_ukmukk` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detailmenu`
--

CREATE TABLE `tb_detailmenu` (
  `id` int(11) NOT NULL,
  `status_id` int(4) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detailmenu`
--

INSERT INTO `tb_detailmenu` (`id`, `status_id`, `url`, `title`, `icon`, `is_active`) VALUES
(1, 1, 'c_user/', '&nbsp;&nbsp;Pengajuan Anggaran', 'fas fa-hand-holding-usd fa-2x', 1),
(2, 1, 'c_user', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(3, 2, 'c_user/Pagu_Anggaran', '&nbsp;&nbsp;Pengajuan Anggaran', 'fas fa-hand-holding-usd fa-2x', 1),
(4, 2, 'c_user/Pinjam_Aula', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(5, 3, 'c_user/Verifikasi_Data', '&nbsp;&nbsp;&nbsp;&nbsp;Verifikasi Data Pengajuan', 'fas fa-file-invoice-dollar fa-2x', 1),
(6, 3, 'c_user/Pinjam_Aula', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(7, 4, 'c_user/Laporan_Kegiatan', '&nbsp;&nbsp;Laporan Kegiatan', 'fas fa-search fa-2x', 1),
(8, 4, 'c_user/Pinjam_Aula', ' &nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(9, 5, 'c_user/Verifikasi_Laporan', '&nbsp;&nbsp;&nbsp;&nbsp;Verifikasi Laporan Kegiatan', 'fas fa-file-contract fa-2x', 1),
(10, 5, 'c_user/Pinjam_Aula', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(11, 6, 'c_user/Failed_Anggaran', '&nbsp;&nbsp;Gagal Pengajuan Anggaran', 'fas fa-times-circle fa-2x', 1),
(12, 6, 'c_user/Pinjam_Aula', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(13, 7, 'c_user/Failed_Laporan', '&nbsp;&nbsp;Gagal Pengajuan Laporan', 'fas fa-times-circle fa-2x', 1),
(14, 7, 'c_user/Pinjam_Aula', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1),
(15, 11, 'c_user/Pagu_Anggaran', '&nbsp;&nbsp;Pengajuan Anggaran', 'fas fa-hand-holding-usd fa-2x', 1),
(16, 11, 'c_user/Pinjam_Aula', '&nbsp;&nbsp;&nbsp;Peminjaman Aula SC', 'fas fa-calendar-day fa-2x', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detailuser`
--

CREATE TABLE `tb_detailuser` (
  `id_dana` int(11) NOT NULL,
  `kd_jrsn` varchar(255) CHARACTER SET latin1 NOT NULL,
  `kd_fklts` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jurusan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `statususer` int(9) NOT NULL,
  `pesangagal` longtext CHARACTER SET latin1 NOT NULL DEFAULT '\'Alasan tidak ACC\'',
  `nPengajuan` int(3) DEFAULT 0,
  `danaawal` bigint(20) DEFAULT 0,
  `danasisa` bigint(20) DEFAULT 0,
  `tahunakademik` year(4) NOT NULL,
  `insertdata` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detailuser`
--

INSERT INTO `tb_detailuser` (`id_dana`, `kd_jrsn`, `kd_fklts`, `jurusan`, `statususer`, `pesangagal`, `nPengajuan`, `danaawal`, `danasisa`, `tahunakademik`, `insertdata`) VALUES
(1, 'ILMUHADITS', 'USHULUDDIN', 'a', 1, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-23 15:34:44'),
(2, 'HIMATIF', 'SAINTEK', 'Himpunan Mahasiswa Teknik Informatika', 1, '\'Alasan tidak ACC\'', 2, 10000000, 4000000, 2021, '2021-01-26 09:27:13'),
(3, 'DEMAFTARBIYAH', 'TARBIYAH', 'Dewan Mahasiswa Fakultas Tarbiyah', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 06:07:33'),
(4, 'DEMAFADHUM', 'ADHUM', 'Dewan Mahasiswa Fakultas Adab dan Humaniora', 1, '\'Alasan tidak ACC\'', 1, 20000000, 20000000, 2021, '2021-01-26 07:07:55'),
(5, 'DEMAFDAKOM', 'DAKOM', 'Dewan Mahasiswa Fakultas Dakwah dan Komunikasi', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:00:34'),
(6, 'DEMAFFEBI', 'FEBI', 'Dewan Mahasiswa Fakultas Ekonomi dan Bisnis Islam', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:08:48'),
(7, 'DEMAFFISIP', 'FISIP', 'Dewan Mahasiswa Fakultas Ilmu Sosial dan Ilmu Politik', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:12:23'),
(8, 'DEMAFPSIKOLOGI', 'PSIKOLOGI', 'Dewan Mahasiswa Fakultas Psikologi', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:13:57'),
(9, 'DEMAFSAINTEK', 'SAINTEK', 'Dewan Mahasiswa Fakultas Sains dan Teknologi ', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:15:27'),
(10, 'DEMAFSYARKUM', 'SYARKUM', 'Dewan Mahasiswa Fakultas Syariah dan Hukum', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:17:35'),
(11, 'DEMAFUSHULUDDIN', 'USHULUDDIN', 'Dewan Mahasiswa Fakultas Ushuluddin', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:18:46'),
(12, 'SEMAFADHUM', 'ADHUM', 'Senat Mahasiswa Fakultas Adab dan Humaniora', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:21:11'),
(13, 'SEMAFDAKOM', 'DAKOM', 'Senat Mahasiswa Fakultas Dakwah dan Komunikasi', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:23:07'),
(14, 'SEMAFFEBI', 'FEBI', 'Senat Mahasiswa Fakultas Ekonomi dan Bisnis Islam', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:24:04'),
(15, 'SEMAFFISIP', 'FISIP', 'Senat Mahasiswa Fakultas Ilmu Sosial dan Ilmu Politik', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:25:10'),
(16, 'SEMAFPSIKOLOGI', 'PSIKOLOGI', 'Senat Mahasiswa Fakultas Psikologi', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:26:20'),
(17, 'SEMAFSAINTEK', 'SAINTEK', 'Senat Mahasiswa Fakultas Sains dan Teknologi', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:27:54'),
(18, 'SEMAFSYARKUM', 'SYARKUM', 'Senat Mahasiswa Fakultas Syariah dan Hukum', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:29:07'),
(19, 'SEMAFTARBIYAH', 'TARBIYAH', 'Senat Mahasiswa Fakultas Tarbiyah dan Keguruan', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:50:21'),
(20, 'SEMAFUSHULUDDIN', 'USHULUDDIN', 'Senat Mahasiswa Fakultas Ushuluddin', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 11:51:57'),
(21, 'HIMATIKA', 'SAINTEK', 'Himpunan Mahasiswa Matematika', 1, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 13:52:42'),
(22, 'DEMAU', NULL, 'Dewan Mahasiswa Universitas', 1, '\'Alasan tidak ACC\'', 1, 10000000, 10000000, 2021, '2021-01-26 07:06:35'),
(23, 'SEMAU', NULL, 'Senat Mahasiswa Universitas', 0, '\'Alasan tidak ACC\'', 0, 0, 0, 0000, '2021-01-24 17:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detailuserukmukk`
--

CREATE TABLE `tb_detailuserukmukk` (
  `id_dana` int(11) NOT NULL,
  `kd_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nama_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `detail_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `statususer` int(9) NOT NULL,
  `pesangagal` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nPengajuan` int(3) NOT NULL,
  `danaawal` bigint(20) NOT NULL DEFAULT 0,
  `danasisa` bigint(20) NOT NULL DEFAULT 0,
  `tahunakademik` year(4) NOT NULL DEFAULT 0000,
  `insertdata` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detailuserukmukk`
--

INSERT INTO `tb_detailuserukmukk` (`id_dana`, `kd_ukmukk`, `nama_ukmukk`, `detail_ukmukk`, `statususer`, `pesangagal`, `nPengajuan`, `danaawal`, `danasisa`, `tahunakademik`, `insertdata`) VALUES
(1, 'UKM_FABBIS', 'Family Of Basketball', 'Komunitas Basket', 1, '', 1, 15000000, 15000000, 2021, '2021-01-26 07:08:38'),
(2, 'UKK_PRAMUKA', 'Pramuka', 'Pramuka UIN Sunan Gunung Djati Bandung', 1, '', 0, 0, 0, 0000, '2021-01-24 13:56:55'),
(3, 'UKM_MENWA', 'Resimen Mahasiswa', '', 1, '', 0, 0, 0, 0000, '2021-02-02 13:54:33'),
(4, 'UKM_PERBAMA', 'Persatuan Badminton Mahasiswa', '', 1, '', 0, 0, 0, 0000, '2021-02-02 13:55:40'),
(5, 'UKM_LKIM', 'Lembaga Inkubasi Kewirausahaan Mahasiswa', '', 1, '', 0, 0, 0, 0000, '2021-02-02 13:56:30'),
(6, 'UKM_PSM', 'PSM', 'Paduan Suara Mahasiswa', 1, '', 0, 0, 0, 0000, '2021-02-03 02:05:43'),
(7, 'UKM_TAEKWONDO', 'Taekwondo', '', 1, '', 0, 0, 0, 0000, '2021-02-03 02:06:43'),
(8, 'UKM_MAHAPEKA', 'Mahapeka', '', 1, '', 0, 0, 0, 0000, '2021-02-03 02:07:27'),
(9, 'UKM_LDM', 'LDM', 'Lembaga Dakwah Mahasiswa', 1, '', 0, 0, 0, 0000, '2021-02-03 02:08:16'),
(10, 'UKM_WSC', 'WSC', 'Woman Studies Center', 1, '', 0, 0, 0, 0000, '2021-02-03 02:09:15'),
(11, 'UKM_LPB', 'LPB', 'Lembaga Pembinaan Bahasa', 1, '', 0, 0, 0, 0000, '2021-02-03 02:10:50'),
(12, 'UKM_UPTQ', 'UPTQ', 'Unit Pengembangan Tilawatil Qur\'an', 1, '', 0, 0, 0, 0000, '2021-02-03 02:11:58'),
(13, 'UKM_TEATER', 'Teater Awal', 'Teater Awal Bandung', 1, '', 0, 0, 0, 0000, '2021-02-03 02:14:13'),
(14, 'UKM_PSTD', 'PSTD', 'Pencak Silat Tenaga Dasar', 1, '', 0, 0, 0, 0000, '2021-02-03 02:15:37'),
(15, 'UKM_PSKM', 'PSKM', 'Pencak Silat Krachtology Matahari', 1, '', 0, 0, 0, 0000, '2021-02-03 02:16:31'),
(16, 'UKM_BKC', 'BKC', 'Bandung Karate Club', 1, '', 0, 0, 0, 0000, '2021-02-03 02:17:17'),
(17, 'UKM_PSPB', 'PSPB', 'Pusaka Saputra Paku Banten', 1, '', 0, 0, 0, 0000, '2021-02-03 02:18:35'),
(18, 'UKM_TADJIMALELA', 'Tadjimalela', '', 1, '', 0, 0, 0, 0000, '2021-02-03 02:19:54'),
(19, 'UKM_LPIK', 'LPIK', 'Lembaga Pengkajian Ilmu Keislaman', 1, '', 0, 0, 0, 0000, '2021-02-03 02:20:58'),
(20, 'UKM_LSLK', 'LSLK', 'Lembaga Seni Lukis dan Kaligrafi', 1, '', 0, 0, 0, 0000, '2021-02-03 02:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `tb_keluhan`
--

CREATE TABLE `tb_keluhan` (
  `id` int(11) NOT NULL,
  `kd_ormawa` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tanggal` date NOT NULL,
  `isikeluhan` varchar(250) NOT NULL,
  `status_keluhan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_keluhan`
--

INSERT INTO `tb_keluhan` (`id`, `kd_ormawa`, `tanggal`, `isikeluhan`, `status_keluhan`) VALUES
(1, 'HIMATIF', '2021-01-26', ' Sistem ini sering lemot.                       ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_ket_aula`
--

CREATE TABLE `tb_ket_aula` (
  `warna_id` varchar(11) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ket_aula`
--

INSERT INTO `tb_ket_aula` (`warna_id`, `keterangan`) VALUES
('blue', 'Aula A'),
('purple', 'Aula B');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menuuser`
--

CREATE TABLE `tb_menuuser` (
  `id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuan`
--

CREATE TABLE `tb_pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `kd_jrsn` varchar(255) CHARACTER SET latin1 NOT NULL,
  `kd_fakultas` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jurusan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tahunakademik` year(4) NOT NULL,
  `nPengajuan` int(3) DEFAULT NULL,
  `statususer` int(11) NOT NULL,
  `alasan_gagal_pengajuan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `alasan_gagal_laporan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `akhirkegiatan` date NOT NULL,
  `tglmakslaporan` date NOT NULL,
  `tgluploadlpj` date NOT NULL,
  `namaKegiatan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `danaawal` bigint(20) NOT NULL,
  `danasisa` double NOT NULL,
  `danaacc` bigint(20) NOT NULL,
  `suratpengajuan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rinciankegiatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rkakl` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tor` varchar(255) CHARACTER SET latin1 NOT NULL,
  `laporankegiatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `laporanrincianbiaya` varchar(255) CHARACTER SET latin1 NOT NULL,
  `insertdata` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengajuan`
--

INSERT INTO `tb_pengajuan` (`id_pengajuan`, `kd_jrsn`, `kd_fakultas`, `jurusan`, `tahunakademik`, `nPengajuan`, `statususer`, `alasan_gagal_pengajuan`, `alasan_gagal_laporan`, `akhirkegiatan`, `tglmakslaporan`, `tgluploadlpj`, `namaKegiatan`, `danaawal`, `danasisa`, `danaacc`, `suratpengajuan`, `rinciankegiatan`, `rkakl`, `tor`, `laporankegiatan`, `laporanrincianbiaya`, `insertdata`) VALUES
(1, 'HIMATIF', 'SAINTEK', NULL, 2021, 1, 8, 'Surat tidak sesuai', '', '2021-04-26', '0000-00-00', '0000-00-00', 'Kegiatan A, Kegiatan B, Kegiatan C, Acara D', 10000000, 10000000, 0, 'SPJ-210126-d27454bbe0.pdf', 'RKG-210126-d27454bbe0.pdf', 'RKA_KL-210126-d27454bbe0.pdf', 'TOR-210126-d27454bbe0.pdf', '', '', '2021-01-26'),
(2, 'HIMATIF', 'SAINTEK', NULL, 2021, 1, 10, '', '', '2021-01-26', '2021-02-02', '2021-01-26', 'Kegiatan A, Kegiatan B, Kegiatan C', 10000000, 7000000, 3000000, 'SPJ-210126-5423554c11.pdf', 'RKG-210126-5423554c11.pdf', 'RKA_KL-210126-5423554c11.pdf', 'TOR-210126-5423554c11.pdf', 'LPJ-210126-e9daf93bac.pdf', 'RBY-210126-e9daf93bac.pdf', '2021-01-26'),
(3, 'HIMATIF', 'SAINTEK', NULL, 2021, 2, 5, '', '', '2021-01-27', '2021-02-03', '2021-01-26', 'PBAK, Audiensi', 10000000, 4000000, 3000000, 'SPJ-210126-27d530e48a.pdf', 'RKG-210126-27d530e48a.pdf', 'RKA_KL-210126-27d530e48a.pdf', 'TOR-210126-27d530e48a.pdf', 'LPJ-210126-a8c85748a3.pdf', 'RBY-210126-a8c85748a3.pdf', '2021-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuan_ukmukk`
--

CREATE TABLE `tb_pengajuan_ukmukk` (
  `id_pengajuan_ukmukk` int(11) NOT NULL,
  `kd_ukmkk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nama_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tahunakademik` year(4) NOT NULL,
  `nPengajuan` int(3) NOT NULL,
  `statususer` int(11) NOT NULL,
  `alasan_gagal_pengajuan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `alasan_gagal_laporan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `akhirkegiatan` date NOT NULL,
  `tglmakslaporan` date NOT NULL,
  `tgluploadlpj` date NOT NULL,
  `namaKegiatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `danaawal` bigint(20) NOT NULL,
  `danasisa` bigint(20) NOT NULL,
  `danaacc` bigint(20) NOT NULL,
  `suratpengajuan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rinciankegiatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rkakl` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tor` varchar(255) CHARACTER SET latin1 NOT NULL,
  `laporankegiatan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `laporanrincianbiaya` varchar(255) CHARACTER SET latin1 NOT NULL,
  `insertdata` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sewaaula`
--

CREATE TABLE `tb_sewaaula` (
  `id_sewa` int(11) NOT NULL,
  `penyewa` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Keterangan` varchar(255) CHARACTER SET latin1 NOT NULL,
  `no_surat` varchar(255) CHARACTER SET latin1 NOT NULL,
  `surat_sewa` varchar(255) CHARACTER SET latin1 NOT NULL,
  `jenisaula` varchar(10) CHARACTER SET latin1 NOT NULL,
  `dari` date NOT NULL,
  `hingga` date NOT NULL,
  `mulaipukul` time NOT NULL,
  `akhirpukul` time NOT NULL,
  `nama_pj` varchar(255) CHARACTER SET latin1 NOT NULL,
  `no_pj` varchar(255) CHARACTER SET latin1 NOT NULL,
  `statussewa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_sewaaula`
--

INSERT INTO `tb_sewaaula` (`id_sewa`, `penyewa`, `Keterangan`, `no_surat`, `surat_sewa`, `jenisaula`, `dari`, `hingga`, `mulaipukul`, `akhirpukul`, `nama_pj`, `no_pj`, `statussewa`) VALUES
(1, 'HIMATIF', 'Acara A', '01', 'SuratIzinSewaAula-210126-75ea15687e-HIMATIF-Acara_A.pdf', 'blue', '2021-01-26', '2021-01-28', '09:00:00', '15:00:00', 'Anggota A', '08123456789', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `id_status` int(11) NOT NULL,
  `Nama_Status` varchar(255) CHARACTER SET latin1 NOT NULL,
  `button_color_history` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`id_status`, `Nama_Status`, `button_color_history`) VALUES
(1, 'Belum Update Informasi Ormawa', ''),
(2, 'Selesai Update Informasi Ormawa', ''),
(3, 'Verifikasi Pengajuan Anggaran Dana', 'btn btn-sm btn-warning'),
(4, 'Proses Laporan Kegiatan', 'btn btn-sm btn-warning'),
(5, 'Verifikasi Laporan', 'btn btn-sm btn-warning'),
(6, 'Proses Failed Pengajuan', 'btn btn-sm btn-danger'),
(7, 'Proses Failed Laporan', 'btn btn-sm btn-danger'),
(8, 'Pengajuan Ditolak', 'btn btn-sm btn-danger'),
(9, 'Laporan Ditolak', 'btn btn-sm btn-danger'),
(10, 'Laporan di terima', 'btn btn-sm btn-success'),
(11, 'Maksimal Pengajuan Anggaran Dana', 'btn btn-sm btn-success');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statuspengajuan`
--

CREATE TABLE `tb_statuspengajuan` (
  `id_status_pengajuan` int(11) NOT NULL,
  `Keterangan_pengajuan` varchar(40) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_statuspengajuan`
--

INSERT INTO `tb_statuspengajuan` (`id_status_pengajuan`, `Keterangan_pengajuan`) VALUES
(1, 'Proses Pengajuan'),
(2, 'Pengajuan diterima'),
(3, 'Pengajuan ditolak'),
(4, 'Proses Laporan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statussewa`
--

CREATE TABLE `tb_statussewa` (
  `id_status` int(11) NOT NULL,
  `keterangan` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_statussewa`
--

INSERT INTO `tb_statussewa` (`id_status`, `keterangan`) VALUES
(0, 'tidak akti'),
(1, 'aktif sewa');

-- --------------------------------------------------------

--
-- Table structure for table `ukm_ukk`
--

CREATE TABLE `ukm_ukk` (
  `kode_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `nama_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `desc_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `visi_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `misi_ukmukk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `jml_umhsaktif` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ukm_ukk`
--

INSERT INTO `ukm_ukk` (`kode_ukmukk`, `nama_ukmukk`, `desc_ukmukk`, `visi_ukmukk`, `misi_ukmukk`, `jml_umhsaktif`, `image`) VALUES
('UKK_PRAMUKA', 'Pramuka', 'Pramuka UIN Sunan Gunung Djati Bandung', '', '', 0, '009df8dfb3755e667c174348bc7b92e5.png'),
('UKM_BKC', 'BKC', 'Bandung Karate Club', '', '', 0, '5ff19e4abc5535d665da454e0f3af1cd.png'),
('UKM_FABBIS', 'Family Of Basketball', 'Komunitas Basket', '', '', 0, '676385c03f3f8ce3b3f1a485a5ca98b4.png'),
('UKM_LDM', 'LDM', 'Lembaga Dakwah Mahasiswa', '', '', 0, 'bb835fe957321727bb2d113a8d03b74a.png'),
('UKM_LKIM', 'Lembaga Inkubasi Kewirausahaan Mahasiswa', '', '', '', 0, '01d440622c69710933426ff5c4ca07ea.png'),
('UKM_LPB', 'LPB', 'Lembaga Pembinaan Bahasa', '', '', 0, '8b738b7d440d16fbf8890bd1a05a24cb.png'),
('UKM_LPIK', 'LPIK', 'Lembaga Pengkajian Ilmu Keislaman', '', '', 0, '979bf2709a35179460fcc9cff60c66de.png'),
('UKM_LSLK', 'LSLK', 'Lembaga Seni Lukis dan Kaligrafi', '', '', 0, 'c4313a8578a00e6b43995683e9ca7270.png'),
('UKM_MAHAPEKA', 'Mahapeka', '', '', '', 0, '30194ee177ccf8d6e19df8398cb5bb23.png'),
('UKM_MENWA', 'Resimen Mahasiswa', '', '', '', 0, '7c58324c5ca58ab338c35304c7e98fe4.png'),
('UKM_PERBAMA', 'Persatuan Badminton Mahasiswa', '', '', '', 0, 'efbc5faa6bd5b1c44441b218e82c76dd.png'),
('UKM_PSKM', 'PSKM', 'Pencak Silat Krachtology Matahari', '', '', 0, '8cec3d13757c7f570b1cd54bc0aa7186.png'),
('UKM_PSM', 'PSM', 'Paduan Suara Mahasiswa', '', '', 0, '42e09713726c15b6317b341e8eb63570.png'),
('UKM_PSPB', 'PSPB', 'Pusaka Saputra Paku Banten', '', '', 0, '3fcf9912ef8f380f1c4d7c6692be06c5.png'),
('UKM_PSTD', 'PSTD', 'Pencak Silat Tenaga Dasar', '', '', 0, 'f1da19b42953ac8c627db9581e59b2d7.png'),
('UKM_TADJIMALELA', 'Tadjimalela', '', '', '', 0, '264584adda9af21ec28bb1c1f0374ea2.png'),
('UKM_TAEKWONDO', 'Taekwondo', '', '', '', 0, 'db1cdd626ba4663ec10897de57f8b6b7.png'),
('UKM_TEATER', 'Teater Awal', 'Teater Awal Bandung', '', '', 0, '3b2b7d5f3e469046ece6ca3796b5edc0.png'),
('UKM_UPTQ', 'UPTQ', 'Unit Pengembangan Tilawatil Qur\'an', '', '', 0, 'b5acb98f18ff4a5ea10aecb71ec1da49.png'),
('UKM_WSC', 'WSC', 'Woman Studies Center', '', '', 0, '679ce50b94a0a5ad073bc49788905ba8.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `kode_himp` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `statususer` int(11) NOT NULL,
  `statussewa` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `insert_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `email`, `username`, `telp`, `password`, `role`, `kode_himp`, `is_active`, `statususer`, `statussewa`, `update_date`, `insert_date`) VALUES
(47, 'Admin SIMARWAH', 'admin@gmail.com', 'admin', '081', '21232f297a57a5a743894a0e4a801fc3', 1, 'admin', 1, 1, 1, '2020-11-30 10:55:26', '2020-11-30 10:55:26'),
(86, 'admin demau', 'admin@uinsgd.ac.id', 'demau@uinsgd.ac.id', '081', 'a04e3d0b6b2bbde8a02763ba8ff20d91', 0, 'DEMAU', 1, 1, 1, '2021-01-24 08:34:44', '2021-01-24 08:34:44'),
(91, 'admin semau', 'adminsemau@gmail.com', 'semau@uinsgd.ac.id', '0', 'fa0b626dd85bc327584c6d9b2ec86c02', 0, 'SEMAU', 1, 1, 1, '2021-01-24 08:43:09', '2021-01-24 08:43:09'),
(92, 'admin himatif', '', 'himatif@uinsgd.ac.id', '08123456789', '23abc39caa54c738db2e54511dac4e96', 0, 'HIMATIF', 1, 5, 0, '0000-00-00 00:00:00', '2021-01-24 08:53:18'),
(93, 'Raka', '', 'fabbis@uinsgd.ac.id', '085956476931', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_FABBIS', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 08:55:03'),
(94, 'Sri', '', 'demaftk@uinsgd.ac.id', '0895351834924', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFTARBIYAH', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 13:07:33'),
(95, 'Admin DEMAF ADHUM', '', 'demafah@uinsgd.ac.id', '082128619125', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFADHUM', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 17:49:13'),
(96, 'Faisal', '', 'demafdk@uinsgd.ac.id', '083120754396', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFDAKOM', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:00:34'),
(97, 'Admin DEMAF FEBI', '', 'demafebi@uinsgd.ac.id', '123', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFFEBI', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:08:48'),
(98, 'Admin DEMA F FISIP', '', 'demafisip@uinsgd.ac.id', '123', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFFISIP', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:12:23'),
(99, 'Admin DEMAF Psikologi', '', 'demapsikologi@uinsgd.ac.id', '081224682182', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFPSIKOLOGI', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:13:57'),
(100, 'Admin DEMAF SAINTEK', '', 'demafst@uinsgd.ac.id', '082295020107', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFSAINTEK', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:15:27'),
(101, 'Admin DEMA F SYARKUM', '', 'demafsh@uinsgd.ac.id', '085524843451', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFSYARKUM', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:17:35'),
(102, 'Admin DEMAF Ushuluddin', '', 'demafush@uinsgd.ac.id', '081220457600', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'DEMAFUSHULUDDIN', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:18:46'),
(103, 'Agus', '', 'semafah@uinsgd.ac.id', '081460914146', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFADHUM', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:21:11'),
(104, 'Admin SEMAF DAKOM', '', 'semafdk@uinsgd.ac.id', '123', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFDAKOM', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:23:07'),
(105, 'Admin SEMAF FEBI', '', 'semafebi@uinsgd.ac.id', '123', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFFEBI', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:24:04'),
(106, 'Dzikri', '', 'semafisip@uinsgd.ac.id', '085860617290', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFFISIP', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:25:10'),
(107, 'Diana', '', 'semapsikologi@uinsgd.ac.id', '085215026937', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFPSIKOLOGI', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:26:20'),
(108, 'Kurnia', '', 'semafst@uinsgd.ac.id', '083847168512', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFSAINTEK', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:27:54'),
(109, 'Admin SEMAF SYARKUM', '', 'semafsh@uinsgd.ac.id', '082215690867', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFSYARKUM', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:29:07'),
(110, 'Kurnia', '', 'semaftk@uinsgd.ac.id', '083847168512', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFTARBIYAH', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:50:21'),
(111, 'Admin SEMAF Ushuluddin', '', 'semafush@uinsgd.ac.id', '081321981941', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'SEMAFUSHULUDDIN', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 18:51:57'),
(112, 'Admin Matematika', '', 'himatika@uinsgd.ac.id', '08123456789', 'd6c068fcfedbae6db692d51cd48da25f', 0, 'HIMATIKA', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 20:52:42'),
(113, 'Ratih', '', 'pramuka@uinsgd.ac.id', '082320388579', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKK_PRAMUKA', 1, 1, 0, '0000-00-00 00:00:00', '2021-01-24 20:56:55'),
(114, 'Danki Hadi', '', 'menwa@uinsgd.ac.id', '089663759858', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_MENWA', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-02 20:54:33'),
(115, 'Dodo', '', 'perbama@uinsgd.ac.id', '085831094586', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_PERBAMA', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-02 20:55:40'),
(116, 'Parid Adillah', '', 'lkim@uinsgd.ac.id', '085780031997', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_LKIM', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-02 20:56:30'),
(117, 'Nissa', '', 'psm@uinsgd.ac.id', '089631052031', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_PSM', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:05:43'),
(118, 'Ai', '', 'ukmtaekwondo@uinsgd.ac.id', '081223555769', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_TAEKWONDO', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:06:43'),
(119, 'Monju', '', 'mahapeka@uinsgd.ac.id', '082116680695', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_MAHAPEKA', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:07:27'),
(120, 'Rika', '', 'ukmldm@uinsgd.ac.id', '082349545269', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_LDM', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:08:16'),
(121, 'Gilang', '', 'ukmwsc@uinsgd.ac.id', '089663759858', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_WSC', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:09:15'),
(122, 'Zahra', '', 'lpb@uinsgd.ac.id', '089663759858', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_LPB', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:10:50'),
(123, 'Tia', '', 'ukm_uptq@uinsgd.ac.id', '085322004263', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_UPTQ', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:11:58'),
(124, 'Cami', '', 'teaterawal@uinsgd.ac.id', '087760935675', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_TEATER', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:14:13'),
(125, 'Admin PSTD', '', 'ukm_pstd@uinsgd.ac.id', '0', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_PSTD', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:15:37'),
(126, 'Gaman', '', 'ukm_pskm@uinsgd.ac.id', '087848328175', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_PSKM', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:16:31'),
(127, 'Iqbal ', '', 'ukm_bkc@uinsgd.ac.id', '081220220987', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_BKC', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:17:17'),
(128, 'Admin PSPB', '', 'ukm_pspb@uinsgd.ac.id', '089674103071', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_PSPB', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:18:35'),
(129, 'Novia', '', 'ukm_tadjimalela@uinsgd.ac.id', '087738511495', '70aef7ce96e827bf586b499372efde01', 2, 'UKM_TADJIMALELA', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:19:54'),
(130, 'Ridwan', '', 'ukm_lpik@uinsgd.ac.id', '08986056251', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_LPIK', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:20:58'),
(131, 'Bulma', '', 'ukm_lslk@uinsgd.ac.id', '089650257508', 'd6c068fcfedbae6db692d51cd48da25f', 2, 'UKM_LSLK', 1, 1, 0, '0000-00-00 00:00:00', '2021-02-03 09:21:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota_himpunan`
--
ALTER TABLE `anggota_himpunan`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `parent_himpunan` (`parent_himpunan`),
  ADD KEY `parent_bidang` (`parent_bidang`);

--
-- Indexes for table `anggota_ukmukk`
--
ALTER TABLE `anggota_ukmukk`
  ADD PRIMARY KEY (`u_nim`),
  ADD KEY `parent_ukmukk` (`parent_ukmukk`),
  ADD KEY `parent_ubidang` (`parent_ubidang`);

--
-- Indexes for table `bidang_ukmukk`
--
ALTER TABLE `bidang_ukmukk`
  ADD PRIMARY KEY (`kode_ubidang`),
  ADD KEY `parent_ukmukk` (`parent_ukmukk`);

--
-- Indexes for table `daftar_kegiatan`
--
ALTER TABLE `daftar_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD KEY `Parent_himpunan` (`Parent_himpunan`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`kode_fakultas`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_himpunan`),
  ADD KEY `parent_fakultas` (`parent_fakultas`);

--
-- Indexes for table `kegiatan_ukmukk`
--
ALTER TABLE `kegiatan_ukmukk`
  ADD PRIMARY KEY (`id_ukegiatan`),
  ADD KEY `parent_ukmukk` (`parent_ukmukk`);

--
-- Indexes for table `nama_bidang`
--
ALTER TABLE `nama_bidang`
  ADD PRIMARY KEY (`kode_bidang`),
  ADD KEY `parent_himpunan` (`parent_himpunan`);

--
-- Indexes for table `prestasi_himpunan`
--
ALTER TABLE `prestasi_himpunan`
  ADD PRIMARY KEY (`id_prestasi`),
  ADD KEY `parent_himpunan` (`parent_himpunan`);

--
-- Indexes for table `prestasi_ukmukk`
--
ALTER TABLE `prestasi_ukmukk`
  ADD PRIMARY KEY (`id_uprestasi`),
  ADD KEY `parent_ukmukk` (`parent_ukmukk`);

--
-- Indexes for table `tb_detailmenu`
--
ALTER TABLE `tb_detailmenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_detailuser`
--
ALTER TABLE `tb_detailuser`
  ADD PRIMARY KEY (`id_dana`);

--
-- Indexes for table `tb_detailuserukmukk`
--
ALTER TABLE `tb_detailuserukmukk`
  ADD PRIMARY KEY (`id_dana`);

--
-- Indexes for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_ket_aula`
--
ALTER TABLE `tb_ket_aula`
  ADD PRIMARY KEY (`warna_id`);

--
-- Indexes for table `tb_menuuser`
--
ALTER TABLE `tb_menuuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `status1` (`statususer`),
  ADD KEY `kd_fakultas` (`kd_fakultas`);

--
-- Indexes for table `tb_pengajuan_ukmukk`
--
ALTER TABLE `tb_pengajuan_ukmukk`
  ADD PRIMARY KEY (`id_pengajuan_ukmukk`),
  ADD KEY `statususer` (`statususer`);

--
-- Indexes for table `tb_sewaaula`
--
ALTER TABLE `tb_sewaaula`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `jenisaula` (`jenisaula`),
  ADD KEY `penyewa` (`penyewa`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tb_statuspengajuan`
--
ALTER TABLE `tb_statuspengajuan`
  ADD PRIMARY KEY (`id_status_pengajuan`);

--
-- Indexes for table `tb_statussewa`
--
ALTER TABLE `tb_statussewa`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `ukm_ukk`
--
ALTER TABLE `ukm_ukk`
  ADD PRIMARY KEY (`kode_ukmukk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `status_menu` (`statususer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_kegiatan`
--
ALTER TABLE `daftar_kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kegiatan_ukmukk`
--
ALTER TABLE `kegiatan_ukmukk`
  MODIFY `id_ukegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prestasi_himpunan`
--
ALTER TABLE `prestasi_himpunan`
  MODIFY `id_prestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prestasi_ukmukk`
--
ALTER TABLE `prestasi_ukmukk`
  MODIFY `id_uprestasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_detailuser`
--
ALTER TABLE `tb_detailuser`
  MODIFY `id_dana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_detailuserukmukk`
--
ALTER TABLE `tb_detailuserukmukk`
  MODIFY `id_dana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_keluhan`
--
ALTER TABLE `tb_keluhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pengajuan_ukmukk`
--
ALTER TABLE `tb_pengajuan_ukmukk`
  MODIFY `id_pengajuan_ukmukk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_sewaaula`
--
ALTER TABLE `tb_sewaaula`
  MODIFY `id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_himpunan`
--
ALTER TABLE `anggota_himpunan`
  ADD CONSTRAINT `anggota_himpunan_ibfk_3` FOREIGN KEY (`parent_himpunan`) REFERENCES `jurusan` (`kode_himpunan`),
  ADD CONSTRAINT `anggota_himpunan_ibfk_4` FOREIGN KEY (`parent_bidang`) REFERENCES `nama_bidang` (`kode_bidang`);

--
-- Constraints for table `anggota_ukmukk`
--
ALTER TABLE `anggota_ukmukk`
  ADD CONSTRAINT `anggota_ukmukk_ibfk_1` FOREIGN KEY (`parent_ukmukk`) REFERENCES `ukm_ukk` (`kode_ukmukk`),
  ADD CONSTRAINT `anggota_ukmukk_ibfk_2` FOREIGN KEY (`parent_ubidang`) REFERENCES `bidang_ukmukk` (`kode_ubidang`);

--
-- Constraints for table `bidang_ukmukk`
--
ALTER TABLE `bidang_ukmukk`
  ADD CONSTRAINT `bidang_ukmukk_ibfk_1` FOREIGN KEY (`parent_ukmukk`) REFERENCES `ukm_ukk` (`kode_ukmukk`);

--
-- Constraints for table `daftar_kegiatan`
--
ALTER TABLE `daftar_kegiatan`
  ADD CONSTRAINT `daftar_kegiatan_ibfk_1` FOREIGN KEY (`Parent_himpunan`) REFERENCES `jurusan` (`kode_himpunan`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`parent_fakultas`) REFERENCES `fakultas` (`kode_fakultas`) ON UPDATE CASCADE;

--
-- Constraints for table `kegiatan_ukmukk`
--
ALTER TABLE `kegiatan_ukmukk`
  ADD CONSTRAINT `kegiatan_ukmukk_ibfk_1` FOREIGN KEY (`parent_ukmukk`) REFERENCES `ukm_ukk` (`kode_ukmukk`);

--
-- Constraints for table `nama_bidang`
--
ALTER TABLE `nama_bidang`
  ADD CONSTRAINT `parent_himpunan` FOREIGN KEY (`parent_himpunan`) REFERENCES `jurusan` (`kode_himpunan`);

--
-- Constraints for table `prestasi_himpunan`
--
ALTER TABLE `prestasi_himpunan`
  ADD CONSTRAINT `prestasi_himpunan_ibfk_1` FOREIGN KEY (`parent_himpunan`) REFERENCES `jurusan` (`kode_himpunan`);

--
-- Constraints for table `prestasi_ukmukk`
--
ALTER TABLE `prestasi_ukmukk`
  ADD CONSTRAINT `prestasi_ukmukk_ibfk_1` FOREIGN KEY (`parent_ukmukk`) REFERENCES `ukm_ukk` (`kode_ukmukk`);

--
-- Constraints for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD CONSTRAINT `status1` FOREIGN KEY (`statususer`) REFERENCES `tb_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_pengajuan_ukmukk`
--
ALTER TABLE `tb_pengajuan_ukmukk`
  ADD CONSTRAINT `status12` FOREIGN KEY (`statususer`) REFERENCES `tb_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tb_sewaaula`
--
ALTER TABLE `tb_sewaaula`
  ADD CONSTRAINT `WARNA PENYEWA` FOREIGN KEY (`jenisaula`) REFERENCES `tb_ket_aula` (`warna_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `status_menu` FOREIGN KEY (`statususer`) REFERENCES `tb_status` (`id_status`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
