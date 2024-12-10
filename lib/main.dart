import 'package:flutter/material.dart';
import '../routes/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpTracker',

      initialRoute: '/',
      routes: Routing.routes,
      onGenerateRoute: Routing.onGenerateRoute,
      debugShowCheckedModeBanner: false, // Menyembunyikan label "Debug"
    );
  }
}
