
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../values/dimens.dart';
import '../../values/my_colors.dart';
import '../../values/my_imgs.dart';
import '../my_appoinments/my_appoinments.dart';
import '../pricing/pricing.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      width: Dimens.size310,
      child: Drawer(
        elevation: 10,
        backgroundColor: MyColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimens.size200,
              color: MyColors.viewcolor,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      child: Row(children: [
                        GestureDetector(

                          onTap:(){
                           // Get.to(ProfileSetting());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColors.white,

                            ),
                            height: Dimens.size70,
                            width: Dimens.size70,

                            child: Text("IN"),
                          ),
                        ),
                        SizedBox(
                          width: Dimens.size5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Intihar Hussain",
                              style: TextStyle(
                                  color: MyColors.white500, fontSize: 20),
                            ),
                            Text(
                              "IntiharHussain@gmail.com",
                              style: textTheme.headline3!.copyWith(fontSize: 15),
                            ),

                          ],
                        ),
                      ],) ,
                    ),


                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0,),
                      child: Icon(Icons.arrow_back_ios,color: MyColors.white,),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Dimens.size11,
            ),

            SizedBox(
              height: Dimens.size20,
            ),
            drawerCard(
                context: context,//img: MyImgs.home1,
                title: "My Appointments",
                onTap: () {
                 Get.to(()=>MyAppointments());
                }),
            drawerCard(
                context: context,
               // img: MyImgs.order1,
                title: "Pricing",
                onTap: () {
                  Get.to(()=>Pricing());
                }),
            drawerCard(
                context: context,
                //img: MyImgs.locationIcon1,
                title: "Saved Addressed",
                onTap: () {
                  //Get.to(RequestListSeller());
                }),
            drawerCard(
                context: context,
               // img: MyImgs.card1,
                title: "My Cards",
                onTap: () {
                // Get.to(MyCard());
                }),
            Divider(color: MyColors.black.withOpacity(0.6),),


          ],
        ),
      ),
    );
  }

  Widget drawerCard({context, img, title, onTap}) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.size15, top: Dimens.size10, bottom: Dimens.size10),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 22.0),
            //   child: ImageIcon(
            //     AssetImage(img),
            //     color: MyColors.primaryColor,
            //   ),
            // ),
            SizedBox(
              width: Dimens.size22,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: MyColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
