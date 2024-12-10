import 'package:exptracker/screen/edit.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../style/app_style.dart';
import '../style/settings.dart';
import '../models/db_item.dart';
import '../services/db_service.dart';

class DetailItemPage extends StatefulWidget {
  final Item item;
  final Function(Item) onItemUpdated;
  const DetailItemPage({
    super.key,
    required this.item,
    required this.onItemUpdated,
  });

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  late Item _currentItem;
  final _itemService = ItemService();

  @override
  void initState() {
    super.initState();
    _currentItem = widget.item; // Salin data ke variabel lokal
  }

  Future<Item> _getItemDetails(int id) async {
    var itemData = await _itemService.readItemById(id);
    var item = Item()
      ..id = itemData['id']
      ..added = itemData['added']
      ..nama = itemData['nama']
      ..expired = itemData['expired']
      ..kategori = itemData['kategori']
      ..catatan = itemData['catatan'];
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hilangkan back button default
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
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context, _currentItem);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Detail Item',
                    style: AppStyle.header,
                  ),
                ),
                // Ikon di kanan atas
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(item: _currentItem),
                        ),
                      ).then((updatedItem) {
                        if (updatedItem != null) {
                          setState(() {
                            _currentItem =
                                updatedItem; // Update item dengan data baru
                          });
                          widget.onItemUpdated(updatedItem); // Panggil callback
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
      body: FutureBuilder<Item>(
        future: _getItemDetails(_currentItem.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('Item tidak ditemukan', style: AppStyle.subtitle),
            );
          } else {
            _currentItem = snapshot.data!;
            return Padding(
              padding: TPosition.marginPageDetail,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: TColors.outline, width: 0.5),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          // Icon/Image
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: TColors
                                  .backicon, // Warna abu untuk icon background
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(
                              Iconsax.strongbox,
                              color: TColors.icon,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Item Name
                          Text(
                            _currentItem.nama,
                            style: AppStyle.detailTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Details Section
                    Expanded(
                      child: ListView(
                        children: [
                          buildDetailRow(
                              'Tanggal ditambahkan', _currentItem.added),
                          buildDetailRow(
                              'Tanggal kedaluwarsa', _currentItem.expired),
                          buildDetailRow('Waktu tersisa',
                              '${getSisa(_currentItem.expired)} hari'),
                          buildDetailRow('Kategori', _currentItem.kategori),
                          // Catatan Penyimpanan (Custom Layout)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Catatan penyimpanan',
                                  style: AppStyle.detailsub,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _currentItem.catatan ?? 'Tanpa catatan',
                                  style: AppStyle.detailsubtipis,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Delete Button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: TColors.remove,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            _deleteFormDialog(context, _currentItem.id);
                          },
                          child: const Text(
                            'Hapus',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // Helper method to build detail rows
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: AppStyle.detailsub,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: AppStyle.detailsubtipis,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  getSisa(String widget) {
    final expiredConverted = DateTime.parse(widget);
    final hariIni = DateTime.now();
    final sisa = daysBetween(hariIni, expiredConverted);
    return sisa;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    int days = (to.difference(from).inHours / 24).round();
    return days < 0 ? 0 : days;
  }

  void _showSuccessSnackBar(String message, BuildContext context) {
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
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () async {
                final itemService = ItemService();
                var result = await itemService.deleteItem(itemId);
                if (result != null) {
                  if (context.mounted) {
                    _showSuccessSnackBar('Berhasil dihapus', context);
                    Navigator.pop(context); // Close the dialog
                    Navigator.pop(context,
                        _currentItem); // Go back to previous screen after deletion
                  }
                }
              },
              child: const Text('Hapus'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
              ),
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
}
