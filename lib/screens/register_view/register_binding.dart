import 'package:get/get.dart';
import 'package:inventory_management_system/screens/register_view/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}