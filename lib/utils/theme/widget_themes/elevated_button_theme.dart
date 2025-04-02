import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class gbElevatedButtonTheme {
  gbElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: gbColors.light,
      backgroundColor: gbColors.primary,
      disabledForegroundColor: gbColors.darkGrey,
      disabledBackgroundColor: gbColors.buttonDisabled,
      side: const BorderSide(color: gbColors.primary),
      padding: const EdgeInsets.symmetric(vertical: gbSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: gbColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(gbSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: gbColors.light,
      backgroundColor: gbColors.primary,
      disabledForegroundColor: gbColors.darkGrey,
      disabledBackgroundColor: gbColors.darkerGrey,
      side: const BorderSide(color: gbColors.primary),
      padding: const EdgeInsets.symmetric(vertical: gbSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: gbColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(gbSizes.buttonRadius)),
    ),
  );
}
