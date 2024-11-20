import 'package:budgetku/style/settings.dart';
import 'package:flutter/material.dart';

class Pencarian extends StatelessWidget {
  const Pencarian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // Ganti dengan marginPageDefault
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Cari item...',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
