import 'package:flutter/material.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

class MyAppointments extends StatelessWidget {
  MyAppointments({Key? key}) : super(key: key);
  final controller = Get.put(SellerListController());
  static String imagesBaseUrl = 'https://zeeshannawaz.com/p_services/';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerListController>(builder: (controllerbuilder) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: MyColors.cardGrey,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: MyColors.black,
              )),
          title: Text(
            "My Appointments",
            style: TextStyle(color: MyColors.black, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Obx(() {
                return Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.isUpComing.value =
                              !controller.isUpComing.value;
                          controller.update();
                        },
                        child: Container(
                            child: Text(
                          "Upcoming",
                          style: controller.isUpComing.value
                              ? TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)
                              : TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.black.withOpacity(0.4)),
                        ))),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.isUpComing.value =
                              !controller.isUpComing.value;
                          controller.update();
                        },
                        child: Container(
                            child: Text(
                          "Past",
                          style: controller.isUpComing.value
                              ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.black.withOpacity(0.4))
                              : TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                        )))
                  ],
                );
              }),
              const SizedBox(
                height: 15,
              ),
              controllerbuilder.isUpComing.value == true
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: controller.myAppointmentModal.data!
                              .upcommingBookings!.length,
                          itemBuilder: (BuildContext conterx, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                height: 140,
                                color: MyColors.cardGrey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 140,
                                            width: 100,
                                            child: FadeInImage.assetNetwork(
                                              placeholder: "",
                                              image:
                                                  "${imagesBaseUrl}${controller.myAppointmentModal.data!.upcommingBookings![index].image}",
                                              fit: BoxFit.cover,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(controller
                                                .myAppointmentModal
                                                .data!
                                                .upcommingBookings![index]
                                                .seller
                                                .toString()),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(controller
                                                .myAppointmentModal
                                                .data!
                                                .upcommingBookings![index]
                                                .bookingStatus
                                                .toString()),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.date_range,
                                                  size: 15,
                                                ),
                                                Text(controller
                                                    .myAppointmentModal
                                                    .data!
                                                    .upcommingBookings![index]
                                                    .dateTime
                                                    .toString()),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children:  [
                                                GestureDetector(

                                                 onTap: (){
                                                   Get.dialog(Dialog(
                                                    child: Container(
                                                      height: 100,
                                                      width: 300,

                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Column(children: [
Text("Are you sure! you want to cancled\n this order"),

                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 100.0,top: 30),
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                  onTap:(){
                                                                    controllerbuilder.cancledBookingFunction(controller.myAppointmentModal.data!.upcommingBookings![index].bookingId);

                                                                  },
                                                                  child: Text("Ok",style: TextStyle(color: MyColors.blue10),)),
                                                              SizedBox(width: 40,),
                                                              GestureDetector(
                                                                  onTap: (){
                                                                    Get.back();
                                                                  },
                                                                  child: Text("Cancled"))
                                                            ],
                                                          ),
                                                        )
                                                      ],),
                                                    ),
                                                    ),
                                                   ));
                                                 },
                                                  child: const Text(
                                                    "Cancle",
                                                    style: TextStyle(
                                                        color: MyColors.red500,
                                                        decoration: TextDecoration
                                                            .underline,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                const Text("Confirmed",
                                                    style: TextStyle(
                                                        color: MyColors.green,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: controller
                              .myAppointmentModal.data!.pastBookings!.length,
                          itemBuilder: (BuildContext conterx, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 15),
                                height: 140,
                                color: MyColors.cardGrey,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 140,
                                          width: 100,
                                          child: FadeInImage.assetNetwork(
                                            placeholder: "",
                                            image:
                                                "${imagesBaseUrl}${controller.myAppointmentModal.data!.pastBookings![index].image}",
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(controller
                                                .myAppointmentModal
                                                .data!
                                                .pastBookings![index]
                                                .seller
                                                .toString()),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(controller
                                                .myAppointmentModal
                                                .data!
                                                .pastBookings![index]
                                                .bookingStatus
                                                .toString()),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.date_range,
                                                  size: 15,
                                                ),
                                                Text(controller
                                                    .myAppointmentModal
                                                    .data!
                                                    .pastBookings![index]
                                                    .dateTime
                                                    .toString()),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                           SizedBox(width: 40,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(),
                                                SizedBox(width: 80,),
                                                Container(
alignment: Alignment.centerRight,
                                                  child: Text(controller.myAppointmentModal.data!.pastBookings![index].bookingStatus.toString(),style: TextStyle(color: MyColors.viewcolor),),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      );
    });
  }
}
