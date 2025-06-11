import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'styles.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "myFont",
  colorScheme: const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: primaryColor,
    error: cancelledColor,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    bodyLarge: TextStyles.textStyle20.copyWith(
        fontFamily: "myFont", color: blackColor, fontWeight: FontWeight.w700),
    bodyMedium: TextStyles.textStyle18.copyWith(
      fontFamily: "myFont",
      color: whiteColor,
    ),
  ),
  appBarTheme: AppBarTheme(
      elevation: 1.0,
      backgroundColor: primaryColor,
      titleTextStyle: TextStyles.textStyle20
          .copyWith(fontFamily: "myFont", color: blackColor),
      iconTheme: const IconThemeData(color: Colors.black)),
  scaffoldBackgroundColor: whiteColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue[400]!,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: primaryColor,
  ),
);

ThemeData darkTheme = ThemeData(
  fontFamily: "myFont",
  colorScheme: const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: primaryColor,
    error: cancelledColor,
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 1.0,
    titleTextStyle: TextStyles.textStyle20
        .copyWith(fontFamily: "myFont", color: whiteColor),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: primaryColor,
  ),
  scaffoldBackgroundColor: primaryColor,
  textTheme: TextTheme(
    bodyLarge: TextStyles.textStyle20.copyWith(
        fontFamily: "myFont", color: whiteColor, fontWeight: FontWeight.w700),
    bodyMedium: TextStyles.textStyle18.copyWith(
      fontFamily: "myFont",
      color: blackColor,
    ),
  ),
);
