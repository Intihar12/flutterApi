import 'package:another_xlider/another_xlider.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterapis/controller/SellerListController/SellerListController.dart';
import 'package:flutterapis/values/my_colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../values/dimens.dart';
import '../seller_list_filters_applied/seller_list_filters_applied.dart';

class Filters extends StatelessWidget {
  Filters({Key? key}) : super(key: key);
  final controller = Get.put(SellerListController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return GetBuilder<SellerListController>(builder: (controllerbuilder) {
      return Scaffold(
          backgroundColor: MyColors.cardGrey,
          appBar: AppBar(
            backgroundColor: MyColors.viewcolor,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Icon(Icons.clear),
                SizedBox(
                  width: 15,
                ),
                Text("Filtters"),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Clear All",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          body: controller.isFilterLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          color: MyColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sort by",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FilterButton(
                                      index: 1,
                                      ontap: () {
                                        controller.isDistance = 1;
                                        controller.update();
                                      },
                                      text: "Distance",
                                      select: controller.isDistance,
                                    ),
                                    FilterButton(
                                      index: 2,
                                      ontap: () {
                                        controller.isDistance = 2;
                                        controller.update();
                                      },
                                      text: "rating",
                                      select: controller.isDistance,
                                    ),
                                    FilterButton(
                                      index: 3,
                                      ontap: () {
                                        controller.isDistance = 3;
                                        controller.update();
                                      },
                                      text: "availability",
                                      select: controller.isDistance,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: MyColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Ratings Minimum"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 0,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          //  itemPadding: EdgeInsets.symmetric(horizontal: 0.4),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            size: 2,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            controllerbuilder.starsRating =
                                                rating;
                                            controllerbuilder.update();
                                            print("ratting ${rating}");
                                          },
                                        ),
                                        // RatingBarIndicator(
                                        //   //rating: 4.50,
                                        //   itemBuilder: (context, index) => Icon(
                                        //     Icons.star,
                                        //     color: MyColors.starsColor,
                                        //   ),
                                        //   itemCount: 5,
                                        //   itemSize: Dimens.size18,
                                        //   direction: Axis.horizontal,
                                        //
                                        //
                                        // ),
                                        Text(
                                            "${controllerbuilder.starsRating}  stars")
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: MyColors.white,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Text("Distance"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                  activeTrackColor: MyColors.viewcolor,
                                  inactiveTrackColor:
                                      MyColors.grey.withOpacity(0.1),

                                  thumbColor: MyColors.viewcolor,
                                  showValueIndicator: ShowValueIndicator.always,
                                  valueIndicatorColor: MyColors.viewcolor,
                                  valueIndicatorTextStyle: textTheme.bodyText1!
                                      .copyWith(color: MyColors.white),
                                  trackHeight: 8,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 12.0),
                                  // overlayShape: SliderComponentShape.noOverlay,
                                  // overlayColor: AppColor.behan24
                                ),
                                child: Slider(
                                  value: double.parse(controllerbuilder
                                      .sliderValue
                                      .toStringAsFixed(2)),
                                  //value: 2,
                                  label:
                                      "${controllerbuilder.sliderValue.toStringAsFixed(2)} KM",
                                  // label: "km",
                                  min: 0,
                                  max: 100,
                                  onChanged: (value) {
                                    double val = value;
                                    String slider = val.toStringAsFixed(3);
                                    controllerbuilder.sliderValue =
                                        double.parse(slider);
                                    controllerbuilder.update();
                                    Get.log(
                                        "Distance ..... : ${controllerbuilder.sliderValue}");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("0 KM"),
                                    Text("${controllerbuilder.sliderValue} KM")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: MyColors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Available date"),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                        "${controllerbuilder.dateformet}")),
                                DatePicker(
                                  DateTime.now(),
                                  initialSelectedDate: DateTime.now(),
                                  selectionColor: MyColors.viewcolor,
                                  selectedTextColor: Colors.white,
                                  onDateChange: (date) {
                                    controllerbuilder.dateTime = date;
                                    controllerbuilder.dateformet =
                                        DateFormat('MMM-dd-yyyy')
                                            .format(controllerbuilder.dateTime);

                                    controller.update();
                                    Get.log(
                                        "date ...ddj  ${controllerbuilder.dateformet}");
                                    // New date selected
                                    // setState(() {
                                    //   _selectedValue = date;
                                    // });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilterButn(
                              index: 4,
                              ontap: () {
                                controller.isMorning = 4;
                                controller.update();
                              },
                              text: "Morning",
                              select: controller.isMorning,
                            ),
                            FilterButn(
                              index: 5,
                              ontap: () {
                                controller.isMorning = 5;
                                controller.update();
                              },
                              text: "Evening",
                              select: controller.isMorning,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controllerbuilder.filterSellerFunctions(
                            );
                            // Get.to(FilterSellerListPage());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: MyColors.viewcolor),
                            child: Text(
                              "Apply Filters",
                              style: TextStyle(color: MyColors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
    });
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton(
      {Key? key,
      required this.text,
      required this.select,
      required this.index,
      required this.ontap})
      : super(key: key);
  final String text;
  final int select;
  final int index;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 36,
        width: 80,
        decoration: BoxDecoration(
            color: select == index ? MyColors.viewcolor : MyColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: select == index
                    ? MyColors.viewcolor
                    : MyColors.black.withOpacity(0.4))),
        child: Text(
          text,
          style: TextStyle(
              color: select == index ? MyColors.white : MyColors.black),
        ),
      ),
    );
  }
}

class FilterButn extends StatelessWidget {
  const FilterButn(
      {Key? key,
      required this.text,
      required this.select,
      required this.index,
      required this.ontap})
      : super(key: key);
  final String text;
  final int select;
  final int index;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 36,
        width: 130,
        decoration: BoxDecoration(
            color: select == index ? MyColors.viewcolor : MyColors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: select == index
                    ? MyColors.viewcolor
                    : MyColors.black.withOpacity(0.4))),
        child: Text(
          text,
          style: TextStyle(
              color: select == index ? MyColors.white : MyColors.black),
        ),
      ),
    );
  }
}
