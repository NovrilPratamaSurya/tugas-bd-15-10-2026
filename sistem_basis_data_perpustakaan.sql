-- SISTEM BASIS DATA PERPUSTAKAAN SEKOLAH
-- Materi: DDL, DML, dan DCL
-- Jalankan bagian secara berurutan menggunakan MySQL/phpMyAdmin.

-- =========================================
-- 1. DDL: Membuat database dan tabel
-- =========================================
CREATE DATABASE IF NOT EXISTS perpustakaan;
USE perpustakaan;

CREATE TABLE IF NOT EXISTS buku (
    id_buku INT AUTO_INCREMENT PRIMARY KEY,
    judul_buku VARCHAR(100) NOT NULL,
    pengarang VARCHAR(100) NOT NULL,
    tahun_terbit YEAR,
    stok INT NOT NULL DEFAULT 0
);

-- =========================================
-- 2. DML: Menambah, menampilkan, mengubah,
--    dan menghapus data
-- =========================================

-- Menambahkan tiga data buku
INSERT INTO buku (judul_buku, pengarang, tahun_terbit, stok)
VALUES
    ('Laskar Pelangi', 'Andrea Hirata', 2005, 10),
    ('Bumi', 'Tere Liye', 2014, 8),
    ('Negeri 5 Menara', 'Ahmad Fuadi', 2009, 12);

-- Menampilkan seluruh data buku
SELECT * FROM buku;

-- Mengubah stok buku dengan id_buku = 1
UPDATE buku
SET stok = 15
WHERE id_buku = 1;

-- Menghapus buku dengan id_buku = 3
DELETE FROM buku
WHERE id_buku = 3;

-- Menampilkan data setelah perubahan
SELECT * FROM buku;

-- =========================================
-- 3. DCL: Mengatur hak akses pengguna
-- Catatan:
-- Jalankan bagian ini menggunakan akun MySQL
-- yang memiliki hak untuk membuat pengguna dan GRANT.
-- Jika pengguna sudah ada, CREATE USER bisa dilewati.
-- =========================================

CREATE USER IF NOT EXISTS 'petugas'@'localhost'
IDENTIFIED BY 'petugas123';

GRANT SELECT, INSERT
ON perpustakaan.buku
TO 'petugas'@'localhost';

CREATE USER IF NOT EXISTS 'kepala'@'localhost'
IDENTIFIED BY 'kepala123';

GRANT SELECT
ON perpustakaan.buku
TO 'kepala'@'localhost';

-- Opsional: melihat hak akses yang diberikan
SHOW GRANTS FOR 'petugas'@'localhost';
SHOW GRANTS FOR 'kepala'@'localhost';
