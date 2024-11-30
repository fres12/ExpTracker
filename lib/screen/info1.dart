import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: InformationPage(),
  ));
}

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          buildCustomExpansionTile(
            title: 'Jenis tanggal kedaluwarsa',
            content: buildFirstInformationContent(),
          ),
          buildCustomExpansionTile(
            title: 'Istilah dalam kedaluwarsa',
            content: buildSecondInformationContent(),
          ),
          buildCustomExpansionTile(
            title: 'Membaca tanggal kedaluwarsa',
            content: Text('Content for Membaca tanggal kedaluwarsa.'),
          ),
          buildCustomExpansionTile(
            title: 'Indikator tanggal kedaluwarsa',
            content: Text('Content for Indikator tanggal kedaluwarsa.'),
          ),
          buildCustomExpansionTile(
            title: 'Produk tidak memiliki kedaluwarsa',
            content: Text('Content for Produk tidak memiliki kedaluwarsa.'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation between pages here
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  // Helper function to create a custom ExpansionTile with padding
  Widget buildCustomExpansionTile({required String title, required Widget content}) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [content],
      ),
    );
  }

  // Content for the first part of information
  Widget buildFirstInformationContent() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        children: [
          TextSpan(
            text:
                'Expired date adalah tanggal pada kemasan produk untuk menunjukkan batas waktu aman konsumsi produk. Format tanggal kedaluwarsa memiliki bentuk yang berbeda-beda begitu pula dengan cara pembacaannya sebagai berikut:\n\n',
          ),
          TextSpan(
            text: 'DD/MM/YYYY (Hari/Bulan/Tahun)\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Format ini umum digunakan di banyak negara, termasuk Indonesia. Cara membacanya: Misal, 15/06/2024 berarti tanggal 15 Juni 2024.\n\n',
          ),
          TextSpan(
            text: 'MM/DD/YYYY (Bulan/Hari/Tahun)\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Format ini sering digunakan di Amerika Serikat. Cara membacanya: Misal, 06/15/2024 berarti tanggal 15 Juni 2024.\n\n',
          ),
          TextSpan(
            text: 'YYYY/MM/DD (Tahun/Bulan/Hari)\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Format ini sering digunakan dalam standar internasional dan dokumen resmi. Cara membacanya: Misal, 2024/06/15 berarti tanggal 15 Juni 2024.',
          ),
        ],
      ),
    );
  }

  // Content for the second part of information
  Widget buildSecondInformationContent() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        children: [
          TextSpan(
            text:
                'Terdapat tiga jenis tanggal penting yang perlu dipahami konsumen dalam produk yaitu ',
          ),
          TextSpan(
            text: 'Expired Date, Best Before Date, dan Use By Date.\n\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Expired Date\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Tanggal ini menunjukkan batas akhir keamanan produk. Setelah melewati tanggal ini, produk tidak lagi aman untuk digunakan atau dikonsumsi.\n\n',
          ),
          TextSpan(
            text: 'Best Before Date\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Tanggal ini mengindikasikan batas waktu optimal untuk kualitas terbaik produk. Setelah tanggal ini, produk masih bisa dikonsumsi, tetapi rasa, tekstur, atau nilai kualitasnya mungkin menurun, tergantung pada cara penyimpanan.\n\n',
          ),
          TextSpan(
            text: 'Use By Date\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Tanggal ini berlaku untuk produk dengan usia simpan pendek, seperti makanan segar. Setelah tanggal ini, produk tak lagi aman dikonsumsi karena risiko pertumbuhan bakteri atau mikroorganisme.',
          ),
        ],
      ),
    );
  }
}
