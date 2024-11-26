import 'package:get/get.dart';
import 'package:inventory_management_system/screens/login_view/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}