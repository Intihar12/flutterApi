import 'package:flutter/material.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../controller/SellerListController/SellerListController.dart';
import '../ui/profile_gallery_all/profile_gallery_all.dart';
import '../values/my_imgs.dart';

class Gallery extends StatelessWidget {
   Gallery({Key? key}) : super(key: key);
   static String imagesBaseUrl ='https://zeeshannawaz.com/p_services/';
   final controller=Get.put(SellerListController());

  @override
  Widget build(BuildContext context) {
    return
     Container(
       padding: EdgeInsets.only(left: 20),
       color: MyColors.white,
       height: 400,
       child:controller.sellerProfileModal.data!.gallery!.length==0 ? Center(
         child: Container(
           alignment: Alignment.center,
           height: 20,
           width: double.infinity,
          // color: Colors.red,
           child: Text("No image in the gallery"),
         ),
       ) : GridView.builder(

         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 3,
           mainAxisSpacing: 20,
crossAxisSpacing: 10
           //childAspectRatio: 3/0 ,
          //   crossAxisSpacing: 20,
            // mainAxisSpacing: 20,
          // mainAxisExtent: 200
         ),
           itemCount: controller.sellerProfileModal.data!.gallery!.length<6?controller.sellerProfileModal.data!.gallery!.length:6,
           shrinkWrap: true,
           itemBuilder: (BuildContext context,int index){
             Get.log("${controller.sellerProfileModal.data!.gallery![index].image!}");
         return  index==5?Padding(
           padding: const EdgeInsets.all(10.0),
           child: GestureDetector(
             onTap: (){
               Get.to(()=>ProfileGalleryAll());
             },
             child: Container(

               width: 100,
               height: 100,
               color: MyColors.cardGrey,
               alignment: Alignment.center,
               child: Text("View all"),
             ),
           ),
         ):Row(
           children: [
          // Text(controller.sellerProfileModal.data!.gallery![index].userId.toString(),

        //   ),

             SizedBox(
               // height: 100,
                width: 120,
               child: FadeInImage.assetNetwork(
                 placeholder: 'image/img.png',
                 image: "$imagesBaseUrl${controller
                     .sellerProfileModal.data!
                     .gallery![index].image!
                     }",
                 imageErrorBuilder: (context, e, stackTrace) =>
                     Image.asset(
                       MyImgs.errorimage,fit: BoxFit.cover,
                     ),
fit: BoxFit.cover,
               ),
             ),
           ],
         );
       }),
     );
  }
}
