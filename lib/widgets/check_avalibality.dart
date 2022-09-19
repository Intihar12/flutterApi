// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/SellerListController/SellerListController.dart';
// import '../values/my_colors.dart';
// import '../values/my_imgs.dart';
//
// // class CheckAvailability extends StatelessWidget {
// //   const CheckAvailability({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //
// //      onTap: (){
// //        settingModalBottomSheet(context);
// //      },
// //     );
// //   }
// // }
// void settingModalBottomSheet(context) {
//   final controller = Get.put(SellerListController());
//   controller.getAllUserAvalibility == null ? Center(
//     child: CircularProgressIndicator(),) :
//
//
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return
//
//
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(20), topLeft: Radius.circular(20)),
//             child: Container(
//               height: 550,
//               color: Colors.white,
// //decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
//                 child: Column(children: [
//
//                   Text("Approximate Availablity"),
//                   SizedBox(height: 8,),
//                    controller.isgetAllUserAvalibility.value ?
//                   Expanded(
//                     // height: 400,
//                     child: ListView.builder(
//
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         itemCount: controller.getAllUserAvalibility.data!
//                             .length,
//                         itemBuilder: (BuildContext context, int index) {
//                           Get.log("get all users avalability ${controller
//                               .getAllUserAvalibility.data!.length}");
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 15.0),
//                             child: Container(
//                               padding: EdgeInsets.only(
//                                   left: 20, right: 20, top: 10, bottom: 10),
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: MyColors.avalabilitycolor
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceBetween,
//                                 children: [
//                                   Text(controller.getAllUserAvalibility
//                                       .data![index].day.toString()),
//                                   SizedBox(width: 70,),
//                                   Column(children: [
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.rectangle,
//                                           color: MyColors.avalabilitycolor,
//                                           border: Border.all(
//                                               color: MyColors.grey)
//                                       ),
//                                       child: Icon(Icons.done),
//                                     ),
//                                     SizedBox(height: 10,),
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.rectangle,
//                                           color: MyColors.avalabilitycolor,
//                                           border: Border.all(
//                                               color: MyColors.grey)
//                                       ),
//                                       child: Icon(Icons.done),
//                                     )
//                                   ],),
//                                   SizedBox(width: 5,),
//                                   Expanded(
//
//                                     child: ListView.builder(
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount: controller
//                                             .getAllUserAvalibility.data![index]
//                                             .session!.length,
//                                         shrinkWrap: true,
//                                         itemBuilder: (BuildContext ctx,
//                                             int ind) {
//                                           return Container(
//                                             //  height: 20,
//                                             width: 40,
//                                             margin: EdgeInsets.all(6),
//
//                                             color: Colors.white,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(
//                                                   6.0),
//                                               child: Row(
//
//                                                 children: [
//                                                   ind == 0 ? Icon(
//                                                     Icons.wb_sunny,
//                                                     color: Colors.yellow,
//                                                     size: 15,)
//                                                       : Image.asset(
//                                                     MyImgs.afternoon, width: 15,
//                                                     height: 15,),
//                                                   // Icon(Icons.wb_sunny,color: Colors.yellow,size: 15,),
//                                                   //SizedBox(width: 5,),
//                                                   Center(
//                                                     child: Text(controller
//                                                         .getAllUserAvalibility
//                                                         .data![index]
//                                                         .session![ind].session!,
//                                                       style: TextStyle(
//                                                           fontSize: 12),),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         }),
//                                   )
//
//                                   //  Text(controller.getAllUserAvalibility.data![index].session![0].session!),
//
//
//                                 ],),
//                             ),
//                           );
//                         }),
//                   ):Center(child: CircularProgressIndicator(),)
//                 ],),
//               ),
//             ),
//           );
//       }
//   );
// }