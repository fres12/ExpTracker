import 'package:exptracker/models/db_item.dart';
import '../style/settings.dart';
import 'package:flutter/material.dart';
import '../style/app_style.dart';
import '../services/db_service.dart';
import '../data/category.dart';

class EditScreen extends StatefulWidget {
  final Item item;
  const EditScreen({super.key, required this.item});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _namaItemController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  bool _isButtonEnabled = false;

  final _itemService = ItemService();

  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _namaItemController.text = widget.item.nama;
    _dateController.text = widget.item.expired;
    _selectedCategory = widget.item.kategori;
    _catatanController.text = widget.item.catatan ?? '';

    _namaItemController.addListener(_validateFields);
    _dateController.addListener(_validateFields);
    _catatanController.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      _isButtonEnabled = _namaItemController.text.isNotEmpty &&
          _dateController.text.isNotEmpty &&
          _selectedCategory != null && // Validasi kategori dropdown
          (_catatanController.text != widget.item.catatan ||
              _namaItemController.text != widget.item.nama ||
              _dateController.text != widget.item.expired ||
              _selectedCategory !=
                  widget.item.kategori); // Validasi perubahan pada dropdown
    });
  }

  @override
  void dispose() {
    _namaItemController.dispose();
    _dateController.dispose();
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

              // Pilih Kategori Item
              DropdownButtonFormField<String?>(
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                    _validateFields();
                  });
                },
                items:
                    categories.map<DropdownMenuItem<String?>>((String value) {
                  return DropdownMenuItem<String?>(
                    value: value,
                    child: Text(
                      value,
                      style: AppStyle.biasa,
                    ),
                  );
                }).toList(),
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
                dropdownColor: Colors.white,
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
                      ? () async {
                          var item = Item();
                          item.id = widget.item.id;
                          item.added = widget.item.added;
                          item.nama = _namaItemController.text;
                          item.expired = _dateController.text;
                          item.kategori = _selectedCategory!;
                          item.catatan = _catatanController.text;
                          var result = await _itemService.updateItem(item);
                          if (result != null) {
                            if (context.mounted) {
                              Navigator.pop(context,
                                  item); // Mengembalikan item yang diperbarui
                            }
                          }
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
