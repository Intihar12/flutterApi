

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/fake_store_controller/fake_store_controller.dart';

class DetailsPage extends StatelessWidget {
   DetailsPage({Key? key,}) : super(key: key);
 // final controller=Get.put(ServicesStoreController());
   final  controller=Get.put(FakeStoreController());

//final String id;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("intuu"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [

 //
 //          Obx((){
 //         return controller.isLoaded.value ?
 // SizedBox(      height: 300,
 //         child:
 //         ListView.builder(
 //           itemCount: controller.serviceSellerModal.data!.individual!.length,
 //              shrinkWrap: true,
 //              itemBuilder: (BuildContext context,int index){
 //                return Column(
 //                  children: [
 //                   // Text(modals.),
 //                    Text(controller.serviceSellerModal.data!.individual![index].individual!.businessAddress.toString()),
 //                    Text(controller.serviceSellerModal.data!.individual![index].individual!.email.toString()),
 //
 //                  ],
 //                );
 //
 //              },
 //
 //         )) : Center(child: CircularProgressIndicator());
 //
 //    }
        //  Text(Widget.id.toString())
       controller.isSellersLoaded.value? ListView.builder(
        itemCount: controller.serviceSellerModal.data!.individual!.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){
            return Column(
              children: [
                // Text(modals.),
                Text(controller.serviceSellerModal.data!.individual![index].individual!.businessAddress!),
                Text(controller.serviceSellerModal.data!.individual![index].individual!.email!),

              ],
            );

          },
        ):Center(child: CircularProgressIndicator(),)

          ],),
      ),
    );
  }
}
