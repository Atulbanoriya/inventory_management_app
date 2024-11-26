import 'package:get/get.dart';
import 'package:inventory_management_system/helper/routes.dart';
import 'package:inventory_management_system/screens/login_view/login_binding.dart';
import 'package:inventory_management_system/screens/login_view/login_view.dart';

List<GetPage> allPages = <GetPage>[

  GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding()
  ),

];
