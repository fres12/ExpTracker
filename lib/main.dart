import 'package:flutter/material.dart';
import '../widget/navigation_menu.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpTracker',
      home: const NavigationMenu(),
      debugShowCheckedModeBanner: false, // Menyembunyikan label "Debug"
    );
  }
}
