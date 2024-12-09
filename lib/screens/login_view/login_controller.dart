import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_system/helper/routes.dart';

import '../../helper/db_helper.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> loginUser(String email, String password) async {
    final dbHelper = DatabaseHelper();

    try {
      final user = await dbHelper.login(email, password);

      if (user != null) {

        Get.snackbar(
            "Login Success",
            "You can enjoy your expression",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white
        );

        print("Login Successful: ${user['email']}");
        if (Routes.dashboard != null) {
          Get.toNamed(Routes.dashboard);
        } else {
          print("Error: Route to dashboard is not defined");
        }
      } else {

        Get.snackbar(
          "Login Failed",
      "Invalided Credentials",
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.red,
               colorText: Colors.white
        );
        print("Login Failed: Invalid credentials");
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }
}