import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/models/products/products_modal.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:flutterapis/values/my_imgs.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../controller/home_controller/home_controller.dart';
import '../../widgets/custom_textfield.dart';
import '../drawer_screen/dwarer_screen.dart';
import '../filters/filters.dart';


class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
//final controller=Get.put(HomeController());
// final  productcontroller=Get.put(SellerListController());

  var scaffoldKey = GlobalKey<ScaffoldState>();
 static String imagesBaseUrl = 'https://zeeshannawaz.com/p_services/';
 // static String baseurl="https://zeeshannawaz.com/p_services/service/get_all_service";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerListController>(
      builder: (contextcontroller) {
        return Scaffold(
          drawer: MyDrawer(),
          key: scaffoldKey,
          backgroundColor: MyColors.cardGrey,
          appBar: AppBar(
              backgroundColor: MyColors.viewcolor,

              title: const Text("Home")),
          body: SingleChildScrollView(
            child: Center(
              child: Column(


                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  SizedBox(height: 20,),
                  // TextField(
                  //   onChanged:(value){
                  //     productcontroller.filterSearch(value);
                  //   } ,
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 17,right: 15),
                    child: CustomTextField3(
                      onChanged:(value){ contextcontroller.filterSearch(value);},
icon: Icon(Icons.search,color: MyColors.black.withOpacity(0.4),),

                      text: "I’m looking for...",
                      // controller: controller.emailController,
                      keyboardType: TextInputType.text,
                      length:80,
                      inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
suffixIcon: GestureDetector(

  onTap: (){
    Get.to(()=>Filters());
  },
  child:   Padding(

    padding: const EdgeInsets.all(10.0),

    child:   Image.asset(MyImgs.filter),

  ),
),


                    ),
                  ),

                  SizedBox(height: 20,),


//               controller.obx((models) {
//                 return SizedBox(
//                   height: 300,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                       itemCount: models!.response!.length,
//                       itemBuilder: (BuildContext context, int i) {
//                         return Column(mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             //Text(models.response![i].email!),
//                             Text(
//                               'Hi ${GetStorage().read("email").toString().capitalizeFirst},',
//                               // style: textTheme.headline1!.copyWith(
//                               //   color: MyColors.primaryColor,
//                               //   fontSize: getFont(24),
//                               // ),
//                             ),
//                             SizedBox(height: 10,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('name ${GetStorage().read("fname").toString()}'),
//                                 Text('${GetStorage().read("lname").toString()}'),
//                               ],
//                             ),
//                             SizedBox(height: 10,),
//
//                             Center(
//                               child: Container(
//                                 alignment: Alignment.center,
//                                   width:300,
//                                   child: Text(models.response![i].displayText!)),
//                             ),
//                             Text(models.response![i].displayImage.toString()),
// //Image.network(models.response![i].displayImage.toString()),
//                             SizedBox(height: 15,),
//                            // Image.asset(models.response![0].displayImage![controller.current])
//                           ],
//                         );
//                       }),
//
//                 );
//               }),


                 //productcontroller.isLoaded.value?
                    SizedBox(height: 400,

                    child:  contextcontroller.fondServicesListValue.isNotEmpty ?  GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           // maxCrossAxisExtent: 200,
                         //   childAspectRatio: 3 / 2,
                          crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 40),
                        itemCount: contextcontroller.fondServicesListValue.length,

                        itemBuilder: (BuildContext context,int index){
                          Get.log("Images : ${ contextcontroller.fondServicesListValue[index].image}");
                        return Column(
                          children: [
Text( contextcontroller.fondServicesListValue[index].name!),
                            InkWell(
                              onTap: (){
                                contextcontroller.serviceStoreFunction(contextcontroller.products.data![index].id);
                               // Get.to(DetailsPage());
                              },
                              child: SizedBox(
                                height:80,
                                width:80,
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'image/img.png',
                                  image: "${imagesBaseUrl}${ contextcontroller.fondServicesListValue[index].image}",
                                ),
                              ),
                            ),
                          ],
                        );

                    // ):Center(
                    //   child: CircularProgressIndicator(),
                    // );
                  }): const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),),
SizedBox(height: 20,)


              ],),
            ),
          ),
        );
      }
    );
  }
}
