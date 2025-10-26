import 'package:flutter/material.dart';
import '../main.dart';

// Halaman Pengaturan (SettingsPage)
// Berfungsi untuk menampilkan pengaturan profil, mode gelap, dan fitur logout pengguna.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Menyimpan status mode tema (gelap/terang)
  bool isDark = themeNotifier.value == ThemeMode.dark;

  // Fungsi untuk mengganti tema aplikasi
  void _toggle(bool v) {
    setState(() => isDark = v); // Update nilai state
    themeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light; // Mengubah tema global
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _logout() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Konfirmasi Logout'), // Judul dialog
        content: const Text('Keluar dari akun dan kembali ke halaman Welcome?'), // Isi pesan konfirmasi
        actions: [
          // Tombol Batal untuk menutup dialog
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: const Text('Batal'),
          ),
          // Tombol Logout untuk keluar dan kembali ke halaman WelcomePage
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              Navigator.pop(c); // Tutup dialog
              // Arahkan pengguna ke halaman awal (WelcomePage) dan hapus semua halaman sebelumnya
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Struktur utama halaman pengaturan
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')), // Judul halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Kartu Profil Pengguna
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  // Menampilkan foto profil dari folder assets
                  leading: const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  title: const Text('Yosi Nurmaulana'), // Nama pengguna
                  subtitle: const Text('user@test.com'), // Email pengguna
                  // Tombol edit profil (belum diimplementasikan)
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Edit profil (belum tersedia)')),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Switch untuk mengaktifkan atau menonaktifkan mode gelap
              SwitchListTile(
                value: isDark, // Nilai status mode gelap saat ini
                onChanged: _toggle, // Fungsi pemicu perubahan
                title: const Text('Mode Gelap'),
                subtitle: const Text('Ubah tampilan aplikasi'),
              ),

              const SizedBox(height: 8),

              // Informasi versi aplikasi
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Tentang'),
                subtitle: const Text('HealthMate Islami - Versi UTS'),
              ),

              const Spacer(), // Memberi jarak agar tombol logout berada di bagian bawah

              // Tombol Logout
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: _logout, // Memanggil fungsi logout
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
