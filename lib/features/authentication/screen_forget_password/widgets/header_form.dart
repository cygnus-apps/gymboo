
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/constants/text_strings.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Header
        IconButton(onPressed:() => Get.back(), icon: const Icon(Iconsax.arrow_left) ),
        const SizedBox(height: gbSizes.spaceBtwItems,),
        Text(gbTexts.forgetPassword, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: gbSizes.spaceBtwItems,),
        Text(gbTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
        const SizedBox(height: gbSizes.spaceBtwSections*2,),


        //Formulario
        Form(child: TextFormField(
          decoration: const InputDecoration(labelText: gbTexts.email, prefix: Icon(Iconsax.direct_right)
          ) ,
        )
        ),

        const SizedBox(height: gbSizes.spaceBtwSections,),

        //summit boton
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(

            onPressed: () => Get.toNamed(gbRoutes.resetPassword,parameters: {'email':'avega@gmail.com'}),
            child: const Text(gbTexts.submit),
          ),
        ),

      ],
    );
  }
}