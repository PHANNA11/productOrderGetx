import 'dart:collection';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_design2/item_model.dart';

class CardProductController extends GetxController {
  List<Item> list = <Item>[].obs();
  addCard(Item item) {
    list.add(item);
    print('Leng=${list.length}');
    update();
  }
}
