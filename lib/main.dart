import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// screens
// Import seluruh file halaman (screen) yang digunakan dalam aplikasi
import 'screens/welcome_page.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/home_page.dart';
import 'screens/activity_page.dart';
import 'screens/detail_page.dart';
import 'screens/settings_page.dart';
import 'screens/water_tracker_page.dart';
import 'screens/food_tracker_page.dart';
import 'screens/exercise_tracker_page.dart';
import 'screens/notes_page.dart';

// global theme controller
// Digunakan untuk mengatur mode tema (terang/gelap) secara global di seluruh aplikasi
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  // Fungsi utama (entry point) aplikasi Flutter
  // Memanggil widget utama (HealthMateApp) dan menjalankannya
  runApp(const HealthMateApp());
}

// Widget utama aplikasi
class HealthMateApp extends StatelessWidget {
  const HealthMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ValueListenableBuilder akan mendengarkan perubahan nilai dari themeNotifier
    // dan memperbarui tema aplikasi secara otomatis
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        // Tema untuk mode terang (light mode)
        final light = ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: Colors.teal.shade50,
        );

        // Tema untuk mode gelap (dark mode)
        final dark = ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        );

        // MaterialApp: struktur utama aplikasi Flutter
        // Menyediakan tema, rute navigasi, dan konfigurasi global aplikasi
        return MaterialApp(
          title: 'HealthMate Islami', // Judul aplikasi
          debugShowCheckedModeBanner: false, // Menghilangkan banner debug
          theme: light, // Tema terang
          darkTheme: dark, // Tema gelap
          themeMode: currentMode, // Mode tema saat ini (dapat berubah dari pengaturan)
          initialRoute: '/', // Halaman pertama saat aplikasi dijalankan
          routes: {
            // Daftar rute halaman yang digunakan untuk navigasi antar screen
            '/': (c) => const WelcomePage(),
            '/login': (c) => const LoginPage(),
            '/register': (c) => const RegisterPage(),
            '/home': (c) => const MainScreen(),
            '/activity': (c) => const ActivityPage(),
            // Halaman detail menggunakan MaterialPageRoute (dengan data)
            '/settings': (c) => const SettingsPage(),
            '/water': (c) => const WaterTrackerPage(),
            '/food': (c) => const FoodTrackerPage(),
            '/exercise': (c) => const ExerciseTrackerPage(),
            '/notes': (c) => const NotesPage(),
          },
        );
      },
    );
  }
}

// Widget untuk halaman utama setelah login
// Menyediakan navigasi bawah (BottomNavigationBar)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Indeks halaman yang sedang dipilih pada BottomNavigationBar
  int _selectedIndex = 0;

  // Daftar halaman utama yang ditampilkan sesuai dengan indeks navigasi
  static const List<Widget> _pages = <Widget>[
    HomePage(),      // Halaman beranda
    ActivityPage(),  // Halaman aktivitas harian
    NotesPage(),     // Halaman catatan pribadi
  ];

  // Fungsi untuk mengganti indeks halaman saat tab di bottom navigation diklik
  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea memastikan konten tidak tertutupi status bar atau notch perangkat
      body: SafeArea(child: _pages[_selectedIndex]),

      // BottomNavigationBar digunakan untuk navigasi antar halaman utama
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Menunjukkan tab yang sedang aktif
        selectedItemColor: Theme.of(context).colorScheme.primary, // Warna ikon aktif
        onTap: _onItemTapped, // Fungsi yang dijalankan ketika tab diklik
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Catatan',
          ),
        ],
      ),
    );
  }
}
