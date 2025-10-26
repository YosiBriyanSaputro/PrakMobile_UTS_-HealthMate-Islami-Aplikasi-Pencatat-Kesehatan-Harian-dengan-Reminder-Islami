import 'package:flutter/material.dart';

// Halaman utama (Beranda) aplikasi HealthMate Islami
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Widget untuk menampilkan kartu statistik seperti jumlah air/minum dan olahraga
  Widget _statCard(BuildContext ctx, IconData icon, String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // sudut membulat
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Ikon dalam lingkaran warna primer
            CircleAvatar(
              backgroundColor: Theme.of(ctx).colorScheme.primaryContainer,
              child: Icon(icon, color: Theme.of(ctx).colorScheme.onPrimaryContainer),
            ),
            const SizedBox(width: 12),
            // Teks judul dan nilai statistik
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget tombol menu cepat menuju halaman lain (Water, Food, Exercise, Notes)
  Widget _menuButton(BuildContext context, IconData icon, String title, String route) {
    return InkWell(
      // Ketika ditekan, pindah ke halaman berdasarkan route
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)], // efek bayangan
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.teal), // ikon utama menu
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center), // nama menu
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Hadits islami yang ditampilkan di bagian atas halaman
    const hadith = '“Sesungguhnya tubuhmu memiliki hak atasmu.” (HR. Bukhari)';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'), // Judul halaman
        actions: [
          // Tombol ke halaman Pengaturan (Settings)
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Pengaturan',
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Sapaan awal kepada pengguna
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Assalamu’alaikum',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              // Kartu berisi hadits islami dan logo aplikasi
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Colors.teal.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          hadith,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      // Menampilkan logo aplikasi di sisi kanan
                      Image.asset('assets/logo.png', height: 36),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Menampilkan dua kartu kecil berisi statistik kesehatan
              Row(
                children: [
                  Expanded(
                      child: _statCard(context, Icons.local_drink, 'Air (hari ini)', '4 / 8')),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _statCard(context, Icons.fitness_center, 'Olahraga', '20 menit')),
                ],
              ),
              const SizedBox(height: 14),

              // Judul bagian menu cepat
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Menu Cepat', style: Theme.of(context).textTheme.titleMedium),
              ),
              const SizedBox(height: 8),

              // Grid berisi 4 tombol menu utama
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // dua kolom
                  crossAxisSpacing: 10, // jarak horizontal antar item
                  mainAxisSpacing: 10,  // jarak vertikal antar item
                  childAspectRatio: 1.4, // rasio lebar-tinggi tiap tombol
                  children: [
                    _menuButton(context, Icons.local_drink, 'Water Tracker', '/water'),
                    _menuButton(context, Icons.restaurant, 'Food Tracker', '/food'),
                    _menuButton(context, Icons.fitness_center, 'Exercise', '/exercise'),
                    _menuButton(context, Icons.note_alt, 'Catatan Pribadi', '/notes'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
