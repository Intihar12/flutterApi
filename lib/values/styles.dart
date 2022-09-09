import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dimens.dart';
import 'my_colors.dart';
import 'my_fonts.dart';

class Styles {
  static final appTheme = _baseTheme.copyWith(
    iconTheme: const IconThemeData(
      color: MyColors.black,
      size: Dimens.size20,
    ),
    textTheme: _baseTextTheme,
    accentTextTheme: _accentTextTheme,
    cardTheme: _baseTheme.cardTheme.copyWith(
      margin: EdgeInsets.zero,
    ),
    textSelectionTheme: _baseTheme.textSelectionTheme.copyWith(
      cursorColor: _colorScheme.secondary,
      selectionHandleColor: _colorScheme.secondary,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: MyColors.white,
        titleTextStyle: TextStyle(
            fontSize: 16,
            fontFamily: MyFonts.typos,
            fontWeight: FontWeight.w600,
            color: MyColors.black)),
    scrollbarTheme: ScrollbarThemeData(
        isAlwaysShown: true,
        showTrackOnHover: true,
        interactive: true,
        trackColor:
            MaterialStateProperty.all(MyColors.greyFont.withOpacity(0.3)),
        trackVisibility: MaterialStateProperty.all(true),
        thickness: MaterialStateProperty.all(5),
        thumbColor: MaterialStateProperty.all(MyColors.primaryColor),
        radius: Radius.circular(10),
        minThumbLength: 60),
  );

  static final secondaryTextTheme = _baseTextTheme.apply(
    displayColor: MyColors.white,
    bodyColor: MyColors.white200,
  );

  static final onSecondaryTextTheme = _baseTextTheme.apply(
    displayColor: MyColors.black,
    bodyColor: MyColors.black,
  );

  static const _colorScheme = ColorScheme.light(
    primary: MyColors.primaryColor,
    secondary: MyColors.secondaryColor,
    onPrimary: MyColors.white,
    onSecondary: MyColors.parpal,
    onBackground: MyColors.appBackground,
  );

  static final _baseTheme = ThemeData.from(
    colorScheme: _colorScheme,
    textTheme: Typography.material2018().black.apply(
          fontFamily: MyFonts.typos,
          displayColor: _colorScheme.secondary,
          bodyColor: _colorScheme.secondary,
        ),
  );

  static final _baseTextTheme = _baseTheme.textTheme.copyWith(
    headline1: _baseTheme.textTheme.headline1!.copyWith(
      color: MyColors.black,
      fontSize: 24,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: MyFonts.typosBold,
    ),
    headline2: _baseTheme.textTheme.headline2!.copyWith(
      color: MyColors.black,
      fontSize: 20,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: MyFonts.typosBold,
    ),
    headline3: _baseTheme.textTheme.headline3!.copyWith(
      fontSize: 16,
      color: MyColors.primaryColor,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: 'typos',
    ),
    headline4: _baseTheme.textTheme.headline4!.copyWith(
      color: MyColors.black,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: MyFonts.typosSemi,
    ),
    headline5: _baseTheme.textTheme.headline5!.copyWith(
      fontSize: 14,
      color: MyColors.white,
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontFamily: MyFonts.typos,
    ),
    headline6: _baseTheme.textTheme.headline6!.copyWith(
      fontSize: 12,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: 'typos',
    ),
    bodyText1: _baseTheme.textTheme.bodyText1!.copyWith(
      fontSize: 14,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.normal,
      fontFamily: MyFonts.typos,
    ),
    bodyText2: _baseTheme.textTheme.bodyText2!.copyWith(
      fontSize: 14,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.w400,
      fontFamily: 'typos',
    ),
    subtitle1: _baseTheme.textTheme.subtitle1!.copyWith(
      fontSize: 12,
      color: MyColors.black,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: 'typos',
    ),
    subtitle2: _baseTheme.textTheme.subtitle2!.copyWith(
        fontSize: 10,
        color: MyColors.black.withOpacity(0.6),
        //  decoration: TextDecoration.underline,
        height: 1.5,
        fontFamily: MyFonts.typos,
        fontWeight: FontWeight.normal),
    caption: _baseTheme.textTheme.caption!.copyWith(
      fontSize: 12,
      color: MyColors.greyFont,
      height: 1.5,
      fontFamily: 'typos',
    ),
    overline: _baseTheme.textTheme.overline!.copyWith(
      fontSize: 8,
      color: MyColors.grey,
      height: 1.5,
      fontFamily: 'typos',
    ),
  );

  static final _accentTextTheme = _baseTextTheme.apply(
    displayColor: _colorScheme.secondary,
    bodyColor: _colorScheme.secondary,
  );

  Styles._();
}
