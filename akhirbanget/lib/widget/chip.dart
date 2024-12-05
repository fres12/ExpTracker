import '../style/settings.dart';
import 'package:flutter/material.dart';

enum ExpirationFilter { Exp, Week, WTo3M, MoreThan3 }

class FilterChipExample extends StatefulWidget {
  const FilterChipExample({super.key});

  @override
  State<FilterChipExample> createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<FilterChipExample> {
  Set<ExpirationFilter> filters = <ExpirationFilter>{};

  // Warna berdasarkan kategori chip
  Color getChipColor(ExpirationFilter filter) {
    switch (filter) {
      case ExpirationFilter.Exp:
        return TColors.exp; // Warna untuk Expire
      case ExpirationFilter.Week:
        return TColors.sisadikit; // Warna untuk 7 Hari
      case ExpirationFilter.WTo3M:
        return TColors.sisasedang; // Warna untuk 1 Minggu - 3 Bulan
      case ExpirationFilter.MoreThan3:
        return TColors.sisagood; // Warna untuk > 3 Bulan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft, // Memulai dari kiri atas
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Kolom rata kiri
        children: <Widget>[
          // Membungkus Wrap dengan SingleChildScrollView untuk menggulirkan secara horizontal
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Mengaktifkan scroll horizontal
            child: Wrap(
              spacing: 8.0, // Jarak antar chip horizontal
              runSpacing: 8.0, // Jarak antar chip vertikal
              children:
                  ExpirationFilter.values.map((ExpirationFilter expFilter) {
                return FilterChip(
                  label: Text(
                    _getFilterLabel(expFilter),
                    style: TextStyle(
                      color: filters.contains(expFilter)
                          ? Colors.white // Teks putih saat dipilih
                          : getChipColor(expFilter), // Warna teks default
                      fontSize: 15.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: getChipColor(expFilter), // Warna garis
                      width: 1.5, // Ketebalan garis
                    ),
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: getChipColor(expFilter), // Warna saat dipilih
                  selected: filters.contains(expFilter),
                  checkmarkColor: Colors.white, // Warna checklist putih
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        filters.add(expFilter);
                      } else {
                        filters.remove(expFilter);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  // Label untuk setiap filter
  String _getFilterLabel(ExpirationFilter filter) {
    switch (filter) {
      case ExpirationFilter.Exp:
        return 'Expire';
      case ExpirationFilter.Week:
        return '7 Hari';
      case ExpirationFilter.WTo3M:
        return '1 Minggu - 3 Bulan';
      case ExpirationFilter.MoreThan3:
        return '> 3 Bulan';
    }
  }
}
