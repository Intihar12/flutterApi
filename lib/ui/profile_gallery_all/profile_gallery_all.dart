import 'package:flutter/material.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';

import '../../controller/SellerListController/SellerListController.dart';
import '../../values/my_imgs.dart';

class ProfileGalleryAll extends StatelessWidget {
  ProfileGalleryAll({Key? key}) : super(key: key);
  static String imagesBaseUrl = 'https://zeeshannawaz.com/p_services/';
  final controller = Get.put(SellerListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.viewcolor,
        title: Text("Gallery"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //  maxCrossAxisExtent:160,

                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // childAspectRatio: 3/2,
                    //   mainAxisExtent: 150
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:
                      controller.sellerProfileModal.data!.gallery!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.dialog(
                            Dialog(
                              child: Container(
                        height: 450,
                          width: 300,
                        //  color: Colors.red,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 450,
                                      width: 300,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "",
                                        image:
                                        "$imagesBaseUrl${controller.sellerProfileModal.data!.gallery![index].image}",
                                        imageErrorBuilder: (context, e, stackTrace) =>
                                            Image.asset(
                                              MyImgs.errorimage,fit: BoxFit.cover,
                                            ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(

                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: MyColors.white
                                          ),
                                          child: GestureDetector(
                                              onTap: (){
                                                Get.back();
                                              },
                                              child: Icon(Icons.clear)),
                                        ),
                                      )
                                  ],
                                ),
                        ),
                            ));
                      },
                      child: SizedBox(
                          width: 120,
                          child: FadeInImage.assetNetwork(
                              placeholder: "",
                              image:
                                  "$imagesBaseUrl${controller.sellerProfileModal.data!.gallery![index].image}",
                            imageErrorBuilder: (context, e, stackTrace) =>
                                Image.asset(
                                  MyImgs.errorimage,fit: BoxFit.cover,
                                ),
                          fit: BoxFit.cover,
                          ),

                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
