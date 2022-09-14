import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/SellerListController/SellerListController.dart';

class About extends StatelessWidget {
   About({Key? key}) : super(key: key);
  final controller=Get.put(SellerListController());

  @override
  Widget build(BuildContext context) {

    return   controller.sellerProfileModal.data!.about!.isEmpty? Center(
      child: Container(
        child: Text("no Description"),),
    ) :
      Container(
        alignment: Alignment.center,
      child: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Text(controller.sellerProfileModal.data!.about.toString())
        ],),
      ),
    );
  }
}
