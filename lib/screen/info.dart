import 'package:flutter/material.dart';
import '../style/app_style.dart';
import '../style/settings.dart';

class Info extends StatelessWidget {
  const Info({super.key});

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
                // Teks di tengah
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Informasi',
                    style: AppStyle.header,
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
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              buildCustomExpansionTile(
                title: 'Jenis tanggal kedaluwarsa',
                content: isiKonten1(),
              ),
              buildCustomExpansionTile(
                title: 'Istilah dalam kedaluwarsa',
                content: isiKonten2(),
              ),
              buildCustomExpansionTile(
                title: 'Membaca tanggal kedaluwarsa',
                content: isiKonten3(),
              ),
              buildCustomExpansionTile(
                title: 'Indikator produk kedaluwarsa',
                content: isiKonten4(),
              ),
              buildCustomExpansionTile(
                title: 'Produk tidak memiliki kedaluwarsa',
                content: isiKonten5(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create a custom ExpansionTile with padding
  Widget buildCustomExpansionTile(
      {required String title, required Widget content}) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          title,
          style: AppStyle.title,
        ),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(width: 0.5, color: TColors.outline)),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(width: 0.5, color: TColors.outline)),
        iconColor: TColors.primary,
        children: [content],
      ),
    );
  }

  // Content for the first part of information
  Widget isiKonten1() {
    return RichText(
      text: TextSpan(
        style: AppStyle.detailsub,
        children: const [
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
  Widget isiKonten2() {
    return RichText(
      text: TextSpan(
        style: AppStyle.detailsub,
        children: const [
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

  Widget isiKonten3() {
    return RichText(
      text: TextSpan(
        style: AppStyle.detailsub,
        children: const [
          TextSpan(
            text: 'Makanan dan Minuman\n',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text:
                'Jika pada produk tertera "EXP 12/09/2024" artinya kedaluwarsa pada 9 Desember 2024.\n'
                'Jika terdapat tulisan "BEST BEFORE 2024/08/30" menunjukkan sebaiknya dikonsumsi sebelum 30 Agustus 2024.\n\n',
            style: TextStyle(fontSize: 14),
          ),
          TextSpan(
            text: 'Produk Kecantikan dan Perawatan\n',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text:
                '• Simbol "12M" berarti aman digunakan 12 bulan setelah dibuka dan masa penggunaan seharusnya digunakan sebelum tanggal EXP.\n'
                '• Tanggal seperti "LOT 202310" menunjukkan produksi Oktober 2023; biasanya berlaku beberapa tahun.\n'
                '• "PROD 01/2023" menunjukkan tanggal produksi Januari 2023.\n\n',
            style: TextStyle(fontSize: 14),
          ),
          TextSpan(
            text: 'Obat-obatan\n',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text:
                'Pada produk seperti obat-obatan biasanya dicantumkan tanggal kedaluwarsa (EXP) untuk menentukan batas aman konsumsi. '
                'Akan tetapi, untuk produk obat resep dokter perlu dikonsultasikan lebih lanjut kepada pihak berkaitan.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget isiKonten4() {
    return RichText(
      text: TextSpan(
        style: AppStyle.detailsub,
        children: const [
          TextSpan(
            text: 'Makanan dan Minuman\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Jika pada produk tertera “EXP 12/09/2024” artinya kedaluwarsa pada 9 Desember 2024. '
                'Jika terdapat tulisan “BEST BEFORE 2024/08/30” menunjukkan sebaiknya dikonsumsi sebelum 30 Agustus 2024.\n\n',
          ),
          TextSpan(
            text: 'Produk Kecantikan dan Perawatan\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '• Simbol “12M” berarti aman digunakan 12 bulan setelah dibuka dan masa penggunaan seharusnya digunakan sebelum tanggal EXP.\n'
                '• Tanggal seperti “LOT 202310” menunjukkan produksi Oktober 2023; biasanya berlaku beberapa tahun.\n'
                '• “PROD 01/2023” menunjukkan tanggal produksi Januari 2023.\n\n',
          ),
          TextSpan(
            text: 'Obat-obatan\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                'Pada produk seperti obat-obatan biasanya dicantumkan tanggal kedaluwarsa (EXP) untuk menentukan batas aman konsumsi. '
                'Akan tetapi, untuk produk obat resep dokter perlu dikonsultasikan lebih lanjut kepada pihak berkaitan.',
          ),
        ],
      ),
    );
  }

  Widget isiKonten5() {
    return RichText(
      text: TextSpan(
        style: AppStyle.detailsub,
        children: const [
          TextSpan(
            text:
                "Beberapa produk tidak memiliki tanggal kedaluwarsa khususnya pada bahan makanan. Layak atau tidaknya konsumsi produk disesuaikan dengan ",
          ),
          TextSpan(
            text: "indikator produk kedaluwarsa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                ". Akan tetapi, terdapat masa simpan umum pada produk yang tidak memiliki tanggal kedaluwarsa khususnya pada bahan makanan.\n\n",
          ),
          TextSpan(
            text: "• Susu: masa simpan hingga 7 hari di dalam kulkas\n",
          ),
          TextSpan(
            text: "• Telur: masa simpan 3–5 minggu di dalam kulkas\n",
          ),
          TextSpan(
            text:
                "• Daging giling: masa simpan 1–2 hari di kulkas, dibekukan jika tidak segera digunakan\n",
          ),
          TextSpan(
            text: "• Daging matang: masa simpan 3–4 hari di kulkas\n",
          ),
          TextSpan(
            text:
                "• Daging kemasan: tahan 2 minggu sebelum dibuka dan 3–5 hari setelah dibuka\n",
          ),
          TextSpan(
            text:
                "• Buah kalengan: 12–18 bulan sebelum dibuka di suhu ruang dan 5–7 hari ketika sudah dibuka di kulkas\n",
          ),
          TextSpan(
            text: "• Ikan: masa simpan 1–3 hari di kulkas\n",
          ),
          TextSpan(
            text: "• Sayur-sayuran: masa simpan 5–7 hari di kulkas\n",
          ),
          TextSpan(
            text: "• Tomat: masa simpan 3 hari di kulkas\n",
          ),
          TextSpan(
            text: "• Buah-buahan: masa simpan 4–7 hari di kulkas\n\n",
          ),
          TextSpan(
            text:
                "*Data berikut adalah masa simpan umum, setiap bahan makanan memiliki masa kedaluwarsa yang berbeda-beda tergantung dari jenis dan faktor penyimpanan.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}