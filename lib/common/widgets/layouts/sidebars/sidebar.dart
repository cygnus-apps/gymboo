import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymboo_admin/common/widgets/images/t_circular_image.dart';
import 'package:gymboo_admin/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:gymboo_admin/features/searchboards/controllers/search_board_controller.dart';
import 'package:gymboo_admin/utils/constants/colors.dart';
import 'package:gymboo_admin/utils/constants/image_strings.dart';
import 'package:gymboo_admin/utils/constants/sizes.dart';
import 'package:gymboo_admin/utils/routes/routes.dart';
import 'package:iconsax/iconsax.dart';
import  'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols_map.dart';

import 'package:url_launcher/url_launcher.dart';



class gbSitebar extends StatelessWidget {
  const gbSitebar({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: gbColors.white,
          border: Border(right: BorderSide(color: gbColors.lightGrey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              const gbCircularImage(width: 75, height: 75, image: gbImages.darkAppLogo,backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: gbSizes.spaceBtwSections,),
               Padding(
                   padding: const EdgeInsets.all(gbSizes.md),
                    child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Menu', style: Theme.of(context).textTheme.bodySmall!.apply(),),
                            //Menu Items


                            const gbMenuItem(icon: Iconsax.setting_2,   itemName: 'Parametros', colori: gbColors.primary),
                            const SizedBox(height: gbSizes.spaceBtwItems,),
                            const gbMenuItem(icon: Symbols.exercise,  itemName: 'Gimnasio', colori: gbColors.primary),
                            const SizedBox(height: gbSizes.spaceBtwItems,),
                            const gbMenuItem(icon: Iconsax.activity,  itemName: 'Entrenamiento', colori: gbColors.primary),
                            const SizedBox(height: gbSizes.spaceBtwItems,),
                            const gbMenuItem(icon: Iconsax.mobile,  itemName: 'App', colori: gbColors.primary),
                            const SizedBox(height: gbSizes.spaceBtwItems,),

                          ],
                        )

               ),

            ], //column children
          ),
        ),
      ),
    );
  }
}

