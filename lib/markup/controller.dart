import 'package:get/get.dart';

class MarkupController extends GetxController {
  RxInt itemsCount = RxInt(0);

  void addItem() {
    itemsCount++;
  }

  void removeItem() {
    if (itemsCount > 0) {
      itemsCount--;
    }
  }
}
