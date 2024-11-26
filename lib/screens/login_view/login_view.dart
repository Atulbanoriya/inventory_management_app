import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';
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
             fontFamily: FontHelper.AppBarFont
           ),
         ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              child: Column(
                children: [
        
        
                  Center(
                   child: Container(
                     width: MediaQuery.of(context).size.width * 0.5,
                     height: MediaQuery.of(context).size.width * 0.8,
                     decoration: const BoxDecoration(
                       image: DecorationImage(
                         colorFilter: ColorFilter.srgbToLinearGamma(),
                           image: AssetImage(
                               "assets/inventory.png"
                           ),
                         fit: BoxFit.contain,
                       )
                     ),
        
                   ),
                  ),



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
                    children: [
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
                  ),

                  SizedBox(
                    height: h * 0.1 ,
                  ),

                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: MyTextButton(
                            bgColor: Colors.white,
                            buttonName: 'Register',
                            onTap: () {
                            },
                            textColor: Colors.black87,
                          ),
                        ),
                        Expanded(
                          child: MyTextButton(
                            bgColor: Colors.transparent,
                            buttonName: 'Sign In',
                            onTap: () {
                            },
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )


                ],
              )
          ),
        ),
      ),
    );
  }
}







class MyTextButton extends StatelessWidget {
  const MyTextButton({
    key,
    required this.buttonName,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);
  final String buttonName;
  final Function onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
                (states) => Colors.black12,
          ),
        ),
        onPressed: (){

        },
        child: Text(
          buttonName,
          // style: kButtonText.copyWith(color: textColor),
        ),
      ),
    );
  }
}