// Kelas Activity merepresentasikan data dari satu aktivitas sehat
// yang akan ditampilkan dalam aplikasi HealthMate Islami.
// Setiap aktivitas memiliki atribut: id, judul, deskripsi, ikon, dan kutipan Islami.

class Activity {
  // ID unik untuk setiap aktivitas
  final int id;

  // Judul dari aktivitas, misalnya "Minum Air Putih"
  final String title;

  // Deskripsi aktivitas, berisi penjelasan singkat manfaat atau cara melakukannya
  final String description;

  // Ikon emoji yang digunakan sebagai representasi visual aktivitas
  final String icon;

  // Kutipan atau hadits Islami yang berkaitan dengan aktivitas tersebut
  final String quote;

  // Konstruktor utama untuk inisialisasi data Activity
  Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.quote,
  });

  // Factory constructor untuk membuat objek Activity dari data JSON
  // digunakan saat membaca file activity_data.json
  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json['id'] ?? 0, // Jika id tidak ditemukan, nilai default = 0
        title: json['title'] ?? '', // Judul aktivitas
        description: json['description'] ?? '', // Deskripsi aktivitas
        icon: json['icon'] ?? '', // Ikon emoji aktivitas
        quote: json['quote'] ?? '', // Kutipan hadits atau ayat
      );

  // Method untuk mengubah objek Activity menjadi format JSON
  // biasanya digunakan untuk menyimpan atau menulis data kembali ke file
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'icon': icon,
        'quote': quote,
      };
}
