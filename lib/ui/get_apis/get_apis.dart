import 'package:flutter/material.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:get/get.dart';


class GetApi extends StatelessWidget {
   GetApi({Key? key}) : super(key: key);
final controller=Get.put(SellerListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Get Apis"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){
            controller.getPlanFunction();


          }, child: Text("Pricing")),

            ElevatedButton(onPressed: (){
              controller.myAppointmentFunction();


            }, child: Text("Bookings"))
        ],),
      ),
    );
  }
}
