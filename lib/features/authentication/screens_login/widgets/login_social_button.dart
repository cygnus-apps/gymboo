import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart'

import 'package:get/get.dart';import 'package:get/get_core/src/get_main.dart';
import 'package:gymboo_admin/features/authentication/controllers/login_controller.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';
import 'package:gymboo_admin/utils/constants/image_strings.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';

class gbSocialButton extends StatelessWidget{
  const gbSocialButton ({super.key});







  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration:  BoxDecoration(border: Border.all(color: gbColors.grey), borderRadius: BorderRadius.circular(100)),
        child: /*IconButton(onPressed: ()=> controller.,
            icon: const Image(width:  gbSizes.iconMd ,
                              height: gbSizes.iconMd,
                              image: AssetImage(gbImages.google
                              ),
            )
        ),*/

      SizedBox.shrink()
      ),
    ],
  );
  }

}