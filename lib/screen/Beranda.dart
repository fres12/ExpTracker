import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Menambahkan warna biru ke layar
      child: const Placeholder(), 
      // Ini yang munculin tanda silang bisa dihapus aja untuk ngelihat daerah kosong
    );
  }
}
