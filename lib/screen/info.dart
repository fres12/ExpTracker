import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow, // Menambahkan warna biru ke layar
      child: const Placeholder(), 
      // Ini yang munculin tanda silang bisa dihapus aja untuk ngelihat daerah kosong
    );
  }
}
