import 'package:get/get.dart';

class DashBoardController extends GetxController{
  var isLoading = true;
  var itemList = [];

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    itemList = List.generate(10, (index) => "Item $index");
    isLoading = false;
    update();
  }
}