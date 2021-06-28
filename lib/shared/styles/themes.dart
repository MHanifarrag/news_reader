import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: HexColor('ffffff'),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('137de8'),
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: HexColor('137de8'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: HexColor('0e5caa'),
    unselectedItemColor: HexColor('1e2e3d').withOpacity(0.5),
    elevation: 10.0,
    backgroundColor: Colors.white,

  ),
  tabBarTheme: TabBarTheme(
    labelColor: HexColor('1e2e3d'),
    unselectedLabelColor: HexColor('0e5caa'),
    indicatorSize: TabBarIndicatorSize.label,
    indicator: BoxDecoration(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0)),
        color: Colors.white ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color:Colors.black87,

    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color:Colors.black87,

    ),
  ),
cardColor: Colors.white,
);
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('15202b'),
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('1D364F'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('1D364F'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: HexColor('ffffff'),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: HexColor('6baef2'),
    elevation: 10.0,
    backgroundColor: HexColor('1D364F'),
    unselectedItemColor: HexColor('3d5266'),
  ),
  tabBarTheme: TabBarTheme(
    labelColor:  HexColor('6baef2'),
    unselectedLabelColor: HexColor('3d5266'),
    indicatorSize: TabBarIndicatorSize.label,
    indicator: BoxDecoration(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0)),
        color: HexColor('15202B') ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color:Colors.white60,

    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color:Colors.white60,

    ),

  ),
  cardColor: HexColor('15202b'),

);



