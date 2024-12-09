import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'dashboard_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),

                  controller.loading
                      ? shimmerAppBar(h, w)
                      : appBar(h, w),

                  SizedBox(
                    height: h * 0.03,
                  ),

                  controller.loading
                      ? shimmerSearchBar(h, w)
                      : searchBar(h, w),

                  SizedBox(
                    height: h * 0.03,
                  ),


                  boxTotalInventory(h, w, controller),

                  SizedBox(
                    height: h * 0.01,
                  ),

                  recentOrderInventory(h, w, controller),
                ],
              ),
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

Widget boxTotalInventory(double h, double w, DashBoardController controller) {
  return Row(
    children: [
      Expanded(
        child: Container(
          width: w * 0.46,
          height: h * 0.3,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Total Inventory Graph',
                style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontHelper.textFormFont
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  if (controller.totalInventoryData.isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
        
                  List<InventoryData> dataSource = controller.totalInventoryData;
        
                  return SfCartesianChart(
                    primaryXAxis: const CategoryAxis(
                      labelRotation: -45,
                    ),
                    primaryYAxis: const NumericAxis(
                      labelFormat: '{value}',
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                    ),
                    series: <CartesianSeries>[
                      LineSeries<InventoryData, String>(
                        dataSource: dataSource,
                        xValueMapper: (InventoryData data, _) => data.month,
                        yValueMapper: (InventoryData data, _) => data.value,
                        color: Colors.blue,
                        width: 2,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          borderWidth: 2,
                          color: Colors.blue,
                        ),
                      ),
                      ColumnSeries<InventoryData, String>(
                        dataSource: dataSource,
                        xValueMapper: (InventoryData data, _) => data.month,
                        yValueMapper: (InventoryData data, _) => data.value,
                        color: Colors.blue.withOpacity(0.4),
                      ),
                    ],
                    tooltipBehavior: TooltipBehavior(enable: false),
                  );
                }),
              ),
            ],
          ),
        ),
      ),

      SizedBox(
        width: w * 0.02,
      ),

      Expanded(child: Container(
        width: w * 0.46,
        height: h * 0.3,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory Status',
              style: TextStyle(
                  fontSize: h * 0.02,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontHelper.textFormFont
              ),
            ),
            Expanded(
              child: SfCircularChart(
                series: <CircularSeries>[
                  PieSeries<PieData, String>(
                    dataSource: controller.pieData,
                    xValueMapper: (PieData data, _) => data.category,
                    yValueMapper: (PieData data, _) => data.percentage,
                    pointColorMapper: (PieData data, _) => data.color,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    radius: '90%',
                    explode: true,
                    explodeIndex: 3,
                    startAngle: 0,
                    endAngle: 360,
                  ),
                ],
              ),
            ),
          ],
        ),
      ))
    ],
  );
}

Widget recentOrderInventory(var h, var w, DashBoardController controller) {
  return Container(
    width: w * 0.46,
    height: h * 0.3,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Recent Orders Inventory',
          style: TextStyle(
              fontSize: h * 0.02,
              fontWeight: FontWeight.bold,
              fontFamily: FontHelper.textFormFont
          ),
        ),
        Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.recentOrders.length,
                itemBuilder: (context, index) {
                  OrderData order = controller.recentOrders[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.orderName,
                          style:  TextStyle(
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontHelper.buttonFont
                          ),
                        ),
                         SizedBox(height: h *0.003),
                        LinearProgressIndicator(
                          value: order.percentage / 60,
                          color: _getProgressColor(order.orderName),
                          backgroundColor: Colors.grey[200],
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(10,),

                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        ),
      ],
    ),
  );
}

Color _getProgressColor(String orderName) {
  if (orderName == 'Order 1') return Colors.green;
  if (orderName == 'Order 2') return Colors.orange;
  if (orderName == 'Order 3') return Colors.blue;
  return Colors.red;
}






