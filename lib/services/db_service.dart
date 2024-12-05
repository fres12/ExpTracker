import '../db_helper/repository.dart';
import '../models/item.dart';

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

  //Edit Item
  updateItem(Item item) async {
    return await _repository.updateData('items', item.itemMap());
  }

  deleteItem(itemId) async {
    return await _repository.deleteDataById('items', itemId);
  }
}
