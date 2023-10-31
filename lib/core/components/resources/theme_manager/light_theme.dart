import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_manager.dart';
import '../font_manager.dart';

ThemeData lightTheme(){
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: const AppBarTheme(
      foregroundColor: ColorManager.lightBlack,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.mainColor,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: ColorManager.mainColor,
        fontSize: 30,
        fontWeight: FontWeightManager.bold,
      ),
    ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 40,
            color: ColorManager.mainColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.semiBold),
        titleLarge: TextStyle(
            fontSize: 22,
            color: ColorManager.mainColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.bold),
        bodyLarge: TextStyle(
            fontSize: 18,
            color: ColorManager.mainColor,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.bold),
        bodyMedium: TextStyle(
            fontSize: 16,
            color: ColorManager.black,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.semiBold),
        bodySmall: TextStyle(
            fontSize: 14,
            color: ColorManager.grey,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.regular),
        displaySmall: TextStyle(
            fontSize: 15,
            color: ColorManager.grey,
            fontFamily: FontConstants.mainFontFamily,
            fontWeight: FontWeightManager.regular),

      )
  );
}