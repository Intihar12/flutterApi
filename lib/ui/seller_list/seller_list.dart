import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/models/service_seller_modal/service_seller_modal.dart';
import 'package:flutterapis/values/dimens.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../values/my_imgs.dart';
import '../../widgets/customTextfield.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/sellerlistbtnwidget.dart';
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
                      onChanged: (value){

                        sellercontroller.isIndividual.value==false ? sellercontroller.searchServicesSellerFunction(value,true)
                            :sellercontroller.searchServicesSellerFunction(value,false) ;
                      },
                     // controller: sellercontroller.searchController,
                      icon: Icon(Icons.search),
                      text: "I’m looking for...",
                      controller: sellercontroller.searchController,

                      keyboardType: TextInputType.text,
                      length:80,
                      inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
                      suffixIcon: GestureDetector(
                          onTap: (){
                            Get.to(Filters());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(MyImgs.filter),
                          )),


                    ),
                    SizedBox(height: 10,),

                    Text("Panters near you"),

                    SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //    // controller.isIndividual.value==true;
                            //     controller.isIndividual.value =
                            //     !controller.isIndividual.value;
                            //     controller.update();
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     width: 120,
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(5),
                            //         color: Colors.white,
                            //
                            //         border: Border.all(color: controller
                            //             .isIndividual.value
                            //             ? MyColors.green
                            //             : MyColors.grey)
                            //     ),
                            //
                            //
                            //     child: Text("Individual", style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w300,
                            //         color: controller.isIndividual.value
                            //             ? MyColors.starsColor
                            //             : MyColors.black),
                            //     ),),
                            // ),
                            FilterButtons(text: "Individual",index: 1,select: sellercontroller.isIndividuals,ontap: (){
                              sellercontroller.isIndividuals=1;
                              sellercontroller.isIndividual.value=!sellercontroller.isIndividual.value;
                              sellercontroller.searchController.clear();
                              sellercontroller.searchServicesSellerFunction("",true);
                              sellercontroller.update();

                            }),

                            FilterButtons(text: "Company",index: 2,select: sellercontroller.isIndividuals,ontap: (){
                              sellercontroller.isIndividuals=2;
                              sellercontroller.isIndividual.value=!sellercontroller.isIndividual.value;
                              sellercontroller.searchController.clear();
                              sellercontroller.searchServicesSellerFunction("", false);
                              sellercontroller.update();

                            }),
                          ],),


                    SizedBox(height: Dimens.size14,),


                    sellercontroller.isIndividuals== 1 ?
                Expanded(

                          child: sellercontroller.serviceSellerIndividual.isNotEmpty ? ListView.builder(
                            itemCount: sellercontroller.serviceSellerIndividual.length,
                            //  scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              Get.log("$index : ${sellercontroller.serviceSellerIndividual[index].individual!
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
                                              image: "${imagesBaseUrl}${sellercontroller
                                                  .serviceSellerIndividual[index].individual!
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
                                                  Text(sellercontroller.serviceSellerIndividual[index]
                                                      .individual!.firstName!),
                                                  SizedBox(width: Dimens.size8,),
                                                  Text(sellercontroller.serviceSellerModal
                                                      .data!.individual![index]
                                                      .individual!.lastName!),
                                                  SizedBox(height: Dimens.size14,),


                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Icon(Icons.location_on_outlined,size: 10,),
                                                  Text(sellercontroller.serviceSellerIndividual[index].individual!
                                                      .businessAddress!),
                                                ],
                                              ),

                                              Text(sellercontroller.serviceSellerIndividual[index].individual!
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
                                                sellercontroller.gatAllUsersAvalabilityFunction(sellercontroller.serviceSellerIndividual[index].individual!.id);
                                                sellercontroller.isgetAllUserAvalibility=false.obs;
                                                sellercontroller.update();
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
                                                child: const Text("Check Availabilty",
                                                  style: TextStyle(
                                                      color: MyColors.green),),
                                              ),
                                            ),
                                            InkWell(

                                              onTap: () {
                                                sellercontroller.sellerProfileFunction(sellercontroller.serviceSellerIndividual[index].individual!.id);
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
                                                child: const Text("View Profile",
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
                          ): Text("No Result found") )
                          : Expanded(child: sellercontroller.serviceSellerCompany.isNotEmpty ?  ListView.builder(
                          itemCount: sellercontroller.serviceSellerCompany.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context,int index)
                      {
                        Get.log(sellercontroller.serviceSellerModal.data!.company!.length
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
                                      image: "${imagesBaseUrl}${sellercontroller
                                          .serviceSellerCompany[index].company!
                                          .profileImage}",
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Row(
                                        children: [
                                          Text(sellercontroller.serviceSellerCompany[index].company!.firstName!),
                                          Text(sellercontroller.serviceSellerModal.data!
                                              .company![index].company!.lastName!),
                                        ],
                                      ),
                                      SizedBox(height: Dimens.size14,),

                                      Text(sellercontroller.serviceSellerCompany[index].company!
                                          .businessAddress!),
                                      Text(sellercontroller.serviceSellerCompany[index].company!.phone!),
                                      Text(sellercontroller.serviceSellerCompany[index].company!.email!),

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
                                          sellercontroller.gatAllUsersAvalabilityFunction(sellercontroller.serviceSellerCompany[index].company!.id);
                                          sellercontroller.isgetAllUserAvalibility=false.obs;
                                          sellercontroller.update();
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
                                          child: const Text("Check Availabilty",
                                            style: TextStyle(color: MyColors.green),),
                                        ),
                                      ),
                                      GestureDetector(

                                        onTap: (){
                                          sellercontroller.sellerProfileFunction(sellercontroller.serviceSellerCompany[index].company!.id);
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
                                          child: const Text("View Profile",
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
                      ): Center(child: Text("No Result Found"))
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
              return
                 ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              child: controller.isgetAllUserAvalibility.value ? Container(
                height: 550,
                color: Colors.white,
                child:  contextController.getAllUserAvalibility.data!.length==0 ?Center(child: Container(
                    child: Text("No availibility time!")
                ),): Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                  child:
                  Column(
                    children: [

                    Text("Approximate Availablity"),
SizedBox(height: 8,),
                    // controller.getAllUserAvalibility.data!.isEmpty ?Center(child: Container(
                    //  child: Text("No Availaibility")
                    // ),):

                    Expanded(
                     // height: 400,
                      child: Obx(
                          ()=>  controller.isgetAllUserAvalibility.value ?
                          ListView.builder(

                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.getAllUserAvalibility.data!.length,
                            itemBuilder: (BuildContext context,int index){
                              Get.log("get all users avalability ${controller.getAllUserAvalibility.data!.length}");
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: MyColors.avalabilitycolor
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Container(child: Text(controller.getAllUserAvalibility.data![index].day.toString())),
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
              ):Center(child: CircularProgressIndicator(),),
        );
            }
          );
        //:Center(child: CircularProgressIndicator(),);

      }
  );
}