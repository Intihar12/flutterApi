
import 'package:flutter/material.dart';
import 'package:flutterapis/widgets/serviceses.dart';
import 'package:get/get.dart';


import '../controller/tabbarcontroller/tabbarcontroller.dart';
import '../values/dimens.dart';
import '../values/my_colors.dart';
import 'about.dart';
import 'gallery.dart';


class MyTabbedWidget extends StatelessWidget {
  const MyTabbedWidget();

  @override
  Widget build(BuildContext context) {
    final MyTabController _tabx = Get.put(MyTabController());
    // ↑ init tab controller

    return Scaffold(
backgroundColor: MyColors.cardGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),

        child: AppBar(

        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        )  ),
          elevation: 0,
 backgroundColor: MyColors.cardGrey,
          automaticallyImplyLeading: false,

          bottom: TabBar(

            indicator: UnderlineTabIndicator(
              insets: EdgeInsets.only(left:Dimens.size50,right: Dimens.size50),
              borderSide: BorderSide(
                color: MyColors.starsColor,
                width: 5.0,
              ),
            ),
            labelColor: Colors.black,
            controller: _tabx.controller,
            tabs: _tabx.myTabs,
          ),
        ),
      ),
      body: TabBarView(

        controller: _tabx.controller,
        children: [
          About(),
          Serviceses(),
          Gallery()
          // ProductScreenWidget(),
          // AboutWidget(),
          // ReviewsWidget(),
        ],

      ),
    );
  }
}