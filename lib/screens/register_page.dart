import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controller untuk menangani input teks dari pengguna
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Variabel untuk mengatur visibilitas password
  bool _obscure = true;

  // Fungsi yang dijalankan saat tombol "Daftar" ditekan
  void _register() {
    // Menampilkan notifikasi berupa snackbar (akun dibuat secara dummy)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Akun dibuat (dummy). Silakan login.')),
    );

    // Setelah 700 milidetik, kembali ke halaman sebelumnya (halaman login)
    Future.delayed(const Duration(milliseconds: 700), () => Navigator.pop(context));
  }

  @override
  void dispose() {
    // Membersihkan controller dari memori saat halaman ditutup
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menentukan warna latar belakang mengikuti tema aplikasi
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // Memberikan padding di sekitar isi halaman
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Menampilkan logo aplikasi dari folder assets
                Image.asset('assets/logo.png', height: 86),
                const SizedBox(height: 12),

                // Judul halaman
                Text(
                  'Daftar Akun Baru',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                // Card berisi form pendaftaran
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        // Input nama lengkap
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Nama Lengkap',
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Input email
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Input password (dapat disembunyikan/dilihat)
                        TextField(
                          controller: passController,
                          obscureText: _obscure,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Password',
                            // Tombol untuk menampilkan/menyembunyikan password
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () =>
                                  setState(() => _obscure = !_obscure),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Tombol untuk mendaftarkan akun
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: Colors.teal,
                          ),
                          onPressed: _register,
                          child: const Text('Daftar'),
                        ),

                        const SizedBox(height: 8),

                        // Tombol untuk kembali ke halaman login
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Sudah punya akun? Kembali'),
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
