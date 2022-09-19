import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/values/dimens.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../values/my_imgs.dart';
import '../../widgets/customTextfield.dart';
import '../../widgets/custom_textfield.dart';
import '../filters/filters.dart';
import '../profile_serviceses/profile_serviceses.dart';

class SellerListPage extends StatelessWidget {
  SellerListPage({Key? key,}) : super(key: key);

  // final controller=Get.put(ServicesStoreController());
  final controller = Get.put(SellerListController());
  static String imagesBaseUrl ='https://zeeshannawaz.com/p_services/';

//final String id;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerListController>(
      builder: (sellercontroller) {
        return Scaffold(
            backgroundColor: MyColors.cardGrey,
            appBar: AppBar(
              backgroundColor: MyColors.viewcolor,
              title: Text("intuu"),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField3(
                      text: "I’m looking for...",
                     // controller: controller.emailController,
                      keyboardType: TextInputType.text,
                      length:80,
                      inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
                      suffixIcon: GestureDetector(
                          onTap: (){
                            Get.to(Filters());
                          },
                          child: Icon(Icons.filter)),

                    ),
                    Text("Panters near you"),

                    SizedBox(height: 20,),
                    Obx(() =>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                               // controller.isIndividual.value==true;
                                controller.isIndividual.value =
                                !controller.isIndividual.value;
                                controller.update();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,

                                    border: Border.all(color: controller
                                        .isIndividual.value
                                        ? MyColors.green
                                        : MyColors.grey)
                                ),


                                child: Text("Individual", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: controller.isIndividual.value
                                        ? MyColors.starsColor
                                        : MyColors.black),
                                ),),
                            ),


