-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2025 at 11:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikma_dbv3`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `description_short` text DEFAULT NULL,
  `description_long` text DEFAULT NULL,
  `logo_url` varchar(512) DEFAULT NULL,
  `banner_image_url` varchar(512) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `website_url` varchar(512) DEFAULT NULL,
  `email_contact` varchar(255) DEFAULT NULL,
  `phone_contact` varchar(50) DEFAULT NULL,
  `why_intern_here` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Array of strings' CHECK (json_valid(`why_intern_here`)),
  `internship_application_info` text DEFAULT NULL,
  `relevant_tech` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Array of relevant skills/technologies, e.g., ["Python", "React"]' CHECK (json_valid(`relevant_tech`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Untuk menonaktifkan sementara',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `category_id`, `type_id`, `description_short`, `description_long`, `logo_url`, `banner_image_url`, `address`, `website_url`, `email_contact`, `phone_contact`, `why_intern_here`, `internship_application_info`, `relevant_tech`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'PT Anjas Sejati', 1, 1, 'Pengembangan solusi AI inovatif.', 'Didirikan pada tahun 2015, PT Anjas Sejati telah menjadi pelopor dalam aplikasi AI di Indonesia...', 'https://placehold.co/100x100/A9CCE3/2C3E50?text=AS&font=Roboto', 'https://placehold.co/600x400/A9CCE3/2C3E50?text=Anjas+Sejati+Detail&font=Roboto', 'Jl. Teknologi Raya No. 123, Jakarta', 'https://anjassejati.example.com', 'hr@anjassejati.example.com', '021-1234567', '[\"Kesempatan belajar langsung dari para ahli di bidang AI.\", \"Terlibat dalam proyek-proyek inovatif dan berdampak.\"]', 'Kirimkan CV dan portofolio Anda ke email HR kami.', '[\"Python\", \"TensorFlow\", \"PyTorch\", \"SQL\", \"Docker\", \"Git\", \"Machine Learning\"]', 1, '2025-05-16 03:56:40', '2025-06-13 02:05:53'),
(2, 'PT Maju Bersama', 2, 2, 'Lembaga keuangan terpercaya sejak 1980.', 'PT Maju Bersama adalah salah satu Badan Usaha Milik Negara (BUMN) yang bergerak di sektor keuangan...', 'https://placehold.co/100x100/A2D9CE/1E8449?text=MB&font=Roboto', 'https://placehold.co/600x400/A2D9CE/1E8449?text=Maju+Bersama+Detail&font=Roboto', 'Jl. Keuangan Utama No. 45, Surabaya', 'https://majubersama.example.com', 'rekrutmen@majubersama.example.com', '031-7654321', '[\"Pemahaman mendalam tentang industri keuangan.\", \"Pengalaman praktis dalam operasional lembaga keuangan besar.\"]', 'Mahasiswa dengan minat di bidang keuangan dipersilakan melamar.', '[\"Java\", \"Spring Boot\", \"Oracle DB\", \"React\", \"Microservices\", \"Financial Analysis\"]', 1, '2025-05-16 03:56:40', '2025-06-13 02:05:53'),
(3, 'GoTo (Gojek/Tokopedia)', 8, 5, 'Super-app terdepan di Asia Tenggara yang mencakup layanan on-demand, e-commerce, dan fintech.', 'Sebagai hasil merger antara Gojek dan Tokopedia, GoTo menjadi ekosistem digital terbesar di Indonesia. Magang di sini memberikan kesempatan untuk bekerja pada produk dengan skala masif yang digunakan oleh jutaan orang setiap hari.', 'https://placehold.co/100x100/00AA13/FFFFFF?text=GoTo', 'https://placehold.co/600x400/00AA13/FFFFFF?text=GoTo+Ecosystem', 'Pasaraya Blok M, Gedung B, Lt. 6-7, Jakarta Selatan', 'https://www.gotocompany.com/', 'recruitment@gotocompany.com', 'N/A', '[\"Bekerja pada produk skala besar\", \"Lingkungan kerja yang cepat dan inovatif\", \"Kesempatan belajar dari talenta terbaik di bidang teknologi\"]', 'GoTo secara rutin membuka program magang melalui halaman karir resmi mereka. Proses seleksi biasanya meliputi tes online dan wawancara teknis.', '[\"Go\", \"Java\", \"Kotlin\", \"Swift\", \"Python\", \"React\", \"Vue.js\", \"Kubernetes\", \"Docker\", \"GCP\", \"AWS\", \"BigQuery\", \"Data Science\", \"Machine Learning\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(4, 'Traveloka', 1, 5, 'Platform travel dan gaya hidup terkemuka di Asia Tenggara.', 'Traveloka menyediakan berbagai layanan mulai dari tiket pesawat, hotel, hingga aktivitas liburan dan layanan keuangan. Anda akan bekerja di lingkungan yang data-driven untuk menciptakan produk yang memudahkan perjalanan jutaan pengguna.', 'https://placehold.co/100x100/0396DD/FFFFFF?text=Tvlk', 'https://placehold.co/600x400/0396DD/FFFFFF?text=Traveloka', 'Traveloka Campus, BSD Green Office Park, Tangerang', 'https://www.traveloka.com/careers', 'recruitment@traveloka.com', 'N/A', '[\"Budaya rekayasa perangkat lunak yang kuat\", \"Fokus pada data untuk pengambilan keputusan\", \"Manfaat dan lingkungan kerja yang kompetitif\"]', 'Lowongan magang biasanya tersedia untuk posisi Software Engineer, Data Analyst, dan Product Manager. Cek portal karir Traveloka untuk informasi terbaru.', '[\"Java\", \"Python\", \"Node.js\", \"React\", \"Kubernetes\", \"AWS\", \"Data Analytics\", \"Machine Learning\", \"Mobile Development (Android/iOS)\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(5, 'Bukalapak', 8, 3, 'Salah satu pelopor e-commerce di Indonesia dengan misi memberdayakan UMKM.', 'Bukalapak fokus pada inovasi untuk membantu jutaan warung dan pelaku UMKM di seluruh Indonesia agar dapat bersaing di era digital. Budaya kerja di Bukalapak sangat terbuka dan kolaboratif.', 'https://placehold.co/100x100/E31E52/FFFFFF?text=BL', 'https://placehold.co/600x400/E31E52/FFFFFF?text=Bukalapak', 'Metropolitan Tower, Jl. R.A. Kartini, Jakarta Selatan', 'https://careers.bukalapak.com/', 'join@bukalapak.com', 'N/A', '[\"Misi sosial yang kuat untuk UMKM\", \"Kesempatan untuk berinovasi dan bereksperimen\", \"Struktur tim yang agile dan dinamis\"]', 'Program magang di Bukalapak, seperti BukaMagang, dibuka secara berkala. Persiapkan portofolio Anda untuk menunjukkan kemampuan teknis.', '[\"Ruby on Rails\", \"Go\", \"Python\", \"React Native\", \"PostgreSQL\", \"Kubernetes\", \"Data Engineering\", \"Elasticsearch\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(6, 'Shopee Indonesia', 8, 4, 'Platform e-commerce dengan pertumbuhan terpesat di regional.', 'Shopee dikenal dengan inovasi gamifikasi dan kampanye marketing yang masif. Bekerja di Shopee berarti berada di lingkungan yang sangat kompetitif dan bergerak cepat, dengan fokus pada skalabilitas dan performa sistem.', 'https://placehold.co/100x100/EE4D2D/FFFFFF?text=Shopee', 'https://placehold.co/600x400/EE4D2D/FFFFFF?text=Shopee', 'Pacific Century Place Tower, SCBD, Jakarta', 'https://careers.shopee.co.id/', 'hr.id@shopee.com', 'N/A', '[\"Pengalaman di perusahaan e-commerce skala regional\", \"Fokus pada sistem berperforma tinggi\", \"Program pengembangan talenta yang terstruktur\"]', 'Shopee memiliki program magang yang terstruktur, seringkali untuk posisi backend, frontend, dan data. Proses seleksi dikenal cukup ketat.', '[\"Go\", \"Python\", \"C++\", \"React\", \"JavaScript\", \"TensorFlow\", \"Hadoop\", \"Spark\", \"MySQL\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(7, 'Google Indonesia', 1, 4, 'Perusahaan teknologi global dengan kantor perwakilan di Jakarta.', 'Meskipun sebagian besar tim engineering berada di luar negeri, magang di Google Indonesia memberikan wawasan tentang operasi bisnis, marketing, dan kebijakan untuk pasar lokal dari salah satu perusahaan paling berpengaruh di dunia.', 'https://placehold.co/100x100/4285F4/FFFFFF?text=G', 'https://placehold.co/600x400/4285F4/FFFFFF?text=Google', 'Pacific Century Place Tower, SCBD, Jakarta', 'https://careers.google.com/', 'N/A', 'N/A', '[\"Bekerja untuk perusahaan teknologi top dunia\", \"Budaya kerja yang suportif dan inklusif\", \"Jaringan global dan standar kerja yang tinggi\"]', 'Program magang Google sangat kompetitif dan biasanya diumumkan di situs karir global mereka. Proses seleksi sangat komprehensif.', '[\"Java\", \"C++\", \"Python\", \"Go\", \"JavaScript\", \"Android\", \"iOS\", \"Kubernetes\", \"TensorFlow\", \"GCP\", \"Distributed Systems\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(8, 'Microsoft Indonesia', 1, 4, 'Raksasa perangkat lunak global dengan fokus pada solusi cloud dan enterprise.', 'Microsoft Indonesia berfokus pada adopsi teknologi cloud (Azure), solusi bisnis, dan kemitraan dengan pemerintah serta perusahaan lokal. Magang di sini akan memberikan pengalaman di dunia enterprise software.', 'https://placehold.co/100x100/00A4EF/FFFFFF?text=MS', 'https://placehold.co/600x400/00A4EF/FFFFFF?text=Microsoft', 'Indonesia Stock Exchange Building, Tower II, Jakarta', 'https://careers.microsoft.com/', 'N/A', 'N/A', '[\"Eksposur pada teknologi cloud dan enterprise\", \"Program mentoring yang baik\", \"Kesempatan untuk mendapatkan sertifikasi Microsoft\"]', 'Microsoft membuka program magang secara global dan lokal. Posisi yang tersedia biasanya terkait dengan teknologi cloud, penjualan teknis, dan konsultasi.', '[\"C#\", \".NET\", \"Azure\", \"SQL Server\", \"TypeScript\", \"Python\", \"Power BI\", \"Dynamics 365\", \"Machine Learning\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(9, 'PT Bank Central Asia Tbk (BCA)', 2, 3, 'Bank swasta terbesar di Indonesia dengan inovasi digital yang kuat.', 'BCA dikenal dengan layanan perbankan yang andal dan inovasi di bidang digital banking (myBCA, blu). Magang di divisi IT BCA memberikan kesempatan untuk bekerja pada sistem perbankan modern yang melayani jutaan transaksi.', 'https://placehold.co/100x100/003399/FFFFFF?text=BCA', 'https://placehold.co/600x400/003399/FFFFFF?text=BCA', 'Menara BCA, Grand Indonesia, Jl. M.H. Thamrin, Jakarta Pusat', 'https://karir.bca.co.id/', 'hrd@bca.co.id', '(021) 23588000', '[\"Terlibat dalam sistem finansial yang kritikal\", \"Fokus pada keamanan dan keandalan sistem\", \"Program pengembangan IT yang komprehensif (BCA IT Trainee)\"]', 'BCA membuka program magang bakti serta program trainee IT yang sangat populer. Cek situs karir mereka untuk informasi detail.', '[\"Java\", \".NET\", \"COBOL\", \"SQL Server\", \"Oracle\", \"Mobile Development (Android/iOS)\", \"API Management\", \"Cybersecurity\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02'),
(10, 'PT Telkom Indonesia (Persero) Tbk', 1, 2, 'BUMN telekomunikasi terbesar di Indonesia.', 'Telkom tidak hanya menyediakan layanan telekomunikasi, tetapi juga merambah ke bisnis digital, data center, dan solusi enterprise. Magang di Telkom memberikan wawasan tentang infrastruktur digital nasional.', 'https://placehold.co/100x100/D90000/FFFFFF?text=Telkom', 'https://placehold.co/600x400/D90000/FFFFFF?text=Telkom+Indonesia', 'Telkom Landmark Tower, Jl. Jend. Gatot Subroto, Jakarta', 'https://rekrutmen.telkom.co.id/', 'rekrutmen@telkom.co.id', '147', '[\"Berkontribusi pada infrastruktur digital nasional\", \"Skala proyek yang sangat besar\", \"Beragamnya bidang bisnis dari jaringan hingga digital platform\"]', 'Telkom Group memiliki program magang terpadu yang diumumkan melalui portal rekrutmen resmi mereka.', '[\"Java\", \"Python\", \"Go\", \"JavaScript\", \"Cloud Computing\", \"Network Engineering\", \"IoT\", \"Big Data\", \"Fiber Optics\"]', 1, '2025-06-13 02:03:02', '2025-06-13 02:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `company_categories`
--

CREATE TABLE `company_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL COMMENT 'Untuk URL-friendly filter',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_categories`
--

INSERT INTO `company_categories` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Teknologi', 'teknologi', '2025-05-16 03:56:40'),
(2, 'Keuangan', 'keuangan', '2025-05-16 03:56:40'),
(3, 'Manufaktur', 'manufaktur', '2025-05-16 03:56:40'),
(4, 'Energi & Pertambangan', 'energi-pertambangan', '2025-05-16 03:56:40'),
(5, 'Transportasi & Logistik', 'transportasi-logistik', '2025-05-16 03:56:40'),
(6, 'Pendidikan', 'pendidikan', '2025-05-16 03:56:40'),
(7, 'Kesehatan', 'kesehatan', '2025-05-16 03:56:40'),
(8, 'E-commerce', 'e-commerce', '2025-06-13 02:02:56'),
(9, 'Startup', 'startup', '2025-06-13 02:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `company_types`
--

CREATE TABLE `company_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'e.g., PT, BUMN, Swasta, Startup',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_types`
--

INSERT INTO `company_types` (`id`, `name`, `created_at`) VALUES
(1, 'PT (Perseroan Terbatas)', '2025-05-16 03:56:40'),
(2, 'BUMN (Badan Usaha Milik Negara)', '2025-05-16 03:56:40'),
(3, 'Swasta Nasional', '2025-05-16 03:56:40'),
(4, 'Swasta Asing (PMA)', '2025-05-16 03:56:40'),
(5, 'Startup', '2025-05-16 03:56:40'),
(6, 'Lembaga Pemerintah', '2025-05-16 03:56:40'),
(7, 'Organisasi Nirlaba', '2025-05-16 03:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nim` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Hashed password',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Path to avatar file or URL',
  `bio` text DEFAULT NULL,
  `semester` int(2) DEFAULT NULL,
  `ipk` decimal(3,2) DEFAULT NULL,
  `kota_asal` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `is_profile_complete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Not complete, 1 = Complete',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `email`, `nim`, `password`, `avatar`, `bio`, `semester`, `ipk`, `kota_asal`, `kecamatan`, `kelurahan`, `is_profile_complete`, `created_at`, `updated_at`) VALUES
(1, 'RAIHAN NURHADI', 'kanami.etou21@gmail.com', '062340833117', '$2y$10$HMRqRg/FZC34x5ylyxtrLuqwqMG9.65zbIy1Eekn.jDil7mhV.4.m', 'https://i.ibb.co/gFJHyVxw/profile-merah.jpg', 'RAIHAN WOI', 4, 3.58, 'PALEMBANG', '16 ULU', 'SEBERANG ULU II', 1, '2025-05-16 03:58:58', '2025-06-10 07:01:17'),
(2, 'NOVAL FADILLAH', 'novalanjay@gmail.com', '062340833119', '$2y$10$gvCknMBykOCajjnm9PMZDOZ6ZH/4t7A3UX699NaA3fgXWAcd3xasu', 'https://placehold.co/80x80/3498db/ffffff?text=N', '', NULL, NULL, NULL, NULL, NULL, 0, '2025-05-16 06:36:00', '2025-05-16 06:36:20'),
(3, 'Lutfi Ramadhan', 'lutfi@gmail.com', '062340833116', '$2y$10$wGNCwS/U15qQe1R9G4jT.eQAYb/7fL7Lg9I1qXQpt0Oaw6tiAWtpK', 'https://placehold.co/80x80/3498db/ffffff?text=L', NULL, 5, NULL, NULL, NULL, NULL, 0, '2025-05-18 18:33:46', '2025-05-18 18:33:46'),
(4, 'AIDIL PACE', 'pace@gmail.com', '062340833115', '$2y$10$HMcndsiSxq5fsS76J3AXI.Mdos1tPs4WiMyK2ErQ7qEOHn3GNUq0e', 'https://placehold.co/80x80/3498db/ffffff?text=A', NULL, 5, NULL, NULL, NULL, NULL, 0, '2025-05-19 12:53:36', '2025-05-19 12:53:36'),
(5, 'Noval Fadillah', 'nf73663@gmail.com', '06234765', '$2y$10$6wJdj8nrlVLYhP1WICc.9ucyN7QI26MT7e1NcSxpH.BIF6X.w9wMS', 'https://placehold.co/80x80/3498db/ffffff?text=N', 'gada', 4, 4.00, 'PAlembang', '1 ulu', 'mojopahit', 1, '2025-05-26 14:20:30', '2025-05-27 09:05:30'),
(6, 'Ajeng alieffiyah', 'ajengalieffiyah@gmail.com', '31111', '$2y$10$OCy0439ipZz9SsAyGMvUUeyEPl4k2jO0hQUk3qcNiNwx7vfxCY0dW', 'https://placehold.co/80x80/3498db/ffffff?text=A', 'aaa', 4, 4.00, 'Palembang', 'Ilir barat 1', 'bukit baru', 1, '2025-06-03 06:53:11', '2025-06-03 07:00:54'),
(7, 'noval Fadillah', 'nf@gmial.com', '062340833122', '$2y$10$6O9DJj1VqzuFOk9Nf0kenOCFYk0xfCoTP9vWOf9nPLynK.cXP9Wpq', '/SikmaV3/Frontend/uploads/avatars/7_1749540039_soal_akuntansi.png', 'saya noval', 4, 2.00, 'PALEMBANG', '16 ULU', 'SEBERANG ULU II', 1, '2025-06-10 07:13:05', '2025-06-10 07:20:39'),
(8, 'Noval Fadillah', 'noval123@gmail.com', '062340833127', '$2y$10$7PwNlYmtvht94MjYtJaERuAEoFXoLXVLg0nekpRRUBWH6rearL0Pa', 'https://placehold.co/80x80/3498db/ffffff?text=N', 'ffffffffffffffffffffffffffffffff', 4, 4.00, 'PALEMBANG', '16 ULU', 'SEBERANG ULU II', 1, '2025-06-13 01:23:51', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_education_history`
--

