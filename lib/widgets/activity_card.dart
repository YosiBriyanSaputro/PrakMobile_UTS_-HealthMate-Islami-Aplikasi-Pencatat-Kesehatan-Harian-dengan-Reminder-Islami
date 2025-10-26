import 'package:flutter/material.dart';

/// Widget ActivityCard digunakan untuk menampilkan
/// satu item aktivitas dalam bentuk kartu interaktif.
/// Komponen ini bersifat reusable (dapat digunakan berulang kali)
/// di berbagai halaman aplikasi, seperti ActivityPage.

class ActivityCard extends StatelessWidget {
  // Deklarasi properti yang digunakan oleh kartu aktivitas.
  // Properti bersifat final karena nilainya tidak berubah.
  final String icon;         // Emoji atau ikon aktivitas
  final String title;        // Judul aktivitas
  final String subtitle;     // Deskripsi singkat aktivitas
  final VoidCallback onTap;  // Aksi ketika kartu ditekan (navigasi ke detail)

  // Konstruktor dengan parameter wajib (required) agar semua nilai harus diisi
  const ActivityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Widget utama menggunakan Card untuk menampilkan tampilan seperti kartu
    return Card(
      // Memberi jarak di sisi kiri-kanan dan atas-bawah
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      // ListTile digunakan untuk menyusun konten utama kartu (ikon, teks, dan panah)
      child: ListTile(
        // Fungsi yang dijalankan ketika kartu ditekan
        onTap: onTap,

        // Menampilkan ikon (emoji) di bagian kiri
        leading: Text(icon, style: const TextStyle(fontSize: 28)),

        // Menampilkan judul aktivitas dengan teks tebal
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),

        // Menampilkan deskripsi singkat aktivitas di bawah judul
        subtitle: Text(subtitle),

        // Menampilkan ikon panah kecil di bagian kanan kartu
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
