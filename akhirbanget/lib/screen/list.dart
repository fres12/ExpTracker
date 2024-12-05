import '../widget/chip.dart';
import '../style/hover_tile.dart';
import '../style/settings.dart';
import '../widget/searchbar.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';
import '../data/data_item.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../style/functionstyle.dart';

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
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
                      // halaman tambah
                      Navigator.pushNamed(context, '/tambahScreen');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Membuat body dapat discroll
        child: Container(
          margin: TPosition.marginPageDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ada 10 item tersimpan',
                style: AppStyle.header2,
              ),
              const SizedBox(height: 16),
              Pencarian(),
              const SizedBox(height: 18),
              FilterChipExample(),
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
                        Navigator.pushNamed(context, '/detailItem');
                      },

                      title: Text(
                        item[index].nama_item, // Judul
                        overflow: TextOverflow.ellipsis, //Menambah elipsis
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              item[index].sisa,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: getStyleForSisa(item[index].sisanya),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              // Tambahkan logika untuk ikon
                            },
                            child: Icon(
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
}
