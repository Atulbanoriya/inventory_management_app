import 'package:get/get.dart';
import 'package:inventory_management_system/helper/routes.dart';
import 'package:inventory_management_system/screens/dashboard_view/dashboard_binding.dart';
import 'package:inventory_management_system/screens/dashboard_view/dashboard_screen.dart';
import 'package:inventory_management_system/screens/login_view/login_binding.dart';
import 'package:inventory_management_system/screens/login_view/login_view.dart';
import 'package:inventory_management_system/screens/register_view/register_binding.dart';
import 'package:inventory_management_system/screens/register_view/register_screen.dart';

List<GetPage> allPages = <GetPage>[
  GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding()
  ),

  GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
  ),


  GetPage(
    name: Routes.dashboard,
    page: () =>  DashBoardScreen(),
    binding: DashBoardBinding(),
  ),
];
