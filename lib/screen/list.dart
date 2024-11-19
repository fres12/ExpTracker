import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green, // Menambahkan warna biru ke layar
      child: const Placeholder(), 
      // Ini yang munculin tanda silang bisa dihapus aja untuk ngelihat daerah kosong
    );
  }
}
