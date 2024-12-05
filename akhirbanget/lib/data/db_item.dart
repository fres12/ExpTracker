class Item {
  int? id;
  String? nama;
  String? expired;
  String? kategori;
  String? catatan;
  itemMap() {
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['nama'] = nama!;
    mapping['expired'] = expired!;
    mapping['kategori'] = kategori!;
    mapping['catatan'] = catatan!;
    return mapping;
  }
}
