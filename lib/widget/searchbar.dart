import 'package:flutter/material.dart';
import '../style/app_style.dart';

class Pencarian extends StatefulWidget {
  final Function(String) onSearch;
  final VoidCallback onClearFilters;

  const Pencarian(
      {required this.onSearch, required this.onClearFilters, super.key});

  @override
  PencarianState createState() => PencarianState();
}

class PencarianState extends State<Pencarian> {
  final TextEditingController _pencariController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _pencariController,
      focusNode: _focusNode,
      style: AppStyle.biasa,
      decoration: InputDecoration(
        hintText: 'Cari item...',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
      ),
      onTap: () {
        //_pencariController.clear();
        if (!_focusNode.hasFocus) {
          widget
              .onClearFilters(); // Hapus semua filter saat kotak pencarian diklik
        }
      },
      onChanged: (value) {
        widget.onSearch(value);
        _focusNode.addListener(() {
          if (!_focusNode.hasFocus) {
            _pencariController.clear();
          }
        });
      },
    );
  }
}