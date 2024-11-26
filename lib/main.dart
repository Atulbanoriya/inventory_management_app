import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/pages.dart';
import 'helper/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inventory Management',
      debugShowCheckedModeBanner: false,
      getPages: allPages,
      initialRoute: Routes.login,
    );
  }
}

