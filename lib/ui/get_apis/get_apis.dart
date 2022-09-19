import 'package:flutter/material.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../filters/filters.dart';


class GetApi extends StatelessWidget {
   GetApi({Key? key}) : super(key: key);
final controller=Get.put(SellerListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.viewcolor,
      title: Text("Get Apis"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){
            controller.getPlanFunction();


          },style: ElevatedButton.styleFrom(primary: MyColors.viewcolor), child: Text("Pricing")),

            ElevatedButton(onPressed: (){
              controller.myAppointmentFunction();


            }, style: ElevatedButton.styleFrom(
              primary: MyColors.viewcolor, // Background color
            ), child: Text("Bookings"))
            ,

            ElevatedButton(onPressed: (){
             // controller.myAppointmentFunction();
Get.to(Filters());

            }, style: ElevatedButton.styleFrom(
              primary: MyColors.viewcolor, // Background color
            ), child: Text("Filters"))
        ],),
      ),
    );
  }
}
