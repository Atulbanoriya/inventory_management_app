import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  var isPasswordVisible = false.obs;
  var passwordVisible = false.obs;

  TextEditingController emailController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  void passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

}
