import '../style/settings.dart';
import 'package:flutter/material.dart';

enum ExpirationFilter { siExp, siWeek, siWTo3M, siMoreThan3 }

class FilterChipExample extends StatefulWidget {
  final Function(Set<ExpirationFilter>) onFilterChanged;
  //final GlobalKey<FilterChipExampleState> key;

  //const FilterChipExample({required this.onFilterChanged, required this.key});
  const FilterChipExample({super.key, required this.onFilterChanged});

  @override
  State<FilterChipExample> createState() => FilterChipExampleState();
}

class FilterChipExampleState extends State<FilterChipExample> {
  ExpirationFilter? selectedFilter;

  Color getChipColor(ExpirationFilter filter) {
    switch (filter) {
      case ExpirationFilter.siExp:
        return TColors.exp;
      case ExpirationFilter.siWeek:
        return TColors.sisadikit;
      case ExpirationFilter.siWTo3M:
        return TColors.sisasedang;
      case ExpirationFilter.siMoreThan3:
        return TColors.sisagood;
    }
  }

  // Tambahkan metode untuk menghapus filter
  void clearFilters() {
    setState(() {
      selectedFilter = null;
      widget.onFilterChanged(<ExpirationFilter>{});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  ExpirationFilter.values.map((ExpirationFilter expFilter) {
                return FilterChip(
                  label: Text(
                    _getFilterLabel(expFilter),
                    style: TextStyle(
                      color: selectedFilter == expFilter
                          ? Colors.white
                          : getChipColor(expFilter),
                      fontSize: 15.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: getChipColor(expFilter),
                      width: 1.5,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: getChipColor(expFilter),
                  selected: selectedFilter == expFilter,
                  checkmarkColor: Colors.white,
                  onSelected:
                      selectedFilter == null || selectedFilter == expFilter
                          ? (bool selected) {
                              FocusScope.of(context).unfocus();

                              setState(() {
                                if (selected) {
                                  clearFilters();
                                  selectedFilter = expFilter;
                                } else {
                                  selectedFilter = null;
                                  clearFilters();
                                }
                                widget.onFilterChanged(selectedFilter != null
                                    ? {selectedFilter!}
                                    : <ExpirationFilter>{});
                              });
                            }
                          : null,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  String _getFilterLabel(ExpirationFilter filter) {
    switch (filter) {
      case ExpirationFilter.siExp:
        return 'Expired';
      case ExpirationFilter.siWeek:
        return '7 hari';
      case ExpirationFilter.siWTo3M:
        return '8-90 hari';
      case ExpirationFilter.siMoreThan3:
        return '> 90 hari';
    }
  }
}
