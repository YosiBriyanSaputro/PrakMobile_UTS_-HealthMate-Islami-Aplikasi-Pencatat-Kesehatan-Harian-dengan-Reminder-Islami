import 'package:flutter/material.dart';

// Halaman NotesPage digunakan untuk mencatat catatan pribadi pengguna
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

// State dari NotesPage untuk menyimpan dan mengatur data catatan
class _NotesPageState extends State<NotesPage> {
  // List untuk menyimpan semua catatan pengguna
  final List<String> _notes = [];

  // Fungsi untuk menambahkan catatan baru
  void _add() {
    // Controller untuk mengambil input teks dari pengguna
    final c = TextEditingController();

    // Menampilkan dialog input catatan
    showDialog(
      context: context,
      builder: (d) => AlertDialog(
        title: const Text('Tambah Catatan'), // Judul dialog
        content: TextField(
          controller: c,
          decoration: const InputDecoration(hintText: 'Tulis catatan...'), // Placeholder input
        ),
        actions: [
          // Tombol batal untuk menutup dialog tanpa menyimpan catatan
          TextButton(onPressed: () => Navigator.pop(d), child: const Text('Batal')),

          // Tombol simpan untuk menambahkan catatan ke dalam list
          ElevatedButton(
            onPressed: () {
              // Mengecek jika input tidak kosong
              if (c.text.isNotEmpty) {
                // Menambahkan catatan baru ke list dan memperbarui tampilan
                setState(() => _notes.add(c.text));
                // Menutup dialog setelah menyimpan
                Navigator.pop(d);
              }
            },
            child: const Text('Simpan'),
          )
        ],
      ),
    );
  }

  // Fungsi untuk menghapus catatan berdasarkan indeks
  void _delete(int i) => setState(() => _notes.removeAt(i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Pribadi')), // Judul halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12), // Memberi jarak di sekitar isi halaman
          child: _notes.isEmpty
              // Jika belum ada catatan, tampilkan teks berikut
              ? const Center(child: Text('Belum ada catatan.'))
              // Jika sudah ada catatan, tampilkan dalam bentuk daftar (ListView)
              : ListView.builder(
                  itemCount: _notes.length, // Jumlah item dalam daftar
                  itemBuilder: (ctx, i) {
                    // Setiap catatan ditampilkan dalam bentuk Card
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(_notes[i]), // Isi catatan
                        // Tombol hapus di sebelah kanan
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _delete(i), // Menghapus catatan saat ditekan
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      // Tombol tambah di pojok kanan bawah untuk menambah catatan baru
      floatingActionButton: FloatingActionButton(
        onPressed: _add, // Memanggil fungsi tambah catatan
        backgroundColor: Colors.teal, // Warna tombol
        child: const Icon(Icons.add), // Ikon tambah
      ),
    );
  }
}
