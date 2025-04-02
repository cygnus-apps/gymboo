import 'package:flutter/material.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class gbAppBarTheme{
  gbAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: gbColors.black, size: gbSizes.iconMd),
    actionsIconTheme: IconThemeData(color: gbColors.black, size: gbSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: gbColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: gbColors.black, size: gbSizes.iconMd),
    actionsIconTheme: IconThemeData(color: gbColors.white, size: gbSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: gbColors.white),
  );
}