import 'package:flutter/material.dart';

// Halaman untuk mencatat makanan harian pengguna
class FoodTrackerPage extends StatefulWidget {
  const FoodTrackerPage({super.key});

  @override
  State<FoodTrackerPage> createState() => _FoodTrackerPageState();
}

class _FoodTrackerPageState extends State<FoodTrackerPage> {
  // List untuk menyimpan data makanan dalam bentuk Map (nama dan kalori)
  final List<Map<String, String>> _foods = [];

  // Fungsi untuk menambahkan data makanan baru
  void _addFood() {
    // Controller untuk mengambil input nama makanan dan kalori
    final name = TextEditingController();
    final cal = TextEditingController();

    // Menampilkan dialog input data makanan
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Tambah Makanan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Input nama makanan
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Nama Makanan'),
            ),
            const SizedBox(height: 8),
            // Input jumlah kalori
            TextField(
              controller: cal,
              decoration: const InputDecoration(labelText: 'Kalori (kcal)'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          // Tombol batal
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: const Text('Batal'),
          ),
          // Tombol simpan
          ElevatedButton(
            onPressed: () {
              // Validasi input: hanya disimpan jika nama makanan tidak kosong
              if (name.text.isNotEmpty) {
                // Menambahkan data baru ke dalam list _foods
                setState(() => _foods.add({'name': name.text, 'cal': cal.text}));
                // Menutup dialog setelah data disimpan
                Navigator.pop(c);
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menghapus data makanan berdasarkan indeks
  void _delete(int i) => setState(() => _foods.removeAt(i));

  // Fungsi untuk menghitung total kalori dari seluruh makanan yang tercatat
  int _totalCalories() {
    int sum = 0;
    for (var f in _foods) {
      // Mengonversi kalori dari string ke integer dan menambahkannya ke total
      sum += int.tryParse(f['cal'] ?? '0') ?? 0;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    // Struktur tampilan utama halaman
    return Scaffold(
      appBar: AppBar(title: const Text('Food Tracker')), // Judul halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // Kartu ringkasan total kalori
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.teal.shade50,
                child: ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: const Text('Catat makanan harian'),
                  subtitle: Text('Total kalori: ${_totalCalories()} kcal'),
                ),
              ),
              const SizedBox(height: 10),
              // Bagian daftar makanan
              Expanded(
                child: _foods.isEmpty
                    // Pesan jika belum ada makanan yang dicatat
                    ? const Center(child: Text('Belum ada makanan yang dicatat.'))
                    // List makanan yang sudah dimasukkan
                    : ListView.builder(
                        itemCount: _foods.length,
                        itemBuilder: (ctx, i) {
                          final f = _foods[i];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              // Menampilkan nama dan kalori makanan
                              title: Text(f['name'] ?? ''),
                              subtitle: Text('${f['cal'] ?? '0'} kcal'),
                              // Tombol hapus data makanan
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.redAccent),
                                onPressed: () => _delete(i),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      // Tombol tambah makanan (Floating Action Button)
      floatingActionButton: FloatingActionButton(
        onPressed: _addFood, // Memanggil fungsi untuk menambah makanan
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
