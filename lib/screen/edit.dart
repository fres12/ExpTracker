import '../style/settings.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _namaItemController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _kategoriItemController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _namaItemController.addListener(_validateFields);
    _dateController.addListener(_validateFields);
    _kategoriItemController.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      _isButtonEnabled = _namaItemController.text.isNotEmpty &&
          _dateController.text.isNotEmpty &&
          _kategoriItemController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _namaItemController.dispose();
    _dateController.dispose();
    _kategoriItemController.dispose();
    super.dispose();
  }

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
                  'Edit Item',
                  style: AppStyle.header,
                ),
              ),
              // Ikon di kiri atas
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
        child: Container(
          margin: TPosition.marginPageDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Nama Item
              TextField(
                controller: _namaItemController,
                style: AppStyle.biasa,
                decoration: InputDecoration(
                  labelStyle: AppStyle.subtitle,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Nama Item',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
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
                style: AppStyle.biasa,
                decoration: InputDecoration(
                  labelStyle: AppStyle.subtitle,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Tanggal Kedaluwarsa',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
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
                controller: _kategoriItemController,
                style: AppStyle.biasa,
                decoration: InputDecoration(
                  labelStyle: AppStyle.subtitle,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Kategori Item',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  prefixIcon: Icon(Icons.category, color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(height: 16),

              // Input Catatan Penyimpanan
              TextField(
                controller: _catatanController,
                style: AppStyle.biasa,
                decoration: InputDecoration(
                  labelStyle: AppStyle.subtitle,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Catatan Penyimpanan',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.outline, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
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
                  onPressed: _isButtonEnabled
                      ? () {
                          //KODE ubah di sini nanti
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Berhasil disimpan."),
                          ));
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
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