                            GestureDetector(

                              onTap: () {
                                controller.isIndividual.value =
                                !controller.isIndividual.value;
                                controller.update();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    border: Border.all(color: controller
                                        .isIndividual.value
                                        ? MyColors.grey
                                        : MyColors.green)
                                ),

                                child: Text("Company", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: controller.isIndividual.value
                                        ? MyColors.black
                                        : MyColors.starsColor),),
                              ),
                            ),
                          ],),
                    ),

                    SizedBox(height: Dimens.size14,),


                    sellercontroller.isIndividual.value== true ?
                Expanded(

                          child: ListView.builder(
                            itemCount: controller.serviceSellerModal.data!
                                .individual!.length,
                            //  scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              Get.log("$index : ${controller.serviceSellerModal
                                  .data!.individual![index].individual!
                                  .profileImage}");
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                  //height: 350,
                                  width: 200,
                                  color: MyColors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text(modals.),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 15.0,left: 10),
                                        child: Row(children: [

                                          SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: FadeInImage.assetNetwork(
                                              placeholder: 'image/img.png',
                                              image: "${imagesBaseUrl}${controller
                                                  .serviceSellerModal.data!
                                                  .individual![index].individual!
                                                  .profileImage}",
                                              imageErrorBuilder: (context, e, stackTrace) =>
                                                  Image.asset(
                                                    MyImgs.errorimage,fit: BoxFit.cover,
                                                  ),
                                            ),

                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(controller.serviceSellerModal
                                                      .data!.individual![index]
                                                      .individual!.firstName!),
                                                  SizedBox(width: Dimens.size8,),
                                                  Text(controller.serviceSellerModal
                                                      .data!.individual![index]
                                                      .individual!.lastName!),
                                                  SizedBox(height: Dimens.size14,),


                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Icon(Icons.location_on_outlined,size: 10,),
                                                  Text(controller.serviceSellerModal.data!
                                                      .individual![index].individual!
                                                      .businessAddress!),
                                                ],
                                              ),

                                              Text(controller.serviceSellerModal.data!
                                                  .individual![index].individual!
                                                  .description!),

                                            ],)

                                        ],),
                                      ),
                                      //  Text(controller.serviceSellerModal.data!.individual![index].individual!.profileImage!),
                                      SizedBox(height: Dimens.size14,),


                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap:(){
controller.gatAllUsersAvalabilityFunction(controller.serviceSellerModal.data!.individual![index].individual!.id);
controller.isgetAllUserAvalibility=false.obs;
controller.update();
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
                                                controller.sellerProfileFunction(controller.serviceSellerModal.data!.individual![index].individual!.id);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(5),
                                                    color: MyColors.viewcolor,
                                                    border: Border.all(
                                                        color: MyColors.black)
                                                ),
                                                child: Text("View Profile",
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
                              );
                            },
                          ))
                          : Expanded(child: ListView.builder(
                          itemCount: controller.serviceSellerModal.data!.company!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context,int index)
                      {
                        Get.log(controller.serviceSellerModal.data!.company!.length
                            .toString());
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            color: MyColors.white,
                            child: Column(
                              children: [
                                Row(children: [

                                  SizedBox(
                                    height: 100,
                                    width: 70,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'image/img.png',
                                      image: "${imagesBaseUrl}${controller
                                          .serviceSellerModal.data!
                                          .company![index].company!
                                          .profileImage}",
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Row(
                                        children: [
                                          Text(controller.serviceSellerModal.data!
                                              .company![index].company!.firstName!),
                                          Text(controller.serviceSellerModal.data!
                                              .company![index].company!.lastName!),
                                        ],
                                      ),
                                      SizedBox(height: Dimens.size14,),

                                      Text(controller.serviceSellerModal.data!
                                          .company![index].company!
                                          .businessAddress!),
                                      Text(controller.serviceSellerModal.data!
                                          .company![index].company!.phone!),
                                      Text(controller.serviceSellerModal.data!
                                          .company![index].company!.email!),

                                    ],)
                                ],),
                                SizedBox(height: 5,),
                                // Text(modals.),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      GestureDetector(

                                        onTap:(){
                                          controller.gatAllUsersAvalabilityFunction(controller.serviceSellerModal.data!.company![index].company!.id);
                                         controller.isgetAllUserAvalibility=false.obs;
                                         controller.update();
                                          settingModalBottomSheet(context);


                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 125,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: MyColors.white,
                                              border: Border.all(
                                                  color: MyColors.black)
                                          ),
                                          child: Text("Check Availabilty",
                                            style: TextStyle(color: MyColors.green),),
                                        ),
                                      ),
                                      GestureDetector(

                                        onTap: (){
                                          controller.sellerProfileFunction(controller.serviceSellerModal.data!.company![index].company!.id);
                                         // Get.to(()=>ProfileServicess());
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: MyColors.viewcolor,
                                              border: Border.all(
                                                  color: MyColors.black)
                                          ),
                                          child: Text("View Profile",
                                            style: TextStyle(color: MyColors.white),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                              ],
                            ),
                          ),
                        );
                      },
                      )
        )



                  ],
                )
            ));
      }
    );
  }
}

void settingModalBottomSheet(context){
  final controller = Get.put(SellerListController());
  //controller.getAllUserAvalibility.data!.isEmpty ?Center(child: CircularProgressIndicator(),):


  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return
          GetBuilder<SellerListController>(
            builder: (contextController) {
              return ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              child: Container(
                height: 550,
                color: Colors.white,
                child:  contextController.getAllUserAvalibility.data!.length==0 ?Center(child: Container(
                    child: Text("No availibility time!")
                ),): Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                  child: Column(children: [

                    Text("Approximate Availablity"),
SizedBox(height: 8,),
                    // controller.getAllUserAvalibility.data!.isEmpty ?Center(child: Container(
                    //  child: Text("No Availaibility")
                    // ),):

                    Expanded(
                     // height: 400,
                      child: Obx(
                          ()=>  controller.isgetAllUserAvalibility.value ? ListView.builder(

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
                            })
                              :Center(child: CircularProgressIndicator(),),
                      ),
                    )
                  ],),
                ),
              ),
        );
            }
          );
        //:Center(child: CircularProgressIndicator(),);

      }
  );
}