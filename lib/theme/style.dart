import 'package:flutter/material.dart';
import 'package:go_pool/theme/colors.dart';

ThemeData uiTheme() {
  return ThemeData(
    unselectedWidgetColor: Colors.grey[200],
    fontFamily: 'Poppins',
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 13, color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
    dividerColor: backgroundColor,
    primaryColor: Color(0xff0FC874),
    textTheme: TextTheme(
      labelLarge: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(
        color: Color(0xff4d4d4d),
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Color(0xffa3bccf),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(color: Colors.white, fontSize: 20),
      titleMedium: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.white,
      background: Color(0xffEBF3F9),
    ),
  );
}
