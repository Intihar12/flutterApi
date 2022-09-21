
import 'package:flutter/material.dart';

import '../values/my_colors.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons(
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