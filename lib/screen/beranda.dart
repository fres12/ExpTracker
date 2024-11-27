import 'package:flutter/material.dart';
import '../style/settings.dart';
import '../style/app_style.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: AppBar(
        toolbarHeight: 71,
        backgroundColor: TColors.background,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: TPosition.topnavbar, // Tambahkan padding di sekitar teks
          child: Text(
            'Beranda',
            style: AppStyle.header, // Gunakan style yang sesuai
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Bungkus dengan SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Information Box (Kontainer Responsif)
            Container(
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12), // Padding dikurangi
              child: Row(
                children: [
                  // Kolom dengan teks yang lebih fleksibel
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '5 item',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 4), // Jarak antar teks dikurangi
                        Text(
                          'akan kedaluwarsa dalam 7 hari',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8), // Jarak antar teks dikurangi
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cek item',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: TColors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Kolom gambar yang fleksibel dan responsif
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/calendar.png',
                      fit: BoxFit.contain, // Menjaga rasio gambar
                      width: double.infinity, // Lebar fleksibel mengikuti ruang
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Statistics Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatisticBox(title: 'Kedaluwarsa', value: '2 item'),
                StatisticBox(title: 'Total item', value: '10 tersimpan'),
              ],
            ),
            const SizedBox(height: 16),
            // Baru saja ditambahkan
            Text(
              'Baru saja ditambahkan',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 8),
            // Blue Box for Items and Button
            Container(
              decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ItemTile(
                        name: 'Susu kotak',
                        category: 'Minuman',
                        expiry: '3 bulan',
                        color: TColors.sisasedang,
                      ),
                      ItemTile(
                        name: 'Snack biru',
                        category: 'Makanan',
                        expiry: '6 bulan',
                        color: TColors.sisagood,
                      ),
                      ItemTile(
                        name: 'Sayur kangkung',
                        category: 'Bahan-bahan',
                        expiry: '4 hari',
                        color: TColors.sisadikit,
                      ),
                    ],
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
                      ),
                      onPressed: () {
                        print('Lihat Selengkapnya');
                      },
                      child: const Text(
                        'Lihat Selengkapnya',
                        style: TextStyle(
                          color: TColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
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

class StatisticBox extends StatelessWidget {
  final String title;
  final String value;

  const StatisticBox({required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color.fromRGBO(144, 165, 180, 1),
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String name;
  final String category;
  final String expiry;
  final Color color;

  const ItemTile({
    required this.name,
    required this.category,
    required this.expiry,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(60, 60, 60, 1),
            ),
      ),
      subtitle: Text(
        category,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color.fromRGBO(171, 164, 164, 1),
            ),
      ),
      trailing: Text(
        expiry,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
