import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';
import 'package:inventory_management_system/helper/globalbutton.dart';
import 'package:inventory_management_system/screens/register_view/register_controller.dart';

class RegisterScreen extends GetView<RegisterController>{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {



    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GetBuilder(
        init: RegisterController(),
        builder: (RegisterController registerController){
          return Scaffold(
            backgroundColor: Colors.black,

            body:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    logo(h,w),

                    Text(
                      "Register to manage your item's & helper people to explore",
                      style: TextStyle(
                          fontFamily: FontHelper.buttonFont,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: h * 0.016
                      ),
                    ),

                    SizedBox(
                      height: h* 0.03,
                    ),

                    inputField(h, w , controller),

                    GlobalButton(
                      label: 'Register',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Button Clicked!')),
                        );
                      },
                      height: h *0.07,
                      width: w * 1,
                      color: Colors.greenAccent,
                    ),

                    orDivider(h, w),

                    otherRegisterOption(h, w),

                  ],
                ),
              ),
            ),
          );
    });
  }
}


Widget logo(var h, var w){
  return Center(
    child: Container(
      height: h * 0.25,
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
                "assets/system.png"
            ),
            fit: BoxFit.contain,
          )
      ),

    ),
  );
}

Widget inputField(var h , var w , RegisterController controller){
  return Column(
    children: [
      TextFormField(
        autofocus: false,
        controller: controller.emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: "Email/Phone No.",
          hintStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: FontHelper.textFormFont,
            fontWeight: FontWeight.bold,
            fontSize: h * 0.023,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),

      SizedBox(
        height: h * 0.02 ,
      ),

      Obx(()=> TextFormField(
        autofocus: false,
        obscureText: !controller.passwordVisible.value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.passwordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: controller.passwordVisibility,
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: FontHelper.textFormFont,
            fontWeight: FontWeight.bold,
            fontSize: h * 0.023,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      )),

      SizedBox(
        height: h * 0.02 ,
      ),

      Obx(() => TextFormField(
        obscureText: !controller.isPasswordVisible.value,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: "Conform Password",
          hintStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: FontHelper.textFormFont,
            fontWeight: FontWeight.bold,
            fontSize: h * 0.023,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      )),

      SizedBox(
        height: h * 0.02 ,
      ),
    ],
  );
}

Widget orDivider(var h , var w){
  return  Row(
    children: [
      SizedBox(
        height: h * 0.1,
      ),
      Expanded(
        child: Divider(
          color: Colors.grey[400],
          thickness: 1,
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'OR',
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: Colors.grey[400],
          thickness: 1,
        ),
      ),
    ],
  );
}

Widget otherRegisterOption(var h , var w){
  return Row(
    children: [
      Expanded(
          child: GlobalButton(
              label: "Google Sig-up",
              onPressed: (){},
              height: h *0.07,
              width: w * 0.2,
              color: Color(0xffe780ce),
          ),
      ),

      SizedBox(
        width: w * 0.04,
      ),

      Expanded(
          child: GlobalButton(
              label: "Facebook Sig-up",
              onPressed: (){},
              height: h *0.07,
              width: w * 0.2,
              color: Colors.lightBlue,
          )
      ),
    ],
  );
}