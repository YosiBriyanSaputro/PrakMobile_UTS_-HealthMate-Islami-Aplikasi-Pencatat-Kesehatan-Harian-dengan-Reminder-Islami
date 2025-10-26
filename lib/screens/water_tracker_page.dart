import 'package:flutter/material.dart';

// Halaman untuk fitur Water Tracker (pencatat konsumsi air harian)
class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

// State class untuk mengelola logika dan tampilan halaman
class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int _count = 0; // Menyimpan jumlah gelas air yang telah diminum
  final int _goal = 8; // Target jumlah gelas air per hari

  // Fungsi untuk menambah jumlah air yang diminum (maksimal 8 gelas)
  void _add() {
    if (_count < _goal) setState(() => _count++);
  }

  // Fungsi untuk mereset jumlah minum kembali ke 0
  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    // Menghitung progres dalam bentuk persentase untuk indikator
    final progress = _count / _goal;

    return Scaffold(
      appBar: AppBar(title: const Text('Water Tracker')), // Judul halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          // Mengatur tampilan utama dalam bentuk kolom
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Judul kecil halaman
              Text('Minum Air Hari Ini', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),

              // Menampilkan jumlah air yang diminum
              Text('$_count / $_goal Gelas',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Indikator progres konsumsi air
              SizedBox(
                height: 12,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.teal.shade100,
                  valueColor: AlwaysStoppedAnimation(Colors.teal),
                ),
              ),
              const SizedBox(height: 18),

              // Kutipan Islami motivasi
              const Text('“Air adalah nikmat, syukuri dan jaga kesehatan tubuh.”',
                  textAlign: TextAlign.center),
              const SizedBox(height: 22),

              // Tombol untuk menambah jumlah air yang diminum
              ElevatedButton.icon(
                onPressed: _add,
                icon: const Icon(Icons.add),
                label: const Text('Tambah 1 Gelas'),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48), backgroundColor: Colors.teal),
              ),
              const SizedBox(height: 8),

              // Tombol untuk mengatur ulang jumlah air
              OutlinedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset')),
            ],
          ),
        ),
      ),
    );
  }
}
