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
        print("Login Successful: ${user['email']}");
        if (Routes.dashboard != null) {
          Get.toNamed(Routes.dashboard);
        } else {
          print("Error: Route to dashboard is not defined");
        }
      } else {
        print("Login Failed: Invalid credentials");
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }
}