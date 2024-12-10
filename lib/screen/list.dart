import 'package:exptracker/screen/detail.dart';
import 'tambah.dart';
import 'package:flutter/material.dart';
import '../widget/chip.dart';
import '../style/hover_tile.dart';
import '../style/settings.dart';
import '../widget/searchbar.dart';
import '../style/app_style.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../style/functionstyle.dart';
import '../models/db_item.dart';
import '../services/db_service.dart';

class ListScreen extends StatefulWidget {
  /* final ExpirationFilter? initialFilter;

  const ListScreen({super.key, this.initialFilter}); */
  const ListScreen({super.key});
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<Item> _itemList = <Item>[];
  List<Item> _filteredItemList = <Item>[];
  ExpirationFilter? selectedFilter;
  final _itemService = ItemService();
  final GlobalKey<FilterChipExampleState> _filterChipKey =
      GlobalKey<FilterChipExampleState>();

  @override
  void initState() {
    super.initState();
    getAllItemDetails();

    /*  if (widget.initialFilter != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyInitialFilter();
      });
    }*/
  }

  /*void _applyInitialFilter() {
    setState(() {
      selectedFilter = widget.initialFilter;
    });
    //   _filterChipKey.currentState?.selectFilter(widget.initialFilter!);
    _applyFilters(_itemList);
  }*/

  Future<void> getAllItemDetails() async {
    var items = await _itemService.readAllItems();

    List<Item> tempItemList = <Item>[];
    items.forEach((item) {
      var itemModel = Item();
      itemModel.id = item['id'];
      itemModel.added = item['added'];
      itemModel.nama = item['nama'];
      itemModel.expired = item['expired'];
      itemModel.kategori = item['kategori'];
      itemModel.catatan = item['catatan'];
      tempItemList.add(itemModel);
    });

    setState(() {
      _itemList = tempItemList;
      _filteredItemList =
          tempItemList; // Inisialisasi daftar yang difilter dengan semua item

      _applyFilters(_filteredItemList);
    });
  }

  void _filterItems(String query) {
    // Cari item berdasarkan query
    List<Item> filteredList = _itemList.where((item) {
      return item.nama.toLowerCase().contains(query.toLowerCase()) ||
          item.kategori.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Terapkan filter yang dipilih pada hasil pencarian
    _applyFilters(filteredList);
  }

  void _applyFilters(List<Item> itemList) {
    List<Item> filteredList = itemList;

    // Jika ada filter yang dipilih, hanya tampilkan item sesuai filter
    if (selectedFilter != null) {
      filteredList = itemList.where((item) {
        var sisa = getSisa(_itemList.indexOf(item));
        return (selectedFilter == ExpirationFilter.siExp && sisa == 0) ||
            (selectedFilter == ExpirationFilter.siWeek &&
                sisa > 0 &&
                sisa <= 7) ||
            (selectedFilter == ExpirationFilter.siWTo3M &&
                sisa > 7 &&
                sisa <= 90) ||
            (selectedFilter == ExpirationFilter.siMoreThan3 && sisa > 90);
      }).toList();
    }

    setState(() {
      _filteredItemList = filteredList;
    });
  }

  int getSisa(int index) {
    if (index < 0 || index >= _filteredItemList.length) {
      return 0; // Mengembalikan nilai -1 jika indeks tidak valid
    }
    final expiredConverted = DateTime.parse(_filteredItemList[index].expired);
    final hariIni = DateTime.now();
    final sisa = daysBetween(hariIni, expiredConverted);
    return sisa;
  }

  String getLevel(int sisa) {
    var level = '';
    if (sisa == 0) {
      level = 'exp';
    } else if (sisa > 0 && sisa <= 7) {
      level = 'rendah';
    } else if (sisa > 7 && sisa <= 90) {
      level = 'sedang';
    } else if (sisa > 90) {
      level = 'bagus';
    }
    return level;
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  void _deleteFormDialog(BuildContext context, int? itemId) {
    showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text(
            'Yakin ingin hapus?',
            style: TextStyle(color: TColors.black, fontSize: 18),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red),
              onPressed: () async {
                var result = await _itemService.deleteItem(itemId);
                if (result != null) {
                  getAllItemDetails();
                  _showSuccessSnackBar('Berhasil dihapus');
                  if (context.mounted) {
                    Navigator.pop(context);
                    getAllItemDetails();
                  }
                }
              },
              child: const Text('Hapus'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 71,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: TColors.outline,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: TPosition.topnavbar,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'List Item',
                    style: AppStyle.header,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TambahScreen()))
                          .then((data) {
                        if (data != null) {
                          getAllItemDetails();
                          _showSuccessSnackBar('Berhasil ditambahkan');
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: TPosition.marginPageDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ada ${_itemList.length} item tersimpan',
                style: AppStyle.header2,
              ),
              const SizedBox(height: 16),
              Pencarian(
                onSearch: (query) {
                  _filterItems(
                      query); // Memanggil fungsi pencarian dan penerapan filter
                },
                onClearFilters: () {
                  _clearFilters();
                  _filterChipKey.currentState
                      ?.clearFilters(); // Menghapus status seleksi pada FilterChip
                },
              ),
              const SizedBox(height: 18),
              FilterChipExample(
                key: _filterChipKey, // Tambahkan kunci di sini
                onFilterChanged: (Set<ExpirationFilter> selectedFilters) {
                  setState(() {
                    selectedFilter = selectedFilters.isNotEmpty
                        ? selectedFilters.first
                        : null;
                  });
                  _applyFilters(_itemList); // Terapkan filter pada daftar item
                },
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: TColors.outline,
                    width: 0.5,
                  ),
                ),
                child: _filteredItemList.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada item',
                          style: AppStyle.subtitle,
                        ),
                      )
                    : ListView.builder(
                        padding: TPosition.containerItem,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _filteredItemList.length,
                        itemBuilder: (context, index) {
                          return HoverableTile(
                            padding: TPosition.listItem,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailItemPage(
                                    item: _filteredItemList[index],
                                    onItemUpdated: (updatedItem) {
                                      setState(() {
                                        _filteredItemList[index] = updatedItem;
                                      });
                                      getAllItemDetails(); // Muat ulang data untuk memastikan semuanya diperbarui
                                    },
                                  ),
                                ),
                              ).then((value) {
                                getAllItemDetails(); // Muat ulang data setelah kembali dari halaman detail
                              });
                            },
                            title: Text(
                              _filteredItemList[index].nama,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppStyle.title,
                            ),
                            subtitle: Text(
                              _filteredItemList[index].kategori,
                              style: AppStyle.subtitle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${getSisa(index)} hari',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: getStyleForSisa(
                                        getLevel(getSisa(index))),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    _deleteFormDialog(
                                        context, _filteredItemList[index].id);
                                  },
                                  child: const Icon(
                                    Iconsax.minus_cirlce_copy,
                                    size: 26,
                                    color: TColors.greynavbar,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    int days = (to.difference(from).inHours / 24).round();
    return days < 0 ? 0 : days;
  }

  void _clearFilters() {
    setState(() {
      selectedFilter = null;
      _filteredItemList = _itemList; // Tampilkan semua item kembali
    });
  }
}
