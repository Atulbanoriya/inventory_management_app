import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_system/helper/routes.dart';
import '../../helper/db_helper.dart';

class RegisterController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var passwordVisible = false.obs;
  var isPasswordVisible = false.obs;

  void passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'All fields are required.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    final dbHelper = DatabaseHelper();
    if (await dbHelper.isUserExists(email)) {
      Get.snackbar('Error', 'User already exists.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    final result = await dbHelper.registerUser(email, password);
    if (result > 0) {
      Get.snackbar('Success', 'Registration successful!',
          backgroundColor: Colors.green, colorText: Colors.white);
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed(Routes.login);
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      });
    } else {
      Get.snackbar('Error', 'Registration failed.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

}
