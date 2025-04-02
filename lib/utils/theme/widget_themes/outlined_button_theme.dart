import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class gbOutlinedButtonTheme {
  gbOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: gbColors.dark,
      side: const BorderSide(color: gbColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: gbColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: gbSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(gbSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: gbColors.light,
      side: const BorderSide(color: gbColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: gbColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: gbSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(gbSizes.buttonRadius)),
    ),
  );
}
