import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymboo_admin/features/authentication/controllers/login_controller.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/constants/text_strings.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';
import 'package:gymboo_admin/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class gbLoginForm extends StatelessWidget {
  const gbLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: gbSizes.spaceBtwSections),
        child: Column(
          children: [
            //correo
            TextFormField(
                controller: controller.email,
                validator: gbValidator.validateEmail,
                //initialValue: 'avega.ch@gmail.com',
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: gbTexts.email)),
            const SizedBox(
              height: gbSizes.spaceBtwInputFields,
            ),

            //password
            Obx(
              () => TextFormField(
                  controller: controller.password,
                  validator: (value) => gbValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  //initialValue: 'Mxyzptlk130180',
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: gbTexts.password,
                      suffix: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon:   Icon(controller.hidePassword.value ?  Iconsax.eye_slash: Iconsax.eye)
                      )
                  )
              ),
            ),
            const SizedBox(
              height: gbSizes.spaceBtwInputFields / 2,
            ),
            //Remember me Y forget password
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //remember me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value ,
                          onChanged: (value) => controller.rememberMe.value = value!
                      ),
                    ),
                    const Text(gbTexts.rememberMe)
                  ],
                ),
                //ForgetPassword
                TextButton(
                    onPressed: () => Get.toNamed(gbRoutes.forgetPassword),
                    child: const Text(gbTexts.forgetPassword))
              ],
            ),
            const SizedBox(
              height: gbSizes.spaceBtwSections,
            ),
            //Sigin
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.emailPasswordSigIn(),


                child: const Text(gbTexts.signIn)
                  //child: ElevatedButton(onPressed: () => controller.emailPasswordSigIn() , child: const Text(gbTexts.signIn)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
