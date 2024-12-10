import 'package:flutter/material.dart';
import '../style/settings.dart';
import '../style/app_style.dart';
import '../style/hover_tile.dart';
import '../models/db_item.dart'; // Mengimpor dari lokasi yang benar
import '../services/db_service.dart';
import '../style/functionstyle.dart';
import '../widget/navigation_menu.dart';
import 'package:get/get.dart';

import 'detail.dart';
import 'list.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final ItemService _itemService = ItemService();
  List<Item> _itemList = [];
  bool _isLoading = true;
  int _countExpiringIn7Days = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      var items = await _itemService.readAllItems();
      List<Item> tempList = <Item>[];
      int countExpiringIn7Days = 0;

      for (var itemData in items) {
        Item item = Item(); // Buat objek Item dari db_item.dart
        item.id = itemData['id'];
        item.added = itemData['added'];
        item.nama = itemData['nama'];
        item.expired = itemData['expired'];
        item.kategori = itemData['kategori'];
        item.catatan = itemData['catatan'];
        tempList.add(item);

        if (getSisa(item.expired) <= 7 && getSisa(item.expired) > 0) {
          countExpiringIn7Days++;
        }
      }

      setState(() {
        _itemList = tempList;
        _countExpiringIn7Days = countExpiringIn7Days;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  int getSisa(String expiredDate) {
    final expiredConverted = DateTime.parse(expiredDate);
    final today = DateTime.now();
    return daysBetween(today, expiredConverted);
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

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    int days = (to.difference(from).inHours / 24).round();
    return days < 0 ? 0 : days;
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
            color: TColors.background,
            border: Border(
              bottom: BorderSide(
                color: TColors.background,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: TPosition.topnavbar,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Beranda',
                style: AppStyle.header,
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: TPosition.marginPageDefault2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: TPosition.paddingHome,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                '$_countExpiringIn7Days item',
                                style: AppStyle.sisa,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'akan kedaluwarsa dalam 7 hari',
                                style: AppStyle.subberanda,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const SizedBox(height: 21),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: TPosition.button,
                                ),
                                onPressed: () {
                                  final navigationController =
                                      Get.find<NavigationController>();
                                  navigationController.selectedIndex.value = 1;
                                  Get.to(() => const ListScreen());
                                },
                                child: Text(
                                  'Cek item',
                                  style: AppStyle.buttonberanda,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          child: Image.asset(
                            'assets/calendar.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: TPosition.containerkedaluwarsa,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: TColors.outline, width: 0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kedaluwarsa',
                                style: AppStyle.containersub,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.delete,
                                    color: Colors.blue,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      '${_itemList.where((item) => DateTime.parse(item.expired).isBefore(DateTime.now())).length} Item',
                                      style: AppStyle.containertitle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: TPosition.containerkedaluwarsa,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: TColors.outline, width: 0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Item',
                                style: AppStyle.containersub,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '${_itemList.length} Tersimpan',
                                style: AppStyle.containertitle2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Baru saja ditambahkan',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: TColors.outline, width: 0.5),
                    ),
                    child: Column(
                      children: [
                        _itemList.isEmpty
                            ? Center(
                                child: Text(
                                  'Belum ada item, silakan tambah',
                                  style: AppStyle.subtitle,
                                ),
                              )
                            : ListView.builder(
                                padding: TPosition.containerItem,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    _itemList.length > 7 ? 7 : _itemList.length,
                                itemBuilder: (context, index) {
                                  return HoverableTile(
                                    padding: TPosition.listItem,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailItemPage(
                                            item: _itemList[index],
                                            onItemUpdated: (updatedItem) {
                                              setState(() {
                                                _itemList[index] = updatedItem;
                                              });
                                            },
                                          ),
                                        ),
                                      ).then((value) {
                                        // Memuat ulang data setelah kembali dari halaman detail
                                        _loadData();
                                      });
                                    },
                                    title: Text(
                                      _itemList[index].nama,
                                      style: AppStyle.title,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      _itemList[index].kategori,
                                      style: AppStyle.subtitle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: Text(
                                      '${getSisa(_itemList[index].expired)} hari',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: getStyleForSisa(
                                        getLevel(
                                            getSisa(_itemList[index].expired)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.birumuda,
                              minimumSize: const Size(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              final navigationController =
                                  Get.find<NavigationController>();
                              navigationController.selectedIndex.value =
                                  1; // Pindah ke ListScreen
                            },
                            child: Text(
                              'Lihat Selengkapnya',
                              style: AppStyle.buttonhome,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