CREATE TABLE `user_education_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `degree` varchar(100) DEFAULT NULL COMMENT 'e.g., S1, D3, SMA/SMK',
  `field_of_study` varchar(255) DEFAULT NULL COMMENT 'e.g., Teknik Informatika',
  `start_date` varchar(7) DEFAULT NULL COMMENT 'Format YYYY-MM',
  `end_date` varchar(7) DEFAULT NULL COMMENT 'Format YYYY-MM, NULL if ongoing',
  `description` text DEFAULT NULL COMMENT 'Nilai, kegiatan, pencapaian',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_education_history`
--

INSERT INTO `user_education_history` (`id`, `user_id`, `institution_name`, `degree`, `field_of_study`, `start_date`, `end_date`, `description`, `created_at`, `updated_at`) VALUES
(18, 6, 'polsri', 'd4', 'mi', '2025-01', '2025-02', '', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(24, 7, 'Sma N 1 Palembang', 'sma', 'ipa', '2025-07', NULL, '', '2025-06-10 07:20:39', '2025-06-10 07:20:39'),
(43, 8, 'smk', 'smk', 'mesin', '2025-01', NULL, '', '2025-06-13 04:29:07', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_frameworks`
--

CREATE TABLE `user_frameworks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `framework_name` varchar(100) NOT NULL,
  `skill_level` varchar(50) DEFAULT NULL,
  `experience_duration` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_frameworks`
--

INSERT INTO `user_frameworks` (`id`, `user_id`, `framework_name`, `skill_level`, `experience_duration`, `created_at`, `updated_at`) VALUES
(24, 5, 'react.js', 'Menengah', '', '2025-05-27 09:05:30', '2025-05-27 09:05:30'),
(29, 6, 'mysql', 'Dasar', '1 tahun', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(31, 1, 'laravel', '', '', '2025-06-10 07:01:17', '2025-06-10 07:01:17'),
(37, 7, 'laravel', 'Pemula', '', '2025-06-10 07:20:39', '2025-06-10 07:20:39'),
(56, 8, 'laravel', 'Pemula', '1 tahun', '2025-06-13 04:29:07', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_industry_preferences`
--

CREATE TABLE `user_industry_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `industry_name` varchar(150) NOT NULL COMMENT 'e.g., Fintech, E-commerce, Edukasi',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_industry_preferences`
--

INSERT INTO `user_industry_preferences` (`id`, `user_id`, `industry_name`, `created_at`, `updated_at`) VALUES
(5, 6, 'e commerce', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(11, 7, 'fintech', '2025-06-10 07:20:39', '2025-06-10 07:20:39'),
(30, 8, 'Teknologi', '2025-06-13 04:29:07', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_other_skills`
--

CREATE TABLE `user_other_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_name` varchar(150) NOT NULL,
  `skill_level` varchar(50) DEFAULT NULL,
  `experience_duration` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_other_skills`
--

INSERT INTO `user_other_skills` (`id`, `user_id`, `skill_name`, `skill_level`, `experience_duration`, `created_at`, `updated_at`) VALUES
(19, 6, 'javascript', 'Dasar', '1 tahun', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(21, 1, 'public speaking', '', '', '2025-06-10 07:01:17', '2025-06-10 07:01:17'),
(40, 8, 'menyanyi', 'Pemula', '1 tahun', '2025-06-13 04:29:07', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_programming_skills`
--

CREATE TABLE `user_programming_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `skill_level` varchar(50) DEFAULT NULL COMMENT 'e.g., Dasar, Menengah, Mahir',
  `experience_duration` varchar(100) DEFAULT NULL COMMENT 'e.g., 1 tahun, 6 bulan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_programming_skills`
--

INSERT INTO `user_programming_skills` (`id`, `user_id`, `skill_name`, `skill_level`, `experience_duration`, `created_at`, `updated_at`) VALUES
(33, 5, 'javascript', 'Menengah', '', '2025-05-27 09:05:30', '2025-05-27 09:05:30'),
(38, 6, 'php', 'Dasar', '1 tahun', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(40, 1, 'R', 'Menengah', '2 Bulan', '2025-06-10 07:01:17', '2025-06-10 07:01:17'),
(46, 7, 'py', 'Pemula', '1 tahun', '2025-06-10 07:20:39', '2025-06-10 07:20:39'),
(65, 8, 'Python', 'Dasar', '1 tahun', '2025-06-13 04:29:07', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_remember_tokens`
--

CREATE TABLE `user_remember_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `selector` varchar(32) NOT NULL,
  `validator_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_social_links`
--

CREATE TABLE `user_social_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `platform_name` varchar(100) NOT NULL COMMENT 'e.g., LinkedIn, GitHub, Portfolio',
  `url` varchar(512) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_social_links`
--

INSERT INTO `user_social_links` (`id`, `user_id`, `platform_name`, `url`, `created_at`, `updated_at`) VALUES
(5, 6, 'Instagram', 'https://www.instagram.com/', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(11, 7, 'GitHub', 'gituhut', '2025-06-10 07:20:39', '2025-06-10 07:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_tools`
--

CREATE TABLE `user_tools` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `tool_name` varchar(150) NOT NULL,
  `skill_level` varchar(50) DEFAULT NULL COMMENT 'e.g., Dasar, Menengah, Mahir, Sering Digunakan',
  `experience_duration` varchar(100) DEFAULT NULL COMMENT 'e.g., 1 tahun, 6 bulan, >2 tahun',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_tools`
--

INSERT INTO `user_tools` (`id`, `user_id`, `tool_name`, `skill_level`, `experience_duration`, `created_at`, `updated_at`) VALUES
(18, 5, 'visual studio code', '', '', '2025-05-27 09:05:30', '2025-05-27 09:05:30'),
(23, 6, 'php', 'Dasar', '1 tahun', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(25, 1, 'vs code', '', '', '2025-06-10 07:01:17', '2025-06-10 07:01:17'),
(31, 7, 'android studio', 'Dasar', '', '2025-06-10 07:20:39', '2025-06-10 07:20:39'),
(50, 8, 'vs code', 'Dasar', '1 tahun', '2025-06-13 04:29:07', '2025-06-13 04:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_work_experience`
--

CREATE TABLE `user_work_experience` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `start_date` varchar(7) DEFAULT NULL COMMENT 'Format YYYY-MM',
  `end_date` varchar(7) DEFAULT NULL COMMENT 'Format YYYY-MM, NULL if current',
  `description` text DEFAULT NULL COMMENT 'Tanggung jawab, proyek, pencapaian',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_work_experience`
--

INSERT INTO `user_work_experience` (`id`, `user_id`, `company_name`, `job_title`, `start_date`, `end_date`, `description`, `created_at`, `updated_at`) VALUES
(6, 6, 'pln', 'web developer', '2025-01', '2025-02', '', '2025-06-03 07:00:54', '2025-06-03 07:00:54'),
(12, 7, 'ml', 'backend', '2025-01', NULL, '', '2025-06-10 07:20:39', '2025-06-10 07:20:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_idx` (`category_id`),
  ADD KEY `type_id_idx` (`type_id`);

--
-- Indexes for table `company_categories`
--
ALTER TABLE `company_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD UNIQUE KEY `slug_unique` (`slug`);

--
-- Indexes for table `company_types`
--
ALTER TABLE `company_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD UNIQUE KEY `nim_unique` (`nim`);

--
-- Indexes for table `user_education_history`
--
ALTER TABLE `user_education_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `user_frameworks`
--
ALTER TABLE `user_frameworks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_framework_unique` (`user_id`,`framework_name`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `user_industry_preferences`
--
ALTER TABLE `user_industry_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_industry_preference_unique` (`user_id`,`industry_name`),
  ADD KEY `user_id_idx_industry_pref` (`user_id`);

--
-- Indexes for table `user_other_skills`
--
ALTER TABLE `user_other_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_other_skill_unique` (`user_id`,`skill_name`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `user_programming_skills`
--
ALTER TABLE `user_programming_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_skill_unique` (`user_id`,`skill_name`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `user_remember_tokens`
--
ALTER TABLE `user_remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_social_links`
--
ALTER TABLE `user_social_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_platform_unique` (`user_id`,`platform_name`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `user_tools`
--
ALTER TABLE `user_tools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tool_unique` (`user_id`,`tool_name`),
  ADD KEY `user_id_idx_tools` (`user_id`);

--
-- Indexes for table `user_work_experience`
--
ALTER TABLE `user_work_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company_categories`
--
ALTER TABLE `company_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `company_types`
--
ALTER TABLE `company_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_education_history`
--
ALTER TABLE `user_education_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user_frameworks`
--
ALTER TABLE `user_frameworks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_industry_preferences`
--
ALTER TABLE `user_industry_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_other_skills`
--
ALTER TABLE `user_other_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_programming_skills`
--
ALTER TABLE `user_programming_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `user_remember_tokens`
--
ALTER TABLE `user_remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_social_links`
--
ALTER TABLE `user_social_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_tools`
--
ALTER TABLE `user_tools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `user_work_experience`
--
ALTER TABLE `user_work_experience`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `fk_company_category` FOREIGN KEY (`category_id`) REFERENCES `company_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_company_type` FOREIGN KEY (`type_id`) REFERENCES `company_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user_education_history`
--
ALTER TABLE `user_education_history`
  ADD CONSTRAINT `fk_education_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_frameworks`
--
ALTER TABLE `user_frameworks`
  ADD CONSTRAINT `fk_framework_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_industry_preferences`
--
ALTER TABLE `user_industry_preferences`
  ADD CONSTRAINT `fk_industry_preference_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_other_skills`
--
ALTER TABLE `user_other_skills`
  ADD CONSTRAINT `fk_other_skill_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_programming_skills`
--
ALTER TABLE `user_programming_skills`
  ADD CONSTRAINT `fk_prog_skill_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_remember_tokens`
--
ALTER TABLE `user_remember_tokens`
  ADD CONSTRAINT `user_remember_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_social_links`
--
ALTER TABLE `user_social_links`
  ADD CONSTRAINT `fk_social_link_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_tools`
--
ALTER TABLE `user_tools`
  ADD CONSTRAINT `fk_tool_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_work_experience`
--
ALTER TABLE `user_work_experience`
  ADD CONSTRAINT `fk_experience_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
