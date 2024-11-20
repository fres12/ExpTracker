class Item_model {
  final String nama_item;
  final String kategori;
  final DateTime exp;
  final DateTime datenow;
  final String timenow; // sementara string
  final String sisa; //sementara string
  final String catatan;
  final String sisanya;

  Item_model({
    required this.nama_item,
    required this.kategori,
    required this.exp,
    required this.datenow,
    required this.timenow,
    required this.sisa,
    required this.catatan,
    required this.sisanya,
  });
}
