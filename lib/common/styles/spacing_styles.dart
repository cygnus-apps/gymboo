import 'package:flutter/material.dart';

import '/utils/constants/sizes.dart';

class gbSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: gbSizes.appBarHeight,
    left: gbSizes.defaultSpace,
    bottom: gbSizes.defaultSpace,
    right: gbSizes.defaultSpace,
  );
}
