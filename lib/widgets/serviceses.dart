import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/SellerListController/SellerListController.dart';

class Serviceses extends StatelessWidget {
   Serviceses({Key? key}) : super(key: key);
   final controller=Get.put(SellerListController());
   static String imagesBaseUrl ='https://zeeshannawaz.com/p_services/';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.sellerProfileModal.data!.services!.length,
      itemBuilder: (BuildContext context,int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(

            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0 ,top: 10,bottom: 10),
              child: Row(children: [
                Container(
                    width: 70,
                    height: 70,
                    child: FadeInImage.assetNetwork(placeholder: "",
                        image: "${imagesBaseUrl}${controller.sellerProfileModal
                            .data!.services![index].image}")),
                SizedBox(width: 15,),
                Text(controller.sellerProfileModal.data!.services![index].name!)
              ],),
            ),
          ),
        );

      } );
  }
}
