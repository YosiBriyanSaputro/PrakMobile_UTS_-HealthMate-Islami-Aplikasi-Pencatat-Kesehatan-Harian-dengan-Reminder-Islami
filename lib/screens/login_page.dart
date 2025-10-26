import 'package:flutter/material.dart';

// Halaman Login untuk aplikasi HealthMate Islami
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// State dari halaman LoginPage
class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangani input email dan password
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Variabel untuk menyembunyikan atau menampilkan password
  bool _obscure = true;

  // Fungsi login sederhana (dummy authentication)
  void _login() {
    final email = emailController.text.trim(); // mengambil input email
    final pass = passController.text.trim();  // mengambil input password

    // Jika email dan password sesuai, maka masuk ke halaman utama
    if (email == 'user@test.com' && pass == '12345') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Jika salah, tampilkan notifikasi error menggunakan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email atau password salah. (user@test.com / 12345)')),
      );
    }
  }

  // Fungsi untuk membebaskan memori ketika widget tidak digunakan
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Struktur utama halaman login menggunakan Scaffold
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          // Menggunakan SingleChildScrollView agar tampilan bisa digulir
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Logo aplikasi di bagian atas
                Image.asset('assets/logo.png', height: 86),
                const SizedBox(height: 12),

                // Judul halaman login
                Text(
                  'Selamat Datang',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),

                // Deskripsi singkat di bawah judul
                Text(
                  'Masuk untuk melihat progress kesehatan harianmu',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),

                // Card berisi form input email dan password
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        // Input field untuk email
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 12),

                        // Input field untuk password
                        TextField(
                          controller: passController,
                          obscureText: _obscure, // jika true, password tersembunyi
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Password',

                            // Tombol untuk toggle (menampilkan/menyembunyikan password)
                            suffixIcon: IconButton(
                              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _obscure = !_obscure),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Tombol utama untuk login
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: Colors.teal,
                          ),
                          onPressed: _login, // memanggil fungsi login
                          child: const Text('Masuk'),
                        ),
                        const SizedBox(height: 8),

                        // Tombol navigasi ke halaman Register
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/register'),
                          child: const Text('Belum punya akun? Daftar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
