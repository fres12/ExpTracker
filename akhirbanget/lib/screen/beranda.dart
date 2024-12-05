import 'package:flutter/material.dart';
import '../style/settings.dart';
import '../style/app_style.dart';
import '../style/hover_tile.dart';
import '../data/data_item.dart';
import '../style/functionstyle.dart';
import '../widget/navigation_menu.dart';
import 'package:get/get.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hilangkan back button default
        toolbarHeight: 71,
        backgroundColor: Colors.white,
        elevation: 0, // Hilangkan shadow default
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
      body: SingleChildScrollView(
        padding: TPosition.marginPageDefault2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Information Box
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
                          '5 item',
                          style: AppStyle.sisa,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'akan kedaluwarsa dalam 7 hari',
                          style: AppStyle.subberanda,
                          overflow: TextOverflow.ellipsis, //Menambah elipsis\
                          maxLines: 2,
                        ),
                        const SizedBox(height: 21),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: TPosition.button,
                          ),
                          onPressed: () {
                            //nothing
                          },
                          child: Text(
                            'Cek item',
                            style: AppStyle.buttonberanda,
                            overflow: TextOverflow.ellipsis, //Menambah elipsis
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
                      border: Border.all(
                          color: TColors.outline, width: 0.5), // Outline
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kedaluwarsa',
                          style: AppStyle.containersub,
                        ),
                        const SizedBox(
                            height: 20), // Jarak 20px dengan teks berikutnya
                       Row(
  children: [
    Icon(
      Icons.delete, // Ikon
      color: Colors.blue, // Warna ikon
      size: 24, // Ukuran ikon
    ),
    const SizedBox(width: 5), // Jarak antara ikon dan teks
    Flexible(
      child: Text(
        '2 Item',
        style: AppStyle.containertitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis, // Aktifkan elipsis
      ),
    ),
  ],
),

                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Jarak antar kontainer
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: TPosition.containerkedaluwarsa,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: TColors.outline, width: 0.5), // Outline
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
                          '10 Tersimpan',
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
            // Container dengan ListView.builder dan tombol "Lihat Selengkapnya"
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TColors.outline, width: 0.5),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    padding: TPosition.containerItem,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: item.length > 7
                        ? 7
                        : item.length, // Batasi hingga 8 item
                    itemBuilder: (context, index) {
                      return HoverableTile(
                        padding: TPosition.listItem, // Jarak antar item
                        onTap: () {
                          Navigator.pushNamed(context, '/detailItem');
                        },
                        title: Text(
                          item[index].nama_item,
                          style: AppStyle.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          item[index].kategori,
                          style: AppStyle.subtitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          item[index].sisa,
                          style: getStyleForSisa(item[index].sisanya),
                          overflow: TextOverflow.ellipsis,
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
                      child: Text('Lihat Selengkapnya',
                          style: AppStyle.buttonhome),
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
