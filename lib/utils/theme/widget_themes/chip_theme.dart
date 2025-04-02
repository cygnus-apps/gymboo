import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class gbChipTheme {
  gbChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: gbColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: gbColors.black),
    selectedColor: gbColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: gbColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: gbColors.darkerGrey,
    labelStyle: TextStyle(color: gbColors.white),
    selectedColor: gbColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: gbColors.white,
  );
}
