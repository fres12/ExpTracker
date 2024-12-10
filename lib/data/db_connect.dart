import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var path = "";
    final Database database;
    if (!kIsWeb) {
      var directory = await getApplicationDocumentsDirectory();
      path = join(directory.path, 'db_crud');
    }
    database = await openDatabase(path, version: 1, onCreate: _createDatabase);

    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        "CREATE TABLE items (id INTEGER PRIMARY KEY, added TEXT, nama TEXT, expired TEXT, kategori TEXT, catatan TEXT)";
    await database.execute(sql);
  }
}
