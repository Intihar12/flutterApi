import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapis/models/products/products_modal.dart';
import 'package:flutterapis/ui/get_apis/get_apis.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../controller/home_controller/home_controller.dart';
import '../../widgets/custom_textfield.dart';


class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
final controller=Get.put(HomeController());
final  productcontroller=Get.put(SellerListController());


 static String imagesBaseUrl = 'https://zeeshannawaz.com/p_services/';
 // static String baseurl="https://zeeshannawaz.com/p_services/service/get_all_service";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors.viewcolor,
          title: Text("Home")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(height: 20,),
              TextField(
                onChanged:(String){
                  productcontroller.filterSearch(String);
                } ,
              ),

              // CustomTextField3(
              //   onChanged: productcontroller.filterSearch(),
              //
              //   text: "I’m looking for...",
              //   // controller: controller.emailController,
              //   keyboardType: TextInputType.text,
              //   length:80,
              //   inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
              //
              //
              // ),
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

                Obx((){
                return productcontroller.isLoaded.value? SizedBox(height: 400,

                child:  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       // maxCrossAxisExtent: 200,
                     //   childAspectRatio: 3 / 2,
                      crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 40),
                    itemCount: productcontroller.products.data!.length,
                    itemBuilder: (BuildContext context,int index){
                      Get.log("Images : ${ productcontroller.products.data![index].image}");
                    return Column(
                      children: [
Text( productcontroller.productList[index].name!),
                        InkWell(
                          onTap: (){
                            productcontroller.serviceStoreFunction(productcontroller.products.data![index].id);
                           // Get.to(DetailsPage());
                          },
                          child: SizedBox(
                            height:80,
                            width:80,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'image/img.png',
                              image: "${imagesBaseUrl}${ productcontroller.products.data![index].image}",
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                ):Center(
                  child: CircularProgressIndicator(),
                );
              }),
SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: (){
                Get.to(GetApi());


              }, style: ElevatedButton.styleFrom(
                primary: MyColors.viewcolor, // Background color
              ), child: Text("Buy Subscriptions"))


          ],),
        ),
      ),
    );
  }
}
