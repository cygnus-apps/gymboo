import 'package:flutter/material.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/appbar_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/chip_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/text_field_theme.dart';
import 'package:gymboo_admin/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class gbAppTheme {
  gbAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: gbColors.grey,
    brightness: Brightness.light,
    primaryColor: gbColors.primary,
    textTheme: gbTextTheme.lightTextTheme,
    chipTheme: gbChipTheme.lightChipTheme,
    scaffoldBackgroundColor: gbColors.white,
    appBarTheme: gbAppBarTheme.lightAppBarTheme,
    checkboxTheme: gbCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: gbBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: gbElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: gbOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: gbTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: gbColors.grey,
    brightness: Brightness.dark,
    primaryColor: gbColors.primary,
    textTheme: gbTextTheme.darkTextTheme,
    chipTheme: gbChipTheme.darkChipTheme,
    scaffoldBackgroundColor: gbColors.black,
    appBarTheme: gbAppBarTheme.darkAppBarTheme,
    checkboxTheme: gbCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: gbBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: gbElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: gbOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: gbTextFormFieldTheme.darkInputDecorationTheme,
  );
}
