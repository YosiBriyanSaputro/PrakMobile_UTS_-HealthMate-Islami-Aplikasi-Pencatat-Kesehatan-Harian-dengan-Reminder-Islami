import 'package:flutter/material.dart';                // Import library Flutter untuk komponen UI
import '../models/activity_model.dart';                // Import model Activity untuk mengambil data aktivitas

// Halaman detail aktivitas, menampilkan informasi lengkap dari satu aktivitas
class DetailPage extends StatelessWidget {
  final Activity? activity;                            // Variabel penampung data aktivitas (nullable)
  const DetailPage({super.key, required this.activity}); // Konstruktor menerima objek Activity dari halaman sebelumnya

  @override
  Widget build(BuildContext context) {
    // Jika data aktivitas kosong, tampilkan pesan bahwa data tidak tersedia
    if (activity == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Aktivitas')),
        body: const Center(child: Text('Data aktivitas tidak tersedia.')),
      );
    }

    // Jika data tersedia, tampilkan halaman detail lengkap
    return Scaffold(
      appBar: AppBar(title: Text(activity!.title)),    // Judul AppBar diambil dari nama aktivitas
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),           // Memberikan jarak padding di seluruh sisi halaman
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              // Menampilkan ikon aktivitas di bagian tengah
              Center(child: Text(activity!.icon, style: const TextStyle(fontSize: 56))),
              const SizedBox(height: 14),              // Jarak antar elemen
              
              // Menampilkan judul aktivitas
              Text(
                activity!.title, 
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Menampilkan deskripsi aktivitas
              Text(activity!.description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 18),

              // Menampilkan kutipan atau hadits Islami terkait aktivitas
              Container(
                width: double.infinity,                // Lebar mengikuti layar penuh
                padding: const EdgeInsets.all(14),     // Memberikan jarak dalam container
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,          // Warna latar lembut (soft green)
                  borderRadius: BorderRadius.circular(10), // Sudut membulat
                ),
                child: Text(
                  activity!.quote,                     // Menampilkan teks kutipan
                  style: const TextStyle(fontStyle: FontStyle.italic), // Huruf miring agar tampak berbeda
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
