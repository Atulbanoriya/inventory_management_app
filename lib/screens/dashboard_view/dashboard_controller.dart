import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DashBoardController extends GetxController {


  var loading = true;

  var isLoading = true.obs;
  var itemList = [].obs;
  var totalInventoryData = <InventoryData>[].obs;
  var recentOrders = <OrderData>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchItems();
    fetchRecentOrders();


    totalInventoryData.addAll([
      InventoryData('Jan', 10),
      InventoryData('Feb', 20),
      InventoryData('Mar', 15),
      InventoryData('Apr', 25),
      InventoryData('May', 30),
      InventoryData('Jun', 80),
    ]);
  }



  final List<PieData> pieData = [
    PieData('Delivery ', 70, Colors.green),
    PieData('Pending ', 15, Colors.orange),
    PieData('Remaining ', 10, Colors.blue),
    PieData('Out of Stock Inventory', 5, Colors.red),
  ];


  void fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    itemList.assignAll(List.generate(10, (index) => "Item $index"));
    isLoading.value = false;
  }

  void fetchRecentOrders() async {
    await Future.delayed(const Duration(seconds: 2));
    recentOrders.assignAll([
      OrderData('Order 1', 50),
      OrderData('Order 2', 30),
      OrderData('Order 3', 20),
      OrderData('Order 4', 10),
    ]);
    isLoading.value = false;
  }
}


class InventoryData {
  final String month;
  final double value;

  InventoryData(this.month, this.value);
}


class PieData {
  final String category;
  final double percentage;
  final Color color;

  PieData(this.category, this.percentage, this.color);
}

class OrderData {
  String orderName;
  double percentage;

  OrderData(this.orderName, this.percentage);
}