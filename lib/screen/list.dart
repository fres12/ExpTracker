import 'package:cobacoba/screen/detail.dart';

import '../style/hover_tile.dart';
import '../style/settings.dart';
import '../widget/searchbar.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';
import '../data/data_item.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../style/functionstyle.dart';
import '../screen/tambah.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hilangkan back button default
        toolbarHeight: 71,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Padding(
          padding: TPosition.topnavbar,
          child: Stack(
            children: [
              // Teks di tengah
              Align(
                alignment: Alignment.center,
                child: Text(
                  'List Item',
                  style: AppStyle.header,
                ),
              ),
              // Ikon di kanan atas
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Aksi untuk tombol tambah

                    // Tambahkan aksi untuk ikon
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TambahScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Membuat body dapat discroll
        child: Container(
          margin: TPosition.marginPageDefault,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Penataan konten kolom
            children: [
              Text(
                'Ada 10 item tersimpan',
                style: AppStyle.header2,
              ),
              const SizedBox(height: 12), // Jarak sebelum search bar
              Pencarian(),
              const SizedBox(height: 26), // Jarak antar widget
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
                child: ListView.builder(
                  padding: TPosition.containerItem,
                  shrinkWrap: true, // Hanya mengonsumsi ruang yang dibutuhkan
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scroll untuk ListView
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return HoverableTile(
                      padding: TPosition.listItem, // Jarak antar item
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailItemPage()),
                    );
                      },
                      title: Text(
                        item[index].nama_item, // Judul
                        overflow: TextOverflow.ellipsis, //Menambah elipsis\
                        maxLines: 1,
                        style: AppStyle.title,
                      ),
                      subtitle: Text(
                        item[index].kategori, // Subjudul
                        style: AppStyle.subtitle,
                        overflow: TextOverflow.ellipsis, //Menambah elipsis\
                        maxLines: 1,
                      ),
                      trailing: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Mengurangi ruang di kanan
                        children: [
                          Text(item[index].sisa, // Sisa hari
                              style: getStyleForSisa(item[index].sisanya)),
                          const SizedBox(
                              width: 10), // Jarak antara sisa hari dan ikon
                          GestureDetector(
                            onTap: () {}, //
                            child: Icon(
                              Iconsax.minus_cirlce_copy, // Ikon
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
}
