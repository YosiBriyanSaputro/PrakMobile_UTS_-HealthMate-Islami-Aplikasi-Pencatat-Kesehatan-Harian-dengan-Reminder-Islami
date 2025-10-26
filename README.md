

# 🕌 HealthMate Islami
> Aplikasi Pencatat Kesehatan Harian Berbasis Flutter dengan Sentuhan Islami  

---

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.9.2-blue?logo=flutter&logoColor=white" alt="Flutter Badge">
  <img src="https://img.shields.io/badge/Dart-3.0-blue?logo=dart&logoColor=white" alt="Dart Badge">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License Badge">
  <img src="https://img.shields.io/badge/Status-Completed-success" alt="Status Badge">
</p>

---

## 📱 Deskripsi Proyek
**HealthMate Islami** merupakan aplikasi mobile berbasis **Flutter** yang dirancang untuk membantu pengguna menjaga kesehatan jasmani dan rohani.  
Aplikasi ini menggabungkan fitur-fitur *health tracking* seperti pencatat air, makanan, dan olahraga, dengan kutipan Islami yang memberi motivasi spiritual bagi pengguna.  

Proyek ini dikembangkan sebagai **Ujian Tengah Semester (UTS)** untuk mata kuliah **Praktikum Pemrograman Mobile**.

---

## ✨ Fitur Utama
| Fitur | Deskripsi |
|-------|------------|
| 💧 **Water Tracker** | Mencatat jumlah gelas air yang diminum setiap hari dan menampilkan progres secara visual. |
| 🍱 **Food Tracker** | Mencatat daftar makanan beserta jumlah kalori yang dikonsumsi. |
| 🏃 **Exercise Tracker** | Menyimpan data aktivitas olahraga (nama, durasi, waktu). |
| 🧠 **Catatan Pribadi (Notes)** | Fitur untuk menulis catatan atau motivasi kesehatan pribadi. |
| 🕋 **Aktivitas Islami** | Menampilkan aktivitas sehat disertai kutipan hadits atau ayat Al-Qur’an. |
| ⚙️ **Settings Page** | Mengatur tema terang/gelap serta logout dari akun. |

---

## 🧩 Struktur Folder
```

lib/
┣ models/
┃ ┗ activity_model.dart           → Model data untuk aktivitas sehat
┣ screens/
┃ ┣ welcome_page.dart             → Halaman sambutan awal aplikasi
┃ ┣ login_page.dart               → Halaman login pengguna
┃ ┣ register_page.dart            → Halaman pendaftaran akun baru
┃ ┣ home_page.dart                → Menu utama aplikasi
┃ ┣ activity_page.dart            → Daftar aktivitas sehat (data dari JSON)
┃ ┣ detail_page.dart              → Detail dari setiap aktivitas sehat
┃ ┣ water_tracker_page.dart       → Fitur pencatat konsumsi air harian
┃ ┣ food_tracker_page.dart        → Fitur pencatat makanan & kalori
┃ ┣ exercise_tracker_page.dart    → Fitur pencatat olahraga
┃ ┣ notes_page.dart               → Catatan pribadi pengguna
┃ ┗ settings_page.dart            → Pengaturan akun dan tema aplikasi
┣ widgets/
┃ ┗ activity_card.dart            → Widget tampilan daftar aktivitas
┣ main.dart                       → Entry point aplikasi
assets/
┣ logo.png                        → Logo aplikasi
┣ profile.jpg                     → Gambar profil pengguna
┗ data/
┗ activity_data.json           → Data lokal aktivitas sehat & kutipan Islami

````

---

## 🛠️ Teknologi yang Digunakan
- **Framework:** Flutter (v3.9.2)  
- **Bahasa Pemrograman:** Dart  
- **Paket Tambahan:**
  - `google_fonts` → Font modern Poppins untuk tampilan UI
  - `cupertino_icons` → Ikon tambahan bergaya iOS
  - `http` → (opsional, untuk pengembangan fitur API online)
  - `shared_preferences` → Menyimpan data sementara seperti tema dan login

---

## 🚀 Cara Menjalankan Proyek

1. Pastikan Flutter sudah terinstal di perangkat Anda:
   ```bash
   flutter --version

2. Clone repositori ini:

   ```bash
   git clone https://github.com/username/healthmate-islami.git
   ```

3. Masuk ke direktori proyek:

   ```bash
   cd healthmate-islami
   ```

4. Unduh semua dependency:

   ```bash
   flutter pub get
   ```

5. Jalankan aplikasi:

   ```bash
   flutter run
   ```

---

## 👥 Akun Uji Coba

Gunakan akun berikut untuk login ke aplikasi:

```
Email    : user@test.com
Password : 12345
```

Atau tekan tombol **“Coba sebagai Guest”** pada halaman awal untuk masuk tanpa login.

---

## 🧭 Alur Proyek (Project Flow)

Berikut adalah alur kerja dan navigasi utama dari aplikasi **HealthMate Islami**:

