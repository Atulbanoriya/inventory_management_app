import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';
import 'package:inventory_management_system/helper/globalbutton.dart';
import 'package:inventory_management_system/screens/login_view/login_controller.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
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

                  inputField(h, w),

                  GlobalButton(
                    label: 'Login',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Button 1 Clicked!')),
                      );
                    },
                    height: h *0.07,
                    width: w * 0.9,
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
  }
}

Widget logo(var h, var w){
  return Center(
    child: Container(
      width:w * 0.9,
      height: h * 0.3,
      decoration: const BoxDecoration(
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
                fontSize: 15,
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

      Text(
        "Register",
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontFamily: FontHelper.textFormFont
        ),
      ),
    ],
  );
}
