import 'package:flutter/material.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../../values/dimens.dart';
import '../../widgets/tabbar_widget.dart';

class ProfileServicess extends StatelessWidget {
   ProfileServicess({Key? key}) : super(key: key);
   static String imagesBaseUrl ='https://zeeshannawaz.com/p_services/';

   final controller=Get.put(SellerListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerListController>(
      builder: (sellercontroller) {
        return Scaffold(
          backgroundColor: MyColors.cardGrey,
          appBar: AppBar(
            title:Text("Painter"),
          ),

          body: sellercontroller.sellerProfileModal==null ?Center(child: CircularProgressIndicator(),):
          Column(children: [



            Container(
              color: MyColors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(children: [
                    SizedBox(
                      height: 100,

width: 100,
                    child: FadeInImage.assetNetwork(
                        placeholder: 'image/img.png',
                        image: "${ imagesBaseUrl
                    }${controller.sellerProfileModal.data!.profileImage}"),),
SizedBox(width: 15,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             Text( controller.sellerProfileModal.data!.firstName.toString()),
                             SizedBox(width: 10,),
                             Text( controller.sellerProfileModal.data!.lastName.toString()),

                           ],
                         ),
                         SizedBox(height: 5,),
                         Row(
                           children: [
                             Icon(Icons.star,color: Colors.yellow,size: 10,),
                             Icon(Icons.star,color: Colors.yellow,size: 10,),
                             Icon(Icons.star,color: Colors.yellow,size: 10,),
                             Icon(Icons.star,color: Colors.yellow,size: 10,),
                             SizedBox(width: 5,),
                             Text("( ${controller.sellerProfileModal.data!.totalReviews.toString()})"),
                           ],
                         ),
                         SizedBox(height: 5,),

                         Row(
                           children: [
                             Icon(Icons.location_on_outlined,size: 10,),
                             SizedBox(width: 5,),

                             Text( controller.sellerProfileModal.data!.businessAddress.toString()),
                           ],
                         ),

                       ],
                     )
                    ],),
                    SizedBox(height: Dimens.size14,),


                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius
                                    .circular(5),
                                color: MyColors.white,
                                border: Border.all(
                                    color: MyColors.black)
                            ),
                            child: Text("Check Availabilty",
                              style: TextStyle(
                                  color: MyColors.green),),
                          ),
                          InkWell(

                            onTap: () {
                             // controller.sellerProfileFunction(controller.serviceSellerModal.data!.individual![index].individual!.id.toString());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius
                                      .circular(5),
                                  color: MyColors.viewcolor,
                                  border: Border.all(
                                      color: MyColors.black)
                              ),
                              child: Text("Book an Appoient",
                                style: TextStyle(
                                    color: MyColors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),

SizedBox(height: 20,),
            Container(
              width: double.infinity,
                color: MyColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),

                Text("Business Details",style: TextStyle(fontSize: 19),),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(

                        width:24 ,
                        height: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,color: MyColors.viewcolor
                        ),
                        child: Icon(Icons.web,size: 15,color: MyColors.white,)),
                    SizedBox(width: 10,),
                    Text( controller.sellerProfileModal.data!.businessWebsite.toString()),
                  ],
                ),
                SizedBox(height: 15,),

                Row(
                  children: [
                    Container(

                        width:24 ,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,color: MyColors.viewcolor
                        ),
                        child: Icon(Icons.email,size: 15,color: MyColors.white,)),
                    SizedBox(width: 10,),
                    Text( controller.sellerProfileModal.data!.businessEmail.toString()),
                  ],
                ),
                SizedBox(height: 15,),

                Row(
                  children: [

                    Container(

                        width:24 ,
                        height: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,color: MyColors.viewcolor
                        ),
                        child: Icon(Icons.phone,size: 15,color: MyColors.white,)),
                    SizedBox(width: 10,),
                    Text( controller.sellerProfileModal.data!.businessPhone.toString()),
                  ],
                ),
                SizedBox(height: 15,),

                Row(
                  children: [
                    Container(

                        width:24 ,
                        height: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,color: MyColors.viewcolor
                        ),
                        child: Icon(Icons.location_on_outlined,size: 15,color: MyColors.white,)),
                    SizedBox(width: 10,),
                    Text( controller.sellerProfileModal.data!.businessAddress.toString()),
                  ],
                ),
                SizedBox(height: 15,),

              ],
            ),
                )),

            Container(
                height: 200,
                child: MyTabbedWidget())
          ] ,) ,
        );
      }
    );
  }
}
