
import 'package:flutter/material.dart';
import 'package:gymboo_admin/utils/constants/image_strings.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/constants/text_strings.dart';

class gbLoginHeader extends StatelessWidget {
  const gbLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
              width: 200,
              height: 100,
              image: AssetImage(gbImages.darkAppGLLogo )
          ),
         // const SizedBox(height: 1),
          Text(gbTexts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: gbSizes.sm),
          Text(gbTexts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}