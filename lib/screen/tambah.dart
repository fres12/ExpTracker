import 'package:budgetku/style/settings.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';

class TambahScreen extends StatelessWidget {
  TambahScreen({super.key});

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(71), // Tinggi AppBar
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: TColors.outline, // Warna outline di bawah
                width: 0.5, // Ketebalan outline
              ),
            ),
          ),
          padding: TPosition.topnavbar,
        child: Stack(
          children: [
            // Teks di tengah
            Align(
              alignment: Alignment.center,
              child: Text(
                'Tambah Item',
                style: AppStyle.header,
              ),
            ),
            // Ikon di kanan atas
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Aksi untuk tombol back
                  Navigator.pop(context);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Nama Item
              TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Nama Item',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  prefixIcon: Icon(Icons.abc, color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(height: 16),

              // Input Tanggal
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Tanggal Kadaluwarsa',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  prefixIcon:
                      Icon(Icons.date_range, color: Colors.grey.shade500),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    _dateController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
              const SizedBox(height: 16),

              // Input Kategori Item
              TextField(
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Kategori Item',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  prefixIcon: Icon(Icons.category, color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(height: 16),

              // Input Catatan Penyimpanan
              TextField(
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Catatan Penyimpanan',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  prefixIcon: Icon(Icons.note, color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(height: 32),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi tombol
                    print('Tanggal yang dipilih: ${_dateController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna biru
                    foregroundColor: Colors.white, // Warna teks
                    padding: const EdgeInsets.symmetric(
                        vertical: 16), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Sudut membulat
                    ),
                  ),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
