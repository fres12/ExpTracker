import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../style/app_style.dart';
import '../style/settings.dart';

class DetailItemPage extends StatelessWidget {
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
                      // halaman edit
                      Navigator.pushNamed(context, '/editScreen');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: TPosition.marginPageDetail,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: TColors.outline, width: 0.5)),
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
                        color:
                            TColors.backicon, // Warna abu untuk icon background
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Iconsax.strongbox,
                        color: TColors.icon,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Item Name
                    Text(
                      'Pisang',
                      style: AppStyle.detailTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Details Section
              Expanded(
                child: ListView(
                  children: [
                    buildDetailRow('Waktu ditambahkan', '23:42'),
                    buildDetailRow('Tanggal ditambahkan', '18-11-2024'),
                    buildDetailRow('Tanggal kedaluwarsa', '20-11-2024'),
                    buildDetailRow('Waktu tersisa', '1 hari'),
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
                          SizedBox(height: 4),
                          Text(
                            'Disimpan di kulkas rak sebelah kiri',
                            style: AppStyle.detailsub,
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
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Handle delete action
                    },
                    child: Text(
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
            style: AppStyle.detailsub,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}

}