```text
1️⃣  Pengguna membuka aplikasi
     ↓
2️⃣  Halaman Welcome (welcome_page.dart)
     • Menampilkan logo dan deskripsi singkat.
     • Opsi:
       → "Mulai Sekarang" → menuju halaman Login.
       → "Coba sebagai Guest" → langsung ke halaman Home.
     ↓
3️⃣  Halaman Login (login_page.dart)
     • Autentikasi menggunakan akun dummy.
     • Jika login sukses → masuk ke halaman utama (MainScreen).
     ↓
4️⃣  Halaman Utama / Home (home_page.dart)
     • Menampilkan salam, kutipan hadits, dan menu cepat:
       → Water Tracker
       → Food Tracker
       → Exercise Tracker
       → Notes
     ↓
5️⃣  Halaman Aktivitas (activity_page.dart)
     • Menampilkan daftar aktivitas sehat dari data JSON.
     • Tekan item → buka halaman Detail.
     ↓
6️⃣  Halaman Detail Aktivitas (detail_page.dart)
     • Menampilkan deskripsi lengkap & kutipan Islami.
     ↓
7️⃣  Fitur Tracker:
     ├─ 💧 Water Tracker (water_tracker_page.dart)
     │   • Tambah jumlah air diminum
     │   • Lihat progres harian
     │
     ├─ 🍱 Food Tracker (food_tracker_page.dart)
     │   • Tambah makanan & kalori
     │   • Hitung total kalori harian
     │
     ├─ 🏃 Exercise Tracker (exercise_tracker_page.dart)
     │   • Tambah aktivitas olahraga
     │   • Simpan durasi & waktu
     │
     └─ 🧠 Notes Page (notes_page.dart)
         • Tambah catatan pribadi
         • Simpan atau hapus catatan
     ↓
8️⃣  Halaman Pengaturan (settings_page.dart)
     • Ubah tema (light/dark)
     • Logout → kembali ke Welcome Page
```

---

### 🔁 Ringkasan Alur Interaksi

| Tahap | Halaman                      | Fungsi Utama                        |
| :---: | :--------------------------- | :---------------------------------- |
|   1   | `welcome_page.dart`          | Tampilan pembuka, opsi login/guest  |
|   2   | `login_page.dart`            | Autentikasi sederhana (dummy login) |
|   3   | `home_page.dart`             | Menu utama dan kutipan Islami       |
|   4   | `activity_page.dart`         | Daftar aktivitas sehat dari JSON    |
|   5   | `detail_page.dart`           | Detail aktivitas & hadits           |
|   6   | `water_tracker_page.dart`    | Catatan konsumsi air harian         |
|   7   | `food_tracker_page.dart`     | Catatan makanan & kalori            |
|   8   | `exercise_tracker_page.dart` | Catatan olahraga                    |
|   9   | `notes_page.dart`            | Catatan pribadi pengguna            |
|   10  | `settings_page.dart`         | Tema, profil, dan logout            |

---

### ⚙️ Logika Sistem

* Navigasi antar halaman menggunakan `Navigator.pushNamed()` dan `Navigator.pushReplacementNamed()`.
* Rute halaman didefinisikan di file `main.dart`.
* Data aktivitas sehat diambil dari `assets/data/activity_data.json` dan dikonversi ke model `Activity`.
* Fitur Tracker menggunakan **StatefulWidget** agar tampilan dapat berubah secara real-time.
* Tema dikontrol dengan `ValueNotifier<ThemeMode>` untuk mendukung *light mode* dan *dark mode*.

---

## 🧠 Nilai dan Konsep Islami

Aplikasi ini mengangkat nilai-nilai Islami di setiap aktivitas, seperti:

* **Minum air putih** mengikuti sunnah Rasulullah SAW.
* **Menjaga tubuh dan olahraga** sebagai bentuk rasa syukur atas nikmat Allah SWT.
* **Makan sehat** tanpa berlebihan sesuai dengan anjuran QS. *Al-A’raf: 31*.

Tujuan utama aplikasi ini adalah membantu pengguna **menyeimbangkan kesehatan jasmani dan spiritual** dalam kehidupan sehari-hari.

---


## 👨‍💻 Pengembang

**Nama:** Yosi Briyan Saputro </b> <br>
**NIM:** 230605110055 </b> <br>
**Kelas:** E </b> <br>
**Mata Kuliah:** Praktikum Pemrograman Mobile </b> <br>
**Dosen Pengampu:**  A’la Syauqi,M.Kom </b> <br>
**Fakultas:** Sains dan Teknologi </b> <br>
**Universitas:** Universitas Islam Negeri Maulana Malik Ibrahim Malang

---

## 🏁 Status Proyek

✅ **Versi UTS:** Selesai dan Berfungsi </b> <br>
🔜 **Versi Pengembangan:** Integrasi Firebase, Notifikasi, dan Penyimpanan Data Online.

---

## 💬 Lisensi

Proyek ini dibuat untuk tujuan pembelajaran akademik.</b> <br>
Seluruh hak cipta logo, ikon, dan kutipan Islami adalah milik masing-masing pemilik yang disebutkan.</b> <br>
Proyek ini bersifat **Open Source (MIT License)** dan dapat digunakan untuk keperluan pendidikan.

---

<p align="center">
  Dibuat dengan santai dan semangat islami oleh <b>Yosi Briyan Saputro</b> <br>
  <i>“Sehat itu nikmat, dan menjaga tubuh adalah bentuk syukur kepada Allah.”</i>
</p>




