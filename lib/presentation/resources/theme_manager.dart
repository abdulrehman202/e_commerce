import 'package:flutter/material.dart';
import 'package:e_commerce/presentation/resources/color_manager.dart';
import 'package:e_commerce/presentation/resources/styles_manager.dart';
import 'package:e_commerce/presentation/resources/values_manager.dart';
import 'package:e_commerce/presentation/resources/font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of app
    primaryColor: ColorManager.purple,

    //App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.purple,
      elevation: AppSize.s4,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),
    //Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.yellow,
      splashColor: ColorManager.primaryOpacity70,
    ),
    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
        color: ColorManager.white,
      ),
      backgroundColor: ColorManager.yellow,
      shape: const StadiumBorder(),
    )),
    //Text theme
    textTheme: TextTheme(
      titleLarge: getBoldStyle(color: Colors.black, fontSize: FontSize.s16),
      labelMedium:
          getBoldStyle(color: ColorManager.purple, fontSize: FontSize.s14),
    ),
    //input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
