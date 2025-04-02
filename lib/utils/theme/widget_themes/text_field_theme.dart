import 'package:flutter/material.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class gbTextFormFieldTheme {
  gbTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: gbColors.darkGrey,
    suffixIconColor: gbColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: gbSizes.fontSizeMd, color: gbColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: gbSizes.fontSizeSm, color: gbColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: gbColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: gbColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: gbColors.darkGrey,
    suffixIconColor: gbColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: gbSizes.fontSizeMd, color: gbColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: gbSizes.fontSizeSm, color: gbColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: gbColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: gbColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(gbSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: gbColors.warning),
    ),
  );
}
