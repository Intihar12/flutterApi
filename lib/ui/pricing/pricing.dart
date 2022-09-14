import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

class Pricing extends StatelessWidget {
   Pricing({Key? key}) : super(key: key);
final controller=Get.put(SellerListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.cardGrey,
        title: Text("Buy Subscriptions",style:  TextStyle(color: MyColors.black),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
Text("Our Pricing",style: TextStyle(color: MyColors.viewcolor,fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),


            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: controller.getPlanModal.data!.length,
                  itemBuilder: (BuildContext context,int index){

                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [

                      Container(
                        width: 300,
                        color: MyColors.viewcolor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.getPlanModal.data![index].title.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),

                                Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(" \$ ${controller.getPlanModal.data![index].price.toString()}  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      Text("/ ${controller.getPlanModal.data![index].days.toString()}")
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("Try it for 30 days",style: TextStyle(color: MyColors.white,))

                              ],),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 400,
                        width: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                            itemCount: controller.getPlanModal.data![index].features!.length,
                            itemBuilder: (BuildContext cont,int ind){

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(

                              height: 300,
                             // width: 300,
                              color: MyColors.cardGrey,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: Column(children: [
                                  Text(controller.getPlanModal.data![index].features![ind].featureName.toString()),
                                  SizedBox(height: 10,),
                                  Text(controller.getPlanModal.data![index].features![ind].createdAt.toString()),

SizedBox(height: 100,),

                                  Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                                    height: 30,
                                    //width: 50,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: MyColors.viewcolor
                                    ),
                                    child: Text("Choose Plan",style: TextStyle(color: MyColors.white),),
                                  )
                                ],),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                );

              }),
            )



            //
            // Container(
            //   color: MyColors.viewcolor,
            //   child: Center(
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            //       child: Column(
            //
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //         Text(controller.getPlanModal.data![0].title.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            //           SizedBox(height: 10,),
            //
            //           Center(
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(" \$ ${controller.getPlanModal.data![0].price.toString()}  ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            //               Text("/ ${controller.getPlanModal.data![0].days.toString()}")
            //             ],
            //           ),
            //         ),
            //           SizedBox(height: 10,),
            //           Text("Try it for 30 days",style: TextStyle(color: MyColors.white,))
            //
            //       ],),
            //     ),
            //   ),
            // ),
            //
            // Container(
            //   color: MyColors.cardGrey,
            //
            //
            //   child: Column(
            //     children: [
            //
            //     ],
            //   ),
            // )



          ],
        ),
      ),
    );
  }
}
