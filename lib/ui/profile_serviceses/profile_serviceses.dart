import 'package:flutter/material.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../../values/dimens.dart';
import '../../values/my_imgs.dart';
import '../../widgets/check_avalibality.dart';
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
            backgroundColor: MyColors.viewcolor,
            title:Text("Painters"),
          ),

          body: sellercontroller.sellerProfileModal==null ?Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
            child: Column(children: [



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

                               Container(
                                   width: 170,
                                   child: Text( controller.sellerProfileModal.data!.businessAddress.toString(),overflow: TextOverflow.ellipsis,)),
                             ],
                           ),

                         ],
                       )
                      ],),
                      SizedBox(height: Dimens.size14,),


                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            GestureDetector(

                              onTap:(){
                                settingModalBottomSheet(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 125,
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
                            ),
                            InkWell(

                              onTap: () {
                               // controller.sellerProfileFunction(controller.serviceSellerModal.data!.individual![index].individual!.id.toString());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 125,
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
            ] ,),
          ) ,
        );
      }
    );
  }
}



void settingModalBottomSheet(context){
  final controller = Get.put(SellerListController());
 // controller.getAllUserAvalibility==null ?Center(child: CircularProgressIndicator(),):


  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return


          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            child: Container(
              height: 550,
              color: Colors.white,
//decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                child: Column(children: [

                  Text("Approximate Availablity"),
                  SizedBox(height: 8,),
                   controller.isgetAllUserAvalibility.value ?
                  Expanded(
                    // height: 400,
                    child: ListView.builder(

                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.getAllUserAvalibility.data!.length,
                        itemBuilder: (BuildContext context,int index){
                          Get.log("get all users avalability ${controller.getAllUserAvalibility.data!.length}");
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: MyColors.avalabilitycolor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.getAllUserAvalibility.data![index].day.toString()),
                                  SizedBox(width: 70,),
                                  Column(children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: MyColors.avalabilitycolor,
                                          border: Border.all(color: MyColors.grey)
                                      ),
                                      child: Icon(Icons.done),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: MyColors.avalabilitycolor,
                                          border: Border.all(color: MyColors.grey)
                                      ),
                                      child: Icon(Icons.done),
                                    )
                                  ],),
                                  SizedBox(width: 5,),
                                  Expanded(

                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: controller.getAllUserAvalibility.data![index].session!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext ctx, int ind){
                                          return Container(
                                            //  height: 20,
                                            width: 40,
                                            margin: EdgeInsets.all(6),

                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Row(

                                                children: [
                                                  ind==0 ?   Icon(Icons.wb_sunny,color: Colors.yellow,size: 15,)
                                                      :  Image.asset(MyImgs.afternoon,width: 15,height: 15,),
                                                  // Icon(Icons.wb_sunny,color: Colors.yellow,size: 15,),
                                                  //SizedBox(width: 5,),
                                                  Center(
                                                    child: Text(   controller.getAllUserAvalibility.data![index].session![ind].session!,style: TextStyle(fontSize: 12),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )

                                  //  Text(controller.getAllUserAvalibility.data![index].session![0].session!),





                                ],),
                            ),
                          );
                        }),
                  ):Center(child: CircularProgressIndicator(),)
                ],),
              ),
            ),
          );

      }
  );
}