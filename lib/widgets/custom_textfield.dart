import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../values/dimens.dart';
import '../values/my_colors.dart';

class CustomTextField3 extends StatelessWidget {
  final double? height;
  final double? width;
  final double? roundCorner;
  final Color? bordercolor;
  final Color? background;
  final String text;
  final int length;
  final TextInputType keyboardType;
  final TextInputFormatter inputFormatters;
  bool? Readonly = false;
  final Widget? icon;
  final suffixIcon;
  final InputBorder? border;
  final String? errorText;
  final FocusNode? focusNode;
  final String? suffixtext;
  final Color? hintColor;
  final Color? textColor;
  final Color? cursorColor;
  final int? maxlines;
  final Color? color;
  final bool? isObscure;

  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;

  CustomTextField3({
    Key? key,
    this.height,
    this.width,
    this.roundCorner,
    this.suffixIcon,
    this.bordercolor,
    this.background,
    this.controller,
    this.border,
    this.maxlines,
    required this.text,
    this.validator,
    this.onChanged,
    this.errorText,
    this.Readonly,
    this.focusNode,
    this.hintColor,
    this.icon,
    this.color,
    this.suffixtext,
    required this.length,
    required this.keyboardType,
    required this.inputFormatters,
    this.isObscure,
    this.textColor,
    this.cursorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: height ?? 45,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyColors.textFieldColor.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: background ?? MyColors.textFieldColor,
          borderRadius: BorderRadius.circular(roundCorner ?? 16)),
      child: TextFormField(
        obscuringCharacter: '*',
        maxLength: length,
        cursorHeight: 25,
        maxLines: maxlines ?? 1,
        focusNode: focusNode,
        validator: (value) {
          if (value == "" || value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        style: textTheme.bodyText1!
            .copyWith(fontSize: 16, color: textColor ?? MyColors.black),
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: cursorColor ?? MyColors.black,
        inputFormatters: <TextInputFormatter>[inputFormatters],
        textInputAction: TextInputAction.next,
        readOnly: Readonly == true ? true : false,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(

          border: InputBorder.none,
          errorText: errorText,
          counterText: "",
          enabledBorder: border ?? InputBorder.none,
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: color ?? MyColors.purple, width: 2),
          // ),
          // errorBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: MyColors.red500, width: 2),
          // ),
          hintText: text,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
              color: hintColor ?? MyColors.hintText,
              fontWeight: FontWeight.normal,
              fontSize: 12),
          contentPadding:  EdgeInsets.only(left: 15,bottom: Dimens.size8,top: 12),
          prefixIcon: Padding(
            padding:  EdgeInsets.all( Dimens.size8),
            child: icon,
          ),
          errorStyle:  TextStyle(fontSize: 0),
          suffixText: suffixtext,
          focusColor: MyColors.green50,
        ),
      ),
    );
  }
}
