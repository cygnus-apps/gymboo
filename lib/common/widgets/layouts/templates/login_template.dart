
import 'package:flutter/cupertino.dart';
import 'package:gymboo_admin/common/styles/spacing_styles.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/helpers/helper_functions.dart';

class gbLoginTemplate extends StatelessWidget {
  const gbLoginTemplate({
    super.key, required this.child,
  });

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 450,
        child: SingleChildScrollView(
          child: Container(
              padding: gbSpacingStyle.paddingWithAppBarHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gbSizes.cardRadiusLg),
                  color: gbHelperFunctions.isDarkMode(context) ? gbColors.black : gbColors.white,
                  border: Border.all(color: gbColors.neonPink) ),
              child: child
          ),
        ),
      ),
    );
  }
}
