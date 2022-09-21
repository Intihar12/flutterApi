
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/dimens.dart';
import '../../../values/my_colors.dart';
import '../../../values/my_imgs.dart';


class SubscriptionPlanScreen extends StatelessWidget {
  const SubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
       elevation: 0,
       leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            MyImgs.logo,
            height: Dimens.size14,
            color: MyColors.black2,
            fit: BoxFit.cover,
          ),
        ),
      ),
body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: Dimens.size20),
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      SizedBox(height: Dimens.size20,),

      Center(

        child: Text("Subscription Plan",style: textTheme.headline1!.copyWith(

          color: MyColors.black2,

          fontSize: 24,

          fontWeight: FontWeight.w600,

            fontFamily: "TiemposHeadline-Regular",

        ),),

      ),

      SizedBox(height: Dimens.size20,),

      Center(

        child: Text("Sample Price",style: textTheme.headline2!.copyWith(

          color: MyColors.black2,

          fontWeight: FontWeight.w500,

          fontFamily: "TiemposHeadline-Regular",

        ),),

      ),

      SizedBox(height: Dimens.size40,),

      featureWidget(context: context, text: "Feature 1 "),

      featureWidget(context: context, text: "Feature 2 "),

      featureWidget(context: context, text: "Feature 3 "),

      featureWidget(context: context, text: "Feature 4 "),

      featureWidget(context: context, text: "Feature 5 "),

      featureWidget(context: context, text: "Feature 6 "),



      SizedBox(height: Dimens.size60,),

      Center(

        child: Container(

          width: Dimens.size280,

          height: Dimens.size48,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(Dimens.size20)),

            color: MyColors.primaryColor

          ),

          child: Center(

            child:  Text("Buy",style: textTheme.headline2!.copyWith(

              color: MyColors.white,

              fontWeight: FontWeight.w500,

              fontFamily: "TiemposHeadline-Regular",

            ),),

          ),

        ),

      )



    ],

  ),
),
    );
  }
  Widget featureWidget({context,text}){
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimens.size20,),
        Text(text,style: textTheme.headline2!.copyWith(
          color: MyColors.black2,
          fontWeight: FontWeight.w500,
          fontFamily: "TiemposHeadline-Regular",
        ),),
      ],
    );
  }
}
