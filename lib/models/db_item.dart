class Item {
  int? id;
  late String nama;
  late String added;
  late String expired;
  late String kategori;
  String? catatan;
  itemMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['added'] = added;
    mapping['nama'] = nama;
    mapping['expired'] = expired;
    mapping['kategori'] = kategori;
    mapping['catatan'] = catatan!;
    return mapping;
  }
}
