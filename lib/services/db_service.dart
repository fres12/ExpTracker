import '../data/db_repo.dart';
import '../models/db_item.dart';

class ItemService {
  late Repository _repository;
  ItemService() {
    _repository = Repository();
  }

  //Save Item
  saveItem(Item item) async {
    return await _repository.insertData('items', item.itemMap());
  }

  //Read All Items
  readAllItems() async {
    return await _repository.readData('items');
  }

  //Read Detail
  Future<Map<String, dynamic>> readItemById(int id) async {
    var connection = await _repository.database;
    var result = await connection?.query(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result != null && result.isNotEmpty) {
      return result.first; // Mengembalikan hasil pertama
    } else {
      throw Exception('Item dengan ID $id tidak ditemukan');
    }
  }

  //Edit Item
  updateItem(Item item) async {
    return await _repository.updateData('items', item.itemMap());
  }

  deleteItem(itemId) async {
    return await _repository.deleteDataById('items', itemId);
  }
}
