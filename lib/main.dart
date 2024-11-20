import 'package:flutter/material.dart'; // Pastikan ini diimpor
import 'beranda.dart'; // Impor file beranda.dart Anda

void main() {
  runApp(const MyApp()); // Fungsi runApp sudah didefinisikan di sini
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ),
      home: const Beranda(), // Menggunakan class Beranda dari file beranda.dart
    );
  }
}
