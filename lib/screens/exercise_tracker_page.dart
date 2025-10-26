import 'package:flutter/material.dart';

// Halaman ExerciseTrackerPage digunakan untuk mencatat aktivitas olahraga pengguna
class ExerciseTrackerPage extends StatefulWidget {
  const ExerciseTrackerPage({super.key});

  @override
  State<ExerciseTrackerPage> createState() => _ExerciseTrackerPageState();
}

// State untuk menyimpan dan mengelola data olahraga
class _ExerciseTrackerPageState extends State<ExerciseTrackerPage> {
  // List untuk menyimpan data olahraga (nama, durasi, dan waktu)
  final List<Map<String, String>> _list = [];

  // Fungsi untuk menambahkan data olahraga baru
  void _add() {
    // Controller untuk menangani input teks pengguna
    final name = TextEditingController();
    final dur = TextEditingController();

    // Menampilkan dialog input saat pengguna menekan tombol tambah (+)
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Tambah Olahraga'), // Judul dialog
        // Isi dialog: form input nama olahraga dan durasi
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Jenis Olahraga'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dur,
              decoration: const InputDecoration(labelText: 'Durasi (menit)'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        // Tombol aksi dalam dialog
        actions: [
          // Tombol untuk membatalkan input
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('Batal')),
          // Tombol untuk menyimpan data olahraga baru
          ElevatedButton(
            onPressed: () {
              if (name.text.isNotEmpty) {
                // Menambahkan data olahraga ke dalam list menggunakan setState()
                setState(() => _list.add({
                      'name': name.text,
                      'duration': dur.text,
                      // Menyimpan waktu saat aktivitas ditambahkan
                      'time': TimeOfDay.now().format(context)
                    }));
                Navigator.pop(c); // Menutup dialog setelah menyimpan
              }
            },
            child: const Text('Simpan'),
          )
        ],
      ),
    );
  }

  // Fungsi untuk menghapus data olahraga berdasarkan indeks
  void _delete(int i) => setState(() => _list.removeAt(i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise Tracker')), // Judul halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          // Jika list kosong, tampilkan teks pemberitahuan
          child: _list.isEmpty
              ? const Center(child: Text('Belum ada aktivitas olahraga.'))
              // Jika list berisi data, tampilkan daftar menggunakan ListView.builder
              : ListView.builder(
                  itemCount: _list.length, // Jumlah item sesuai data list
                  itemBuilder: (ctx, i) {
                    final e = _list[i]; // Mengambil data berdasarkan indeks
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(e['name'] ?? ''), // Menampilkan nama olahraga
                        subtitle: Text(
                            'Durasi: ${e['duration']} menit • ${e['time']}'), // Menampilkan durasi dan waktu
                        // Tombol hapus di sisi kanan
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _delete(i),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      // Tombol mengambang (FloatingActionButton) untuk menambah aktivitas baru
      floatingActionButton: FloatingActionButton(
        onPressed: _add, // Memanggil fungsi _add() saat ditekan
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add), // Ikon tambah "+"
      ),
    );
  }
}
