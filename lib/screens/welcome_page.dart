import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 120),
                const SizedBox(height: 20),
                Text('HealthMate Islami', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Aplikasi pencatat kesehatan harian dengan sentuhan Islami.', textAlign: TextAlign.center),
                const SizedBox(height: 28),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48), backgroundColor: Colors.teal),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text('Mulai Sekarang'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text('Coba sebagai Guest'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
