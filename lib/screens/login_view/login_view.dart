import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';
import 'package:inventory_management_system/helper/globalbutton.dart';
import 'package:inventory_management_system/screens/login_view/login_controller.dart';
import 'package:inventory_management_system/screens/register_view/register_screen.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GetBuilder(
        init:LoginController(),
        builder: (LoginController loginController){
        return  Scaffold(
          backgroundColor:  Colors.black,
          appBar:  AppBar(
            elevation: 0,
            backgroundColor: Colors.greenAccent,
            title: Text(
              "Inventory Management",
              style: TextStyle(
                  fontFamily: FontHelper.appBarFont
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  child: Column(
                    children: [

                      logo(h, w),

                      Text(
                        "Welcome back your account !!!",
                        style: TextStyle(
                            fontFamily: FontHelper.buttonFont,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: h * 0.02
                        ),
                      ),

                      SizedBox(
                        height: h * 0.03 ,
                      ),

                      inputField(h, w),

                      GlobalButton(
                        label: 'Login',
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

                      registerFont(h, w),

                      SizedBox(
                        height: h * 0.1 ,
                      ),
                    ],
                  )
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
      height: h * 0.2,
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

Widget inputField(var h , var w ){
  return Column(
    children: [
      TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: "Email/Phone No.",
          hintStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: FontHelper.textFormFont,
            fontWeight: FontWeight.bold,
            fontSize: h * 0.025,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),

      SizedBox(
        height: h * 0.02 ,
      ),

      TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: FontHelper.textFormFont,
            fontWeight: FontWeight.bold,
            fontSize: h * 0.025,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),

      SizedBox(
        height: h * 0.02 ,
      ),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              if (kDebugMode) {
                print("Hello I am working");
              }
            },
            child: Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontHelper.appBarFont,
                fontSize: h * 0.026,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),

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

Widget registerFont(var h, var w){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "If you don't have account ?  ",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: FontHelper.textFormFont
        ),
      ),

      InkWell(
        onTap: (){
          Navigator.push(Get.context!, MaterialPageRoute(builder: (_)=> const RegisterScreen()));
        },
        child: Text(
          "Register",
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontFamily: FontHelper.textFormFont
          ),
        ),
      ),
    ],
  );
}
