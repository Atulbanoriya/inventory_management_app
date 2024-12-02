import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'dashboard_controller.dart';

class DashBoardScreen extends GetView<DashBoardController>{
  const DashBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GetBuilder<DashBoardController>(
      builder: (dashboardController) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.03,
                ),

                controller.isLoading
                    ? shimmerAppBar(h, w)
                    : appBar(h, w),

                SizedBox(
                  height: h * 0.03,
                ),

                controller.isLoading
                    ? shimmerSearchBar(h, w)
                    : searchBar(h, w),

                holeScreen(h, w, controller),
              ],
            ),
          ),
        );
      },
    );
  }
}


Widget appBar( var h , var w){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [

          SizedBox(
            width:  w * 0.02,
          ),

          Image.asset(
            "assets/logo1.png",
            width:  w * 0.1,
            color: Colors.white,
          ),

          SizedBox(
            width:  w * 0.02,
          ),

          Text(
            "Inventory Management",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontHelper.textFormFont,
              fontWeight: FontWeight.bold,
              fontSize: h * 0.025,
            ),
          ),
        ],
      ),


      const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(
          Icons.notification_add_outlined,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget shimmerAppBar(var h, var w) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: w * 0.02,
            ),
            Container(
              width: w * 0.1,
              height: h * 0.05,
              color: Colors.grey[300],
            ),
            SizedBox(
              width: w * 0.02,
            ),
            Container(
              height: h * 0.025,
              width: w * 0.4,
              color: Colors.grey[300],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            height: h * 0.05,
            width: h * 0.05,
            color: Colors.grey[300],
          ),
        ),
      ],
    ),
  );
}

Widget searchBar(var h, var w) {
  return Container(
    width: w * 0.95,
    height: h * 0.06,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search...",
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Colors.black,
          fontFamily: FontHelper.buttonFont,
          fontWeight: FontWeight.bold
        )
      ),
      style: const TextStyle(
        fontSize: 16,
      ),
    ),
  );
}

Widget shimmerSearchBar(var h, var w) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: w * 0.95,
      height: h * 0.06,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}


Widget holeScreen(var h, var w, DashBoardController controller) {
  return controller.isLoading
      ? ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 6, // Number of shimmer placeholders
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: h * 0.3,
                width: w * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: h * 0.3,
                width: w * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      );
    },
  )
      : ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.itemList.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h * 0.3,
              width: w * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Left ${controller.itemList[index]}",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              height: h * 0.3,
              width: w * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Right ${controller.itemList[index]}",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}




