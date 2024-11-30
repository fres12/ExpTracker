import 'package:flutter/material.dart';
import '../routes/routing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
