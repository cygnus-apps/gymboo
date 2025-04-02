import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/utils/constants/image_strings.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/constants/text_strings.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  //final String email;

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(

      children: [
        //Header
        Row(
          children: [
            IconButton(onPressed: () => Get.offAllNamed(gbRoutes.login), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(height: gbSizes.spaceBtwItems,),

        //Image
        const Image(image: AssetImage(gbImages.deliveredEmailIllustration), width: 200 , height:  200,),
        const SizedBox(height: gbSizes.spaceBtwItems,),

        //Title & subtitle
        Text(gbTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: gbSizes.spaceBtwItems),
        Text(email, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: gbSizes.spaceBtwItems),
        Text(
          gbTexts.changeYourPasswordSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: gbSizes.spaceBtwSections),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.back(), child: const Text(gbTexts.done)),
        ), // SizedBox
        const SizedBox(height: gbSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: (){}, child: const Text(gbTexts.resendEmail)),
        ), // SizedBox

      ],
    );
  }
}