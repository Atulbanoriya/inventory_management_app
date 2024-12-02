import 'package:get/get.dart';
import 'package:inventory_management_system/screens/dashboard_view/dashboard_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(DashBoardController());
  }
